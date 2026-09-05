<?php

declare(strict_types=1);

namespace App\Order\Modifier;

use CoreShop\Component\Core\Order\Modifier\CartItemQuantityModifier;
use CoreShop\Component\StorageList\Model\StorageListItemInterface;
use CoreShop\Component\StorageList\StorageListItemQuantityModifierInterface;

/**
 * coreshop/headless-bundle 2026.2.0 type-hints the concrete CartItemQuantityModifier in
 * UpdateOrderItemHandler while coreshop/ticketing-bundle decorates that service with a class that only
 * implements StorageListItemQuantityModifierInterface, so the container cannot be built with both
 * bundles. This subclass satisfies the type-hint and delegates to the decorated service chain
 * (ticketing extension modifier -> core modifier). Remove once the headless bundle type-hints the interface.
 */
final class DecoratedCartItemQuantityModifier extends CartItemQuantityModifier
{
    public function __construct(
        private readonly StorageListItemQuantityModifierInterface $decorated,
    ) {
        parent::__construct();
    }

    public function modify(StorageListItemInterface $item, float $targetQuantity): void
    {
        $this->decorated->modify($item, $targetQuantity);
    }
}
