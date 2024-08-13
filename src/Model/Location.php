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

namespace App\Model;

use CoreShop\Component\Index\Model\IndexableInterface;
use CoreShop\Component\Index\Model\IndexInterface;
use Pimcore\Model\DataObject\Concrete;

abstract class Location extends Concrete implements IndexableInterface
{
    abstract public function getLocationName(): ?string;

    public function getIndexableEnabled(IndexInterface $index): bool
    {
        return true;
    }

    public function getIndexable(IndexInterface $index): bool
    {
        return $this->getLocationPublished();
    }

    public function getIndexableName(IndexInterface $index, string $language): string
    {
        return $this->getLocationName() ?? '';
    }

    public function getLocationPublished(): bool
    {
        if (self::OBJECT_TYPE_VARIANT === $this->getType()) {
            /**
             * @var Concrete $parent
             */
            $parent = $this->getParent();

            return $this->getPublished() && $parent->getPublished();
        }

        return $this->getPublished();
    }
}
