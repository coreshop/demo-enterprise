#!/bin/sh
set -e

# Installs Pimcore, CoreShop, the enterprise bundles and the demo data through the install profile
# App\InstallProfile\EnterpriseDemoInstallProfile (see src/InstallProfile). Runs once: when the
# database already holds a Pimcore installation only the pending Doctrine migrations of
# Pimcore, its bundles and CoreShop are executed (image updates ship new migrations).
#
# Everything is read from the environment (Kubernetes secret / docker compose .env):
#   DATABASE_URL                     Doctrine DSN of the app database (from .env / the environment)
#   PIMCORE_OPENSEARCH_DSN           OpenSearch endpoint of the Generic Data Index
#   PIMCORE_ENCRYPTION_SECRET        defuse key for pimcore.encryption.secret
#   PIMCORE_INSTANCE_IDENTIFIER      Pimcore instance identifier
#   PIMCORE_PRODUCT_KEY              Pimcore product key
#   PIMCORE_INSTALL_ADMIN_USERNAME   admin user to create
#   PIMCORE_INSTALL_ADMIN_PASSWORD   password of that user
for var in PIMCORE_ENCRYPTION_SECRET PIMCORE_INSTANCE_IDENTIFIER PIMCORE_PRODUCT_KEY PIMCORE_INSTALL_ADMIN_USERNAME PIMCORE_INSTALL_ADMIN_PASSWORD; do
  if [ -z "$(printenv "$var")" ]; then
    echo "$var is not set" >&2
    exit 1
  fi
done

# Headless bundle (GraphQL API) authenticates with JWT; the key pair is generated per installation
mkdir -p config/jwt
bin/console lexik:jwt:generate-keypair --skip-if-exists --no-interaction || true

if php -r 'require "vendor/autoload.php"; (new Symfony\Component\Dotenv\Dotenv())->bootEnv(".env"); $u = parse_url($_ENV["DATABASE_URL"] ?? ""); $pdo = new PDO(sprintf("mysql:host=%s;port=%d;dbname=%s", $u["host"], $u["port"] ?? 3306, ltrim($u["path"], "/")), $u["user"], $u["pass"]); exit($pdo->query("SHOW TABLES LIKE \"users\"")->rowCount() > 0 ? 0 : 1);' 2>/dev/null; then
  echo "Pimcore is already installed, running pending database migrations"
  bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
  # A pod that starts from the baked mysql image (.docker/bake/bake.sh) has the database but an
  # empty OpenSearch: recreate the indices and queue every element, the supervisord worker
  # (pimcore_generic_data_index_queue) fills them in the background. OpenSearch is a sidecar
  # that boots in parallel, wait for it (at most two minutes) before creating the indices.
  opensearch_url=$(printenv PIMCORE_OPENSEARCH_DSN | sed -e 's#^opensearch://#http://#' -e 's#[?].*$##')
  if [ -n "$opensearch_url" ]; then
    i=0
    until curl -sf -o /dev/null "$opensearch_url" || [ $i -ge 60 ]; do
      echo "Waiting for OpenSearch at $opensearch_url ..."; i=$((i + 1)); sleep 2
    done
  fi
  bin/console generic-data-index:update:index --recreate_index
  exit 0
fi

export PIMCORE_ADMIN_USER="$PIMCORE_INSTALL_ADMIN_USERNAME"
export PIMCORE_ADMIN_PASSWORD="$PIMCORE_INSTALL_ADMIN_PASSWORD"

echo "Install Pimcore, CoreShop and the enterprise demo data (dump/)"
# The installer re-loads .env with override before it boots the application kernel
# (Installer::bootRealKernel), so the placeholders in .env (empty registration values,
# DATABASE_HOST=db) would replace the runtime environment. Write the runtime values to
# .env.local, which is loaded after .env. docker compose ships its own .env.local, that one
# is left untouched.
if [ ! -f .env.local ]; then
  : > .env.local
  for var in APP_ENV APP_DEBUG APP_SECRET \
             DATABASE_USER DATABASE_PASSWORD DATABASE_NAME DATABASE_HOST DATABASE_PORT DATABASE_VERSION DATABASE_URL \
             PIMCORE_ENCRYPTION_SECRET PIMCORE_INSTANCE_IDENTIFIER PIMCORE_PRODUCT_KEY \
             PIMCORE_OPENSEARCH_DSN PIMCORE_MESSENGER_TRANSPORT_DSN_PREFIX \
             MERCURE_JWT_KEY MERCURE_URL MERCURE_SERVER_URL SENTRY_DSN; do
    value=$(printenv "$var") || continue
    # double-quoted dotenv value: escape backslash, double quote and dollar
    escaped=$(printf '%s' "$value" | sed -e 's/[\\"$]/\\&/g')
    printf '%s="%s"\n' "$var" "$escaped" >> .env.local
  done
  ENV_LOCAL_WRITTEN=1
fi

vendor/bin/pimcore-install \
  --install-profile 'App\InstallProfile\EnterpriseDemoInstallProfile' \
  --skip-validation \
  --no-interaction

# Extract the Studio frontend builds of the CoreShop bundles while the filesystem is writable
# (see README: CoreShop 2026.2.1 / enterprise bundles 2026.2.0 ship them without the
# Resources/public parent directory).
for d in $(find vendor/coreshop -type d -name build-dist); do
  mkdir -p "$(dirname "$d")/public"
done
bin/console cache:warmup

# The cache warmed above must not be reused by php-fpm; a failure to remove it
# (e.g. a bind mount that keeps directory entries) is not fatal.
rm -rf var/cache || true
[ "${ENV_LOCAL_WRITTEN:-}" = 1 ] && rm -f .env.local
