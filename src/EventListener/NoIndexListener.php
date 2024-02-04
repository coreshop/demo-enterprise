<?php

namespace App\EventListener;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class NoIndexListener implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            'kernel.response' => 'onKernelResponse',
        ];
    }

    public function onKernelResponse($event)
    {
        $response = $event->getResponse();
        $response->headers->set('X-Robots-Tag', 'noindex follow');
    }
}
