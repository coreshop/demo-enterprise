<?php

declare(strict_types=1);

namespace App\InstallProfile;

use CoreShop\Bundle\BatchMessengerBundle\CoreShopBatchMessengerBundle;
use CoreShop\Bundle\CoreBundle\CoreShopCoreBundle;
use CoreShop\Bundle\CreditBundle\CoreShopCreditBundle;
use CoreShop\Bundle\CustomerClusterBundle\CoreShopCustomerClusterBundle;
use CoreShop\Bundle\DepositBundle\CoreShopDepositBundle;
use CoreShop\Bundle\DocumentRouteBundle\CoreShopDocumentRouteBundle;
use CoreShop\Bundle\EnterpriseSubscriptionBundle\CoreShopEnterpriseSubscriptionBundle;
use CoreShop\Bundle\HeadlessBundle\CoreShopHeadlessBundle;
use CoreShop\Bundle\InboundEmailRulesBundle\CoreShopInboundEmailRulesBundle;
use CoreShop\Bundle\LoyaltyBundle\CoreShopLoyaltyBundle;
use CoreShop\Bundle\QuickOrderBundle\CoreShopQuickOrderBundle;
use CoreShop\Bundle\TicketingBundle\CoreShopTicketingBundle;
use CoreShop\Bundle\VoucherCreditBundle\CoreShopVoucherCreditBundle;
use CoreShop\Bundle\WarehouseBundle\CoreShopWarehouseBundle;
use Pimcore\Bundle\ApplicationLoggerBundle\PimcoreApplicationLoggerBundle;
use Pimcore\Bundle\CustomReportsBundle\PimcoreCustomReportsBundle;
use Pimcore\Bundle\DataHubBundle\PimcoreDataHubBundle;
use Pimcore\Bundle\GenericDataIndexBundle\PimcoreGenericDataIndexBundle;
use Pimcore\Bundle\GenericExecutionEngineBundle\PimcoreGenericExecutionEngineBundle;
use Pimcore\Bundle\InstallBundle\EnvVarDefinition\Definitions\DatabaseEnvVarDefinition;
use Pimcore\Bundle\InstallBundle\EnvVarDefinition\Definitions\DoctrineMessengerEnvVarDefinition;
use Pimcore\Bundle\InstallBundle\EnvVarDefinition\Definitions\OpenSearchEnvVarDefinition;
use Pimcore\Bundle\InstallBundle\EnvVarDefinition\Definitions\ProductRegistrationEnvVarDefinition;
use Pimcore\Bundle\InstallBundle\Profile\DataSource\DataSourceInterface;
use Pimcore\Bundle\InstallBundle\Profile\DataSource\SqlDumpDataSource;
use Pimcore\Bundle\InstallBundle\Profile\InstallProfileInterface;
use Pimcore\Bundle\InstallBundle\Profile\PostInstallCommand;
use Pimcore\Bundle\SeoBundle\PimcoreSeoBundle;
use Pimcore\Bundle\StudioBackendBundle\PimcoreStudioBackendBundle;
use Pimcore\Bundle\StudioUiBundle\PimcoreStudioUiBundle;

/**
 * Install profile of the CoreShop Enterprise Demo.
 *
 * Usage (see README):
 *   vendor/bin/pimcore-install --install-profile 'App\InstallProfile\EnterpriseDemoInstallProfile' \
 *       --skip-validation --no-interaction --admin-username admin --admin-password coreshop
 *
 * The profile restores the demo content from the SQL dump in `dump/` (created with
 * `php dump/create-dump.php` from a migrated database, see README) instead of installing an empty
 * CoreShop. The dump already contains the CoreShop tables, class definitions data, migration
 * markers and the `BUNDLE_INSTALLED__*` settings-store entries, so the installer only creates the
 * Pimcore schema, imports the dump, creates the admin user and runs the post-install commands below.
 */
