<?php

declare(strict_types=1);

/*
 * CoreShop GmbH
 *
 * This software is available under the CoreShop Commercial License (CCL).
 *
 * @copyright  Copyright (c) CoreShop GmbH (https://www.coreshop.org)
 * @license    https://www.coreshop.org/license CCL
 */

namespace App\Entity;

use CoreShop\Bundle\CustomerClusterBundle\Model\CustomerClusterAwareInterface;
use CoreShop\Bundle\CustomerClusterBundle\Model\CustomerClusterAwareTrait;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'coreshop_store')]
class Store extends \CoreShop\Component\Core\Model\Store implements CustomerClusterAwareInterface
{
    use CustomerClusterAwareTrait;
}
