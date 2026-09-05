ARG PHP_VERSION=8.4
ARG DOCKER_BASE_VERSION=7.1.11
ARG NGINX_VERSION=1.26
ARG ALPINE_VERSION=3.21

FROM ghcr.io/cors-gmbh/pimcore-docker/php-fpm:${PHP_VERSION}-alpine${ALPINE_VERSION}-${DOCKER_BASE_VERSION} AS cors_php
WORKDIR /var/www/html

ARG APP_ENV=prod
ENV APP_ENV=$APP_ENV

COPY .docker/php/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
COPY .docker/php/docker-healthcheck.sh /usr/local/bin/health
COPY .docker/php/docker-install.sh /usr/local/bin/install

# ext-imap (PECL on PHP 8.4) for coreshop/inbound-email-rules-bundle (php-imap/php-imap)
RUN set -eux; \
    apk add --no-cache --virtual .imap-build-deps $PHPIZE_DEPS imap-dev openssl-dev krb5-dev; \
    apk add --no-cache c-client krb5-libs; \
    pecl install imap; \
    docker-php-ext-enable imap; \
    apk del .imap-build-deps; \
    php -m | grep -q imap; \
    chmod +x /usr/local/bin/docker-entrypoint; \
    chmod +x /usr/local/bin/install; \
    chmod +x /usr/local/bin/health;

USER www-data

COPY --chown=www-data:www-data composer.* ./
COPY --chown=www-data:www-data bin bin/

# COMPOSER_AUTH (Private Packagist credentials for the CoreShop enterprise bundles) is passed as a
# build secret, it never ends up in an image layer: docker build --secret id=COMPOSER_AUTH,env=COMPOSER_AUTH
RUN --mount=type=secret,id=COMPOSER_AUTH,uid=82 set -eux; \
    export COMPOSER_AUTH="$(cat /run/secrets/COMPOSER_AUTH 2>/dev/null || true)"; \
    COMPOSER_MEMORY_LIMIT=-1 composer install --prefer-dist --no-scripts --no-progress --no-autoloader --no-dev; \
    mkdir -p var/cache var/log public/bundles; \
    chmod +x bin/console; \
    sync;

COPY --chown=www-data:www-data public/index.php public/index.php
COPY --chown=www-data:www-data config config/
COPY --chown=www-data:www-data src src/
COPY --chown=www-data:www-data templates templates/
COPY --chown=www-data:www-data translations translations/
COPY --chown=www-data:www-data var var/
COPY --chown=www-data:www-data .env .env
COPY --chown=www-data:www-data dump dump/
COPY --chown=www-data:www-data public/var/assets public/var/assets/

# The Studio frontend builds of the CoreShop bundles are extracted from Resources/build-dist into
# Resources/public/studio during cache warmup; the extractor needs the parent directory to exist,
# which CoreShop 2026.2.1 and the enterprise bundles 2026.2.0 do not ship (see README).
# The build-time console calls boot the kernel without database, encryption secret and
# product key; the "needs install" marker makes Pimcore skip the product registration
# check for these calls. The real values come from the container environment at runtime.
RUN set -eux; \
    composer dump-autoload; \
    mkdir -p var/config; touch var/config/needs-install.lock; \
    for d in $(find vendor/coreshop -type d -name build-dist); do mkdir -p "$(dirname "$d")/public"; done; \
    bin/console cache:clear --env=$APP_ENV; \
    bin/console assets:install; \
    PIMCORE_DISABLE_CACHE=1 bin/console pimcore:build:classes; \
    rm -f var/config/needs-install.lock; \
    COMPOSER_MEMORY_LIMIT=-1 composer dump-autoload --classmap-authoritative; \
    sync;

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]

FROM ghcr.io/cors-gmbh/pimcore-docker/php-supervisord:${PHP_VERSION}-alpine${ALPINE_VERSION}-${DOCKER_BASE_VERSION} AS cors_php_supervisord

COPY .docker/php/docker-entrypoint-supervisord.sh /usr/local/bin/docker-entrypoint-supervisord

RUN set -eux; \
    chmod +x /usr/local/bin/docker-entrypoint-supervisord;

COPY .docker/supervisord/pimcore.conf /etc/supervisor/conf.d/pimcore.conf
COPY .docker/supervisord/coreshop.conf /etc/supervisor/conf.d/coreshop.conf

ARG APP_ENV=prod
ENV APP_ENV=$APP_ENV
ENV APP_DEBUG=0

USER www-data

COPY --from=cors_php /var/www/html /var/www/html

ENTRYPOINT ["docker-entrypoint-supervisord"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

FROM ghcr.io/cors-gmbh/pimcore-docker/nginx:${NGINX_VERSION}-${DOCKER_BASE_VERSION} AS cors_nginx

COPY .docker/nginx/nginx-default.conf /etc/nginx/conf.d/default.conf
COPY --from=cors_php /var/www/html/public public/
