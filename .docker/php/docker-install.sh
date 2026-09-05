#!/bin/sh
set -e

echo "Generate JWT keypair (headless API)"
bin/console lexik:jwt:generate-keypair --skip-if-exists --no-interaction || true

echo "Install Pimcore"
vendor/bin/pimcore-install --skip-database-config --no-interaction

rm -rf var/config/system.yml
rm -rf var/cache

touch /var/www/html/var/tmp/.pimcore_installed