final readonly class EnterpriseDemoInstallProfile implements InstallProfileInterface
{
    public function getName(): string
    {
        return 'CoreShop Enterprise Demo';
    }

    public function getDescription(): string
    {
        return 'Pimcore 2026 + CoreShop 2026 with the CoreShop enterprise bundles and the demo data set '
            . 'restored from dump/*.sql.';
    }

    public function getBundles(): array
    {
        // Same core set as CoreShop's own install profile (bundles with installers that must run during
        // the Pimcore install step) plus the bundles this demo registers in config/bundles.php and
        // src/Kernel.php. The dump already marks all of them as installed, so the install step is a
        // no-op on a restore; the list still documents what the demo needs and covers a fresh database
        // without dump.
        return [
            PimcoreGenericDataIndexBundle::class,
            PimcoreGenericExecutionEngineBundle::class,
            PimcoreStudioBackendBundle::class,
            PimcoreStudioUiBundle::class,
            PimcoreApplicationLoggerBundle::class,
            PimcoreCustomReportsBundle::class,
            PimcoreSeoBundle::class,
            PimcoreDataHubBundle::class,
            CoreShopCoreBundle::class,
            CoreShopEnterpriseSubscriptionBundle::class,
            CoreShopBatchMessengerBundle::class,
            CoreShopCreditBundle::class,
            CoreShopCustomerClusterBundle::class,
            CoreShopDepositBundle::class,
            CoreShopDocumentRouteBundle::class,
            CoreShopHeadlessBundle::class,
            CoreShopInboundEmailRulesBundle::class,
            CoreShopLoyaltyBundle::class,
            CoreShopQuickOrderBundle::class,
            CoreShopTicketingBundle::class,
            CoreShopVoucherCreditBundle::class,
            CoreShopWarehouseBundle::class,
        ];
    }

    public function getEnvVarDefinitions(): array
    {
        // CoreShop\Bundle\CoreBundle\InstallProfile\CoreShopInstallProfile (DATABASE_URL, PIMCORE_OPENSEARCH_DSN,
        // Doctrine messenger transport prefix) plus the Pimcore registration values: the installer reloads
        // .env with override before booting the real kernel, so PIMCORE_ENCRYPTION_SECRET & co. have to be
        // collected from the environment and written to .env.local, otherwise the empty placeholders of
        // .env win. All of them are pre-set via environment variables in the Docker images / Helm chart,
        // so the installer never prompts.
        return [
            new DatabaseEnvVarDefinition(),
            new OpenSearchEnvVarDefinition(),
            new DoctrineMessengerEnvVarDefinition(),
            new ProductRegistrationEnvVarDefinition(),
        ];
    }

    public function getDataSource(): ?DataSourceInterface
    {
        return new SqlDumpDataSource(dirname(__DIR__, 2) . '/dump');
    }

    public function getPostInstallCommands(): array
    {
        // Everything here is idempotent and safe to re-run against the restored dump:
        // - class PHP files from var/classes/definition_*.php (the dump does not contain the `classes`
        //   table on purpose, the definitions in git are the source of truth)
        // - CoreShop tables/folders (no-op when present) and the class patches of the enterprise bundles
        // - search indices: the OpenSearch index is not part of the dump and has to be (re)built, the
        //   queue is processed by the messenger worker of the supervisord image afterwards
        return [
            new PostInstallCommand(
                'pimcore:deployment:classes-rebuild',
                'Create data object classes from var/classes',
                100,
                ['--create-classes'],
            ),
            new PostInstallCommand('coreshop:install:folders', 'Ensure CoreShop object folders exist', 90),
            new PostInstallCommand('coreshop:patch:classes', 'Apply enterprise bundle class patches', 80, ['--force']),
            new PostInstallCommand(
                'generic-data-index:update:index',
                'Create the Generic Data Index (OpenSearch) indices',
                70,
                ['--recreate_index'],
            ),
            new PostInstallCommand('coreshop:index', 'Rebuild the CoreShop product index', 60),
            // the dump ships the assets without thumbnails; the storefronts request several sizes per
            // product image, which otherwise takes 15-35 s on the first visit of every category
            new PostInstallCommand(
                'pimcore:thumbnails:image',
                'Pre-generate the CoreShop product thumbnails',
                50,
                ['--thumbnails', 'coreshop_productGrid,coreshop_productList,coreshop_productDetail,coreshop_productDetailThumbnail,coreshop_productCart,coreshop_productCartPreview', '--skip-high-res'],
            ),
        ];
    }
}
