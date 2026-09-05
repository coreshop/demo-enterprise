# CoreShop Enterprise Demo

Demo shop for [CoreShop](https://www.coreshop.com) 2026.x on Pimcore 2026 including the CoreShop enterprise
bundles (batch messenger, customer cluster, deposit, document route, headless, inbound e-mail rules, index geo,
loyalty, payum credit, quick order, ticketing, voucher credit, warehouse) and Pimcore Studio. There is no
classic (ExtJS) admin on this line. The demo data is the migrated data set of the former CoreShop 4
enterprise demo (see [Demo data](#demo-data)).

Live: https://demo4-enterprise.coreshop.org (Studio: `/pimcore-studio`, hosts are being renamed).

## Run locally

Requirements: Docker and Private Packagist credentials for the enterprise bundles (`COMPOSER_AUTH`, see
[Dependencies](#dependencies)). The images are built from `ghcr.io/cors-gmbh/pimcore-docker` (PHP 8.4).

```bash
cp .env .env.local            # set PIMCORE_* (registration) and COMPOSER_AUTH
docker compose up -d
docker compose exec php composer install
docker compose exec php /usr/local/bin/install   # or: restart the php container
```

Then open the shop (`https://coreshop-enterprise-demo.localhost` behind the cors_dev traefik, or the nginx
container directly) and `/pimcore-studio` (user and password from `PIMCORE_INSTALL_ADMIN_USERNAME` /
`PIMCORE_INSTALL_ADMIN_PASSWORD`, default `admin` / `coreshop` in the chart).

The stack consists of MySQL 8, OpenSearch (Generic Data Index / Studio search), Mercure (Studio real-time
updates, served under `/hub`), Gotenberg (PDF), php-fpm, a php-fpm-debug (Xdebug) container, nginx and the
supervisord worker container that runs the messenger consumers (`.docker/supervisord/*.conf`).

## Installation

The first start installs Pimcore, CoreShop, the enterprise bundles and the demo data in one go through the
Pimcore 2026 install profile `App\InstallProfile\EnterpriseDemoInstallProfile` (`src/InstallProfile`):

- `getBundles()`: Studio, Generic Data Index, Generic Execution Engine, Application Logger, SEO, Custom
  Reports, Data Hub, CoreShop and the enterprise bundles
- `getEnvVarDefinitions()`: same as CoreShop's own profile (`DATABASE_URL`, `PIMCORE_OPENSEARCH_DSN`, Doctrine
  messenger transport) plus the Pimcore registration values (`PIMCORE_ENCRYPTION_SECRET`, `PIMCORE_INSTANCE_IDENTIFIER`,
  `PIMCORE_PRODUCT_KEY`)
- `getDataSource()`: Pimcore's `SqlDumpDataSource` restoring `dump/*.sql`, the migrated demo data
- `getPostInstallCommands()`: `pimcore:deployment:classes-rebuild --create-classes` (classes come from
  `var/classes/definition_*.php`), `coreshop:install:folders`, `coreshop:patch:classes --force`,
  `generic-data-index:update:index --recreate_index`, `coreshop:index`

The container entrypoint waits for the database and calls `.docker/php/docker-install.sh`, which generates the
JWT key pair of the headless API, skips the installation when the database already contains a Pimcore
installation and warms the cache afterwards. The same thing by hand:

```bash
vendor/bin/pimcore-install --install-profile 'App\InstallProfile\EnterpriseDemoInstallProfile' --skip-validation --no-interaction
```

The installer reads everything from the environment and writes the collected values to `.env.local` inside the container:

| Variable | Purpose |
|---|---|
| `DATABASE_URL` | Doctrine DSN of the app database (built from `DATABASE_*` in `.env`) |
| `PIMCORE_OPENSEARCH_DSN` | OpenSearch endpoint of the Generic Data Index (`opensearch://opensearch:9200?ssl=false` in compose, the sidecar on `127.0.0.1` in Kubernetes) |
| `PIMCORE_MESSENGER_TRANSPORT_DSN_PREFIX` | messenger transport, Doctrine by default |
| `MERCURE_JWT_KEY`, `MERCURE_URL`, `MERCURE_SERVER_URL` | Mercure hub for Pimcore Studio (`pimcore_studio_backend.mercure_settings`) |
| `PIMCORE_ENCRYPTION_SECRET` | defuse key for `pimcore.encryption.secret` (`vendor/bin/generate-defuse-key`) |
| `PIMCORE_INSTANCE_IDENTIFIER` | Pimcore instance identifier |
| `PIMCORE_PRODUCT_KEY` | Pimcore product key, **required**: Pimcore 2026 refuses to boot with a secret but without a registered key |
| `PIMCORE_INSTALL_ADMIN_USERNAME`, `PIMCORE_INSTALL_ADMIN_PASSWORD` | admin user created by the installer |
| `SENTRY_DSN` | Sentry DSN for the `staging` / `prod` environments (empty = disabled) |

Set them in `.env.local` for docker compose; in Kubernetes they come from the `pimcore` secret of the
manifest repository ([coreshop/demo-enterprise-manifest](https://github.com/coreshop/demo-enterprise-manifest)).

## Demo data

`dump/` holds the demo content as SQL (schema of all non-core tables in `data-0-bootstrap.sql`, one
`data-1-<table>.sql` per table, views in `data-2-views.sql`). It was **migrated**, not regenerated: the
CoreShop 4.1 / Pimcore 11 database of the old demo was upgraded to Pimcore 12 / CoreShop 5.1 and then to
Pimcore 2026 / CoreShop 2026 with the regular Doctrine migrations, so orders, customers, products, events,
tickets, loyalty points and warehouse stock of the old demo are still there (203 objects, 56 documents,
144 assets, 27 classes).

To refresh the dump after changing content locally:

```bash
docker compose exec php php dump/create-dump.php
```

The script diffs against Pimcore's `install.sql`, skips runtime tables (`users`, `classes`, caches, logs,
messenger, installer bookkeeping) and writes the files into `dump/`. Class definitions are versioned in
`var/classes/definition_*.php`, asset files in `public/var/assets`.

## Notes on the 2026 line

- Static routes are gone in Pimcore 2026; `config/routes.yaml` imports the CoreShop storefront routes, the
  voucher credit and loyalty routes and the quick order routing instead of `var/config/staticroutes`.
- Newsletter, TinyMCE, Web2Print and the classic admin were dropped with Pimcore 12+/2026: the
  `newsletterActive` / `newsletterConfirmed` fields of `CoreShopCustomer` are plain checkboxes now (as in
  CoreShop 2026), `Web2printController` was removed.
- `config/services.yaml` re-declares the Studio build provider of `coreshop/enterprise-subscription-bundle`
  2026.2.0 with the `setBuildArchiveExtractor` call the bundle forgets; remove it once the bundle is fixed.

### Studio frontend builds

The CoreShop bundles ship their Studio frontend as a zip in `Resources/build-dist`, which Pimcore's
`StudioBuildCacheWarmer` extracts into `Resources/public/studio` on `cache:warmup`. The extractor requires
the parent directory `Resources/public` to exist, and CoreShop 2026.2.1 / the enterprise bundles 2026.2.0 do
not ship it for most bundles, so Studio answers 500 ("Cannot extract the Studio frontend build archive").
The Dockerfile and the install script create the missing directories before the warmup as a workaround;
remove it once the bundles ship the directories (or the extractor creates them).

## Dependencies

The enterprise bundles come from Private Packagist (`https://cors.repo.packagist.com/cs-enterprise-demo/`,
customer *cs-enterprise-demo*). `COMPOSER_AUTH` must contain the credentials of that customer, e.g.

```json
{"http-basic": {"cors.repo.packagist.com": {"username": "token", "password": "<customer token>"}}}
```

The customer needs access to every package in `composer.json` incl. `coreshop/loyalty-bundle`,
`coreshop/enterprise-subscription-bundle` and `coreshop/telemetry-bundle` (Packagist → customer → packages).
`coreshop/inbound-email-rules-bundle` needs `ext-imap` (PHP 8.4: PECL); the Dockerfile installs it into
the image, the GitHub runners lack it, so the workflows pass `--ignore-platform-req=ext-imap`.

## CI/CD

| Workflow | Trigger | What it does |
|---|---|---|
| `build.yml` | push to `main`, PR | builds the images `php-fpm`, `php-supervisord`, `nginx`; on `main` pushes them to `ghcr.io/coreshop/demo-enterprise/{php-fpm,php-supervisord,nginx}` tagged `main-<sha>` and `latest`, bakes the installed state (see below) and bumps the tags in [coreshop/demo-enterprise-manifest](https://github.com/coreshop/demo-enterprise-manifest) |
| `static.yml` | push, PR | `composer validate`, YAML/Twig/container lint, phpstan level 1 on `src/` |
| `composer-update.yml` | daily 03:00, manual | `composer update` as a pull request |

### Baked installation

A pod of the demo has no volume, so every start (daily reset, image update) would run the complete
install: Pimcore, CoreShop, the enterprise bundles, the dump, the search index and the thumbnails,
many minutes during which the demo is offline. The `bake` job of `build.yml` therefore runs the
install once per build ([`.docker/bake/bake.sh`](.docker/bake/bake.sh), against throw-away MySQL and
OpenSearch containers) and exports the result into two more images:

| Image | Content |
|---|---|
| `ghcr.io/coreshop/demo-enterprise/mysql:main-<sha>` | `mysql:8` plus the dump of the installed database in `/docker-entrypoint-initdb.d/`; imported on the first start of the container ([`.docker/mysql/Dockerfile`](.docker/mysql/Dockerfile)) |
| `ghcr.io/coreshop/demo-enterprise/php-fpm-installed:main-<sha>` | `php-fpm` plus the files the install generates: thumbnails in `public/var/tmp`, `var/config` ([`.docker/php/Dockerfile.installed`](.docker/php/Dockerfile.installed)) |

The manifest runs the mysql sidecar and the php container from these images. On start the install
script finds the installation in the database, runs pending migrations and recreates the
OpenSearch indices; the `pimcore_generic_data_index_queue` worker of the supervisord container fills
them in the background. `MYSQL_*` (user, password, database) still come from the deployment; the
dump is imported into that database.

The bake needs the registration of the deployed demo, because the installed database belongs to that
instance: repository secrets `DEMO_PIMCORE_ENCRYPTION_SECRET`, `DEMO_PIMCORE_INSTANCE_IDENTIFIER` and
`DEMO_PIMCORE_PRODUCT_KEY`, equal to `pimcore.encryptionSecret`, `pimcore.instanceIdentifier` and
`pimcore.productKey` in the manifest.

Local check of the bake (needs the three `PIMCORE_*` values in the environment):

```bash
PHP_IMAGE=ghcr.io/coreshop/demo-enterprise/php-fpm:latest .docker/bake/bake.sh bake
docker build -t demo-mysql bake/mysql
docker build --build-arg BASE_IMAGE=ghcr.io/coreshop/demo-enterprise/php-fpm:latest -t demo-php bake/php
```

Required secrets:

- `COMPOSER_AUTH` (repository secret): Private Packagist credentials, used by `composer install` in the
  workflows and passed to `docker build` as a build secret (never stored in an image layer)
- `GITHUB_TOKEN` (automatic, `packages: write`): pushes the images to the GitHub Container Registry
- `DEMO_PIMCORE_ENCRYPTION_SECRET`, `DEMO_PIMCORE_INSTANCE_IDENTIFIER`, `DEMO_PIMCORE_PRODUCT_KEY` (repository
  secrets): registration of the deployed demo for the bake job, see above
- `GH_APP_ID`, `GH_APP_PRIVATE_KEY` (org secrets): the coreshop GitHub App mints the token for the manifest
  push; the app must be installed on `coreshop/demo-enterprise-manifest` with `contents: write`

The container packages `ghcr.io/coreshop/demo-enterprise/*` **stay private** (they contain the enterprise
bundles); the cluster pulls with the `ghcr-pull` secret described in the manifest repository.

Deployment itself happens from the manifest repository (Helm chart, synced by the cluster).

## License

CoreShop and the enterprise bundles are licensed under the CoreShop Commercial License (CCL); the demo
project code is skeleton code from Pimcore.
