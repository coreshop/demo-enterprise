#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- php-fpm "$@"
fi

/usr/local/bin/wait_db
/usr/local/bin/install
bin/console coreshop:install
COMPOSER_MEMORY_LIMIT=-1 composer dump-autoload --classmap-authoritative --optimize
bin/console coreshop:install:demo
bin/console pimcore:bundle:install PimcoreSimpleBackendSearchBundle
bin/console pimcore:bundle:install PimcoreCustomReportsBundle
bin/console pimcore:bundle:install PimcoreDataHubBundle
bin/console datahub:configuration:rebuild-workspaces

if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ]; then
  mkdir -p var/cache var/log public/var
  bin/console pimcore:deployment:classes-rebuild --no-interaction || true
fi

exec docker-php-entrypoint "$@"
