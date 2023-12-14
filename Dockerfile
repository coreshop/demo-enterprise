ARG PHP_VERSION=8.1
ARG DOCKER_BASE_VERSION=5.1.0
ARG NGINX_VERSION=1.21
ARG ALPINE_VERSION=3.18

FROM europe-west3-docker.pkg.dev/cors-wolke/cors/docker/php-alpine-${ALPINE_VERSION}-fpm:${PHP_VERSION}-${DOCKER_BASE_VERSION} as cors_php
WORKDIR /var/www/html

ARG APP_ENV=prod
ENV APP_ENV=$APP_ENV
ARG COMPOSER_AUTH

COPY .docker/php/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
COPY .docker/php/docker-healthcheck.sh /usr/local/bin/health
COPY .docker/php/docker-install.sh /usr/local/bin/install

RUN set -eux; \
    chmod +x /usr/local/bin/docker-entrypoint; \
    chmod +x /usr/local/bin/install; \
    chmod +x /usr/local/bin/health;

USER www-data

COPY --chown=www-data:www-data composer.* ./
COPY --chown=www-data:www-data bin bin/
COPY --chown=www-data:www-data public/index.php public/index.php
COPY --chown=www-data:www-data public/.htaccess public/.htaccess
COPY --chown=www-data:www-data config config/
COPY --chown=www-data:www-data src src/
COPY --chown=www-data:www-data templates templates/a
COPY --chown=www-data:www-data translations translations/
COPY --chown=www-data:www-data var var/
COPY --chown=www-data:www-data .env .env

RUN set -eux; \
    COMPOSER_MEMORY_LIMIT=-1 composer install --prefer-dist --no-scripts --no-progress; \
    php -d memory_limit=-1 bin/console cache:clear --env=$APP_ENV; \
    mkdir -p var/cache var/log; \
    chmod +x bin/console; \
    sleep 1; \
    bin/console assets:install; \
    PIMCORE_DISABLE_CACHE=1 bin/console pimcore:build:classes; \
    COMPOSER_MEMORY_LIMIT=-1 composer dump-autoload --classmap-authoritative --optimize; \
    sync;

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]

FROM europe-west3-docker.pkg.dev/cors-wolke/cors/docker/nginx:${NGINX_VERSION}-${DOCKER_BASE_VERSION} AS cors_nginx

COPY --from=cors_php /var/www/html/public public/