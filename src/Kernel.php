<?php

/**
 * Pimcore
 *
 * This source file is available under two different licenses:
 * - GNU General Public License version 3 (GPLv3)
 * - Pimcore Enterprise License (PEL)
 * Full copyright and license information is available in
 * LICENSE.md which is distributed with this source code.
 *
 * @copyright  Copyright (c) Pimcore GmbH (http://www.pimcore.org)
 * @license    http://www.pimcore.org/license     GPLv3 and PEL
 */

namespace App;

use Pimcore\HttpKernel\BundleCollection\BundleCollection;
use Pimcore\Kernel as PimcoreKernel;

class Kernel extends PimcoreKernel
{
    public function registerBundlesToCollection(BundleCollection $collection): void
    {
        $collection->addBundle(new \CoreShop\Bundle\CreditBundle\CoreShopCreditBundle());
        $collection->addBundle(new \CoreShop\Bundle\DocumentRouteBundle\CoreShopDocumentRouteBundle());
        $collection->addBundle(new \CoreShop\Bundle\WarehouseBundle\CoreShopWarehouseBundle());
        $collection->addBundle(new \CoreShop\Bundle\DepositBundle\CoreShopDepositBundle());
        $collection->addBundle(new \CoreShop\Bundle\InboundEmailRulesBundle\CoreShopInboundEmailRulesBundle());
        $collection->addBundle(new \CoreShop\Bundle\BatchMessengerBundle\CoreShopBatchMessengerBundle());
        $collection->addBundle(new \CoreShop\Bundle\CustomerClusterBundle\CoreShopCustomerClusterBundle());
        $collection->addBundle(new \CoreShop\Bundle\LoyaltyBundle\CoreShopLoyaltyBundle(), 900);
        $collection->addBundle(new \CoreShop\Bundle\VoucherCreditBundle\CoreShopVoucherCreditBundle(), 900);
        $collection->addBundle(new \CoreShop\Bundle\CoreBundle\CoreShopCoreBundle(), 1000);
        $collection->addBundle(new \CoreShop\Bundle\FrontendBundle\CoreShopFrontendBundle(), 1200);
        $collection->addBundle(new \Pimcore\Bundle\DataHubBundle\PimcoreDataHubBundle());
        $collection->addBundle(new \CoreShop\Bundle\HeadlessBundle\CoreShopHeadlessBundle());
        $collection->addBundle(new \CoreShop\Bundle\QuickOrderBundle\CoreShopQuickOrderBundle());
        $collection->addBundle(new \CoreShop\Bundle\TicketingBundle\CoreShopTicketingBundle());
        $collection->addBundle(new \Lexik\Bundle\JWTAuthenticationBundle\LexikJWTAuthenticationBundle());
    }
}
