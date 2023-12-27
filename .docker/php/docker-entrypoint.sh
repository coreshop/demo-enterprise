#!/bin/sh
set -e

/usr/local/bin/wait_db
/usr/local/bin/install

if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ] || [ "$1" = 'supervisord' ]; then
  mkdir -p var/cache var/log public/var
  bin/console pimcore:deployment:classes-rebuild --no-interaction || true
fi

exec docker-php-entrypoint "$@"
