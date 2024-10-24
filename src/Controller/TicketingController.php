<?php

namespace App\Controller;

use CoreShop\Component\Core\Context\ShopperContextInterface;
use CoreShop\Component\Core\Repository\ProductRepositoryInterface;
use CoreShop\Component\Index\Listing\ListingInterface;
use CoreShop\Component\Resource\Model\AbstractObject;
use Pimcore\Controller\FrontendController;
use Symfony\Component\DependencyInjection\Attribute\Autowire;
use Symfony\Component\HttpFoundation\Request;

class TicketingController extends FrontendController
{
    public function defaultAction(
        Request $request,
        #[Autowire(service: 'coreshop_ticketing.repository.event')] ProductRepositoryInterface $eventRepository,
        #[Autowire(service: 'coreshop_ticketing.repository.event_pass')] ProductRepositoryInterface $eventPassRepository,
        ShopperContextInterface $shopperContext,
    )
    {
        $options = [
            'store' => $shopperContext->getStore(),
            'return_type' => 'list',
            'object_types' => [AbstractObject::OBJECT_TYPE_OBJECT]
        ];

        $events = $eventRepository->getProductsListing($options);
        $eventPasses = $eventPassRepository->getProductsListing($options);

        return $this->render('ticketing/default.html.twig', [
            'events' => $events,
            'event_passes' => $eventPasses,
        ]);
    }
}
