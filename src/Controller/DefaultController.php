<?php

namespace App\Controller;

use Pimcore\Controller\FrontendController;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends FrontendController
{
    public function defaultAction(Request $request)
    {
        return $this->redirectToRoute('coreshop_index');
    }

    public function bricksAction(Request $request)
    {
        return $this->renderTemplate('default/bricks.html.twig');
    }
}
