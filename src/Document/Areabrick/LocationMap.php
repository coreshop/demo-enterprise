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

namespace App\Document\Areabrick;

use CoreShop\Bundle\IndexGeoBundle\Condition\GeoRadiusCondition;
use CoreShop\Bundle\IndexGeoBundle\Geo\Coordinate;
use CoreShop\Bundle\IndexGeoBundle\Order\GeoRadiusOrder;
use CoreShop\Bundle\ResourceBundle\CoreExtension\Document\Select;
use CoreShop\Component\Index\Condition\IsNotNullCondition;
use CoreShop\Component\Index\Factory\FilteredListingFactoryInterface;
use CoreShop\Component\Index\Filter\FilterProcessorInterface;
use CoreShop\Component\Index\Listing\ListingInterface;
use CoreShop\Component\Index\Listing\OrderAwareListingInterface;
use CoreShop\Component\Index\Model\FilterInterface;
use GeoIp2\Database\Reader;
use GeoIp2\Exception\AddressNotFoundException;
use Pimcore\Extension\Document\Areabrick\AbstractTemplateAreabrick;
use Pimcore\Extension\Document\Areabrick\EditableDialogBoxConfiguration;
use Pimcore\Extension\Document\Areabrick\EditableDialogBoxInterface;
use Pimcore\Http\Request\Resolver\EditmodeResolver;
use Pimcore\Model\DataObject\Location;
use Pimcore\Model\Document;
use Pimcore\Model\Document\Editable;
use Pimcore\Model\Document\Editable\Area\Info;
use Pimcore\Model\Translation;
use Symfony\Component\Asset\Packages;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Intl\Countries;
use Symfony\Component\RateLimiter\RateLimiterFactory;
use Symfony\Contracts\Translation\TranslatorInterface;
use Twig\Environment;

final class LocationMap extends AbstractTemplateAreabrick implements EditableDialogBoxInterface
{
    public function __construct(
        protected TranslatorInterface $translator,
        protected FilteredListingFactoryInterface $filterListFactory,
        protected FilterProcessorInterface $filterProcessor,
        protected Environment $templateEngine,
        protected RateLimiterFactory $geocodeApiLimiter,
        protected EditmodeResolver $editmodeResolver,
        protected Packages $packages,
    ) {
    }

    public function action(Info $info): ?Response
    {
        parent::action($info);

        /**
         * @var Request $request
         */
        $request = $info->getRequest();

        $isPost = $request->isMethod('post') && !$this->editmodeResolver->isEditmode();

        /**
         * @var Editable\Checkbox $preloadCheckbox
         */
        $preloadCheckbox = $this->getDocumentEditable(
            $info->getDocument(),
            'checkbox',
            'preload_locations'
        );
        $preload = $preloadCheckbox->isChecked();

        /**
         * @var Editable\Checkbox $showAsListCheckbox
         */
        $showAsListCheckbox = $this->getDocumentEditable(
            $info->getDocument(),
            'checkbox',
            'show_as_list'
        );
        $showAsList = $showAsListCheckbox->isChecked();

        /**
         * @var Editable\Checkbox $forceGeoLocationCheckbox
         */
        $forceGeoLocationCheckbox = $this->getDocumentEditable(
            $info->getDocument(),
            'checkbox',
            'force_geo_location',
        );
        $forceGeoLocation = $forceGeoLocationCheckbox->isChecked();

        /**
         * @var Editable\Input $fallbackCoordinateLngInput
         */
        $fallbackCoordinateLngInput = $this->getDocumentEditable(
            $info->getDocument(),
            'input',
            'fallback_coordinate_lng',
        );
        /**
         * @var string $fallbackCoordinateLng
         */
        $fallbackCoordinateLng = $fallbackCoordinateLngInput->getData();

        /**
         * @var Editable\Input $fallbackCoordinateLatInput
         */
        $fallbackCoordinateLatInput = $this->getDocumentEditable(
            $info->getDocument(),
            'input',
            'fallback_coordinate_lat',
        );
        /**
         * @var string $fallbackCoordinateLat
         */
        $fallbackCoordinateLat = $fallbackCoordinateLatInput->getData();

        /**
         * @var Editable\Input $fallbackPostCodeInput
         */
        $fallbackPostCodeInput = $this->getDocumentEditable($info->getDocument(), 'input', 'fallback_postcode');
        /**
         * @var string $fallbackPostCode
         */
        $fallbackPostCode = $fallbackPostCodeInput->getData();

        /**
         * @var Select $filterSelection
         */
        $filterSelection = $this->getDocumentEditable($info->getDocument(), 'coreshop_filter', 'filter');

        $isFallback = false;
        $filter = $filterSelection->getResourceObject();

        if ($filter instanceof FilterInterface) {
            $locations = [];
            $filteredList = $this->filterListFactory->createList($filter, $request->request);
            $filteredList->setLocale($request->getLocale());
            $filteredList->setVariantMode(ListingInterface::VARIANT_MODE_HIDE);

            $filteredList->addCondition(new IsNotNullCondition('coordinates'), 'coordinates');
            $filteredList->addCondition(new IsNotNullCondition('country'), 'country');

            $currentFilter = $this->filterProcessor->processConditions(
                $filter,
                $filteredList,
                $request->request,
            );

            $preparedConditions = $this->filterProcessor->prepareConditionsForRendering(
                $filter,
                $filteredList,
                $currentFilter,
            );

            if (array_key_exists('coordinates__coordinates', $currentFilter)) {
                $coordinates = $currentFilter['coordinates__coordinates'];
            } else {
                $coordinates = $this->getGeoLocationFromIP($request);

                if ($request->request->get('longitude') && $request->request->get('latitude')) {
                    /**
                     * @var float $latitude
                     */
                    $latitude = $request->request->get('latitude');

                    /**
                     * @var float $longitude
                     */
                    $longitude = $request->request->get('longitude');

                    $coordinates = new Coordinate($latitude, $longitude);
                }

                if (!$coordinates instanceof Coordinate && $forceGeoLocation && $fallbackCoordinateLat && $fallbackCoordinateLng) {
                    $coordinates = new Coordinate((float)$fallbackCoordinateLat, (float)$fallbackCoordinateLng);
                    $isFallback = true;
                }

                if (!$isPost && $preload && $forceGeoLocation) {
                    if($coordinates instanceof Coordinate && $coordinates->latitude && $coordinates->longitude) {
                        $filteredList->addCondition(
                            new GeoRadiusCondition(
                                'coordinates',
                                $coordinates->latitude,
                                $coordinates->longitude,
                                50,
                            ),
                            'coordinates',
                        );
                    }
                }

                if ($filteredList instanceof OrderAwareListingInterface) {
                    if (!$coordinates instanceof Coordinate) {
                        if ($fallbackCoordinateLat && $fallbackCoordinateLng) {
                            $filteredList->addOrder(
                                new GeoRadiusOrder(
                                    'coordinates',
                                    (float)$fallbackCoordinateLat,
                                    (float)$fallbackCoordinateLng,
                                ),
                            );
                        }
                    } else {
                        if ($coordinates->latitude && $coordinates->longitude) {
                            $filteredList->addOrder(
                                new GeoRadiusOrder(
                                    'coordinates',
                                    $coordinates->latitude,
                                    $coordinates->longitude,
                                ),
                            );
                        }
                    }
                }
            }
            if ($isPost || $preload) {
                $locations = $filteredList->load();
            }

            $filteredList->setOffset((int)$request->request->get('offset', 0));

            if ($fallbackPostCode) {
                foreach ($preparedConditions as &$condition) {
                    if ('geo_radius' === $condition['type']) {
                        $condition['currentValueAddress'] = $fallbackPostCode;
                    }
                }
            }

            $info->setParam('coordinates', $coordinates);
            $info->setParam('conditions', $preparedConditions);
            $info->setParam('current_filter', $currentFilter);
            $info->setParam('filter', $filter);
            $info->setParam('locations', $this->prepareJsonLocations(
                $locations,
                $coordinates,
                $isFallback,
            ));
            $info->setParam('preload', $preload);

            if ($isPost && $request->isXmlHttpRequest() && !$this->editmodeResolver->isEditmode()) {
                $viewResult = $this->prepareJsonLocations(
                    $locations ?: [],
                    $coordinates,
                    $isFallback
                );

                if ($viewResult) {
                    $result = [
                        'success' => true,
                        'show_as_list' => $showAsList,
                        'locations' => $viewResult,
                        'coordinates' => $coordinates ? [
                            'lat' => $coordinates->latitude,
                            'lng' => $coordinates->longitude,
                        ] : null,
                    ];
                } else {
                    $result = [
                        'success' => true,
                        'show_as_list' => $showAsList,
                        'messages' => [
                            [
                                'listHtml' => $this->templateEngine->render('areas/location-map/include/no_result.html.twig'),
                            ],
                        ],
                    ];
                }

                return new JsonResponse($result);
            }
        }

        return null;
    }

    protected function prepareJsonLocations(
        array $locations,
        ?Coordinate $coordinates,
        bool $isFallback,
    ): array {
        $viewResult = [];

        /**
         * @var Location $location
         */
        foreach ($locations as $location) {
            $locationItem = [
                'id' => $location->getId(),
                'name' => $location->getLocationName(),
                'email' => $location->getEmail(),
                'website' => $location->getWebsite(),
                'phone' => $location->getPhone(),
                'address' => sprintf(
                    '%s, %s %s, %s',
                    $location->getAddress(),
                    $location->getPostCode(),
                    $location->getCity(),
                    Countries::getName($location->getCountry()),
                ),
                'coordinatesText' => sprintf(
                    '%s,%s',
                    $location->getCoordinates() ? $location->getCoordinates()->getLongitude() : '0.0',
                    $location->getCoordinates() ? $location->getCoordinates()->getLatitude() : '0.0',
                ),
                'coordinates' => [
                    'lat' => $location->getCoordinates() ? $location->getCoordinates()->getLatitude() : 0.0,
                    'lng' => $location->getCoordinates() ? $location->getCoordinates()->getLongitude() : 0.0,
                ],
            ];

            $tmpResult = $locationItem;
            $tmpResult['listHtml'] = $this->templateEngine->render(
                'areas/location-map/include/list_entry.html.twig',
                [
                    'location' => $locationItem,
                    'coordinates' => $isFallback ? null : $coordinates,
                ],
            );

            $tmpResult['infoHtml'] = $this->templateEngine->render(
                'areas/location-map/include/info_entry.html.twig',
                [
                    'location' => $locationItem,
                    'coordinates' => $isFallback ? null : $coordinates,
                ],
            );

            $viewResult[] = $tmpResult;
        }

        return $viewResult;
    }

    protected function getGeoLocationFromIP(Request $request): Coordinate|null
    {
        // TODO: where to get the GeoListe2-City.mmdb from?
        $geoDbFile = PIMCORE_CONFIGURATION_DIRECTORY.'/GeoLite2-City.mmdb';
        $clientIp = $request->getClientIp();

        if (!$clientIp) {
            return null;
        }

        if (!$this->checkIfIpIsPrivate($clientIp)) {
            $reader = new Reader($geoDbFile);

            try {
                $record = $reader->city($clientIp);

                if (!$record->location->latitude || !$record->location->longitude) {
                    return null;
                }

                return new Coordinate($record->location->latitude, $record->location->longitude);
            } catch (AddressNotFoundException) {
                return null;
            }
        }

        return null;
    }

    private function checkIfIpIsPrivate(string $clientIp): bool
    {
        $priAddrs = [
            '10.0.0.0|10.255.255.255', // single class A network
            '172.16.0.0|172.31.255.255', // 16 contiguous class B network
            '192.168.0.0|192.168.255.255', // 256 contiguous class C network
            '169.254.0.0|169.254.255.255', // Link-local address also refered to as Automatic Private IP Addressing
            '127.0.0.0|127.255.255.255', // localhost
        ];

        $longIp = ip2long($clientIp);

        if (-1 != $longIp) {
            foreach ($priAddrs as $priAddr) {
                [$start, $end] = explode('|', $priAddr);

                // IF IS PRIVATE
                if ($longIp >= ip2long($start) && $longIp <= ip2long($end)) {
                    return true;
                }
            }
        }

        return false;
    }

    public function getEditableDialogBoxConfiguration(
        Document\Editable $area,
        ?Info $info,
    ): EditableDialogBoxConfiguration {
        $config = new EditableDialogBoxConfiguration();
        $config->setWidth(1000);
        $config->setHeight(660);
        $config->setReloadOnClose(true);
        $config->setItems(
            [
                'type' => 'panel',
                'items' => $this->getEditableDialogBoxConfigurationItems(),
            ],
        );

        return $config;
    }

    protected function getEditableDialogBoxConfigurationItems(): array
    {
        return [
            [
                'type' => 'coreshop_filter',
                'label' => $this->translator->trans(
                    'CoreShop Filter',
                    [],
                    Translation::DOMAIN_ADMIN
                ),
                'name' => 'filter',
            ],
            [
                'type' => 'fieldset',
                'title' => $this->translator->trans(
                    'Configuration',
                    [],
                    Translation::DOMAIN_ADMIN
                ),
                'items' => [
                    [
                        'type' => 'checkbox',
                        'label' => $this->translator->trans(
                            'Show map',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'show_map',
                    ],
                    [
                        'type' => 'checkbox',
                        'label' => $this->translator->trans(
                            'Show list',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'show_as_list',
                    ],
                    [
                        'type' => 'checkbox',
                        'label' => $this->translator->trans(
                            'Preload locations',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'preload_locations',
                    ],
                    [
                        'type' => 'checkbox',
                        'label' => $this->translator->trans(
                            'Force geo location (with fallbacks)',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'force_geo_location',
                    ],
                    [
                        'type' => 'checkbox',
                        'label' => $this->translator->trans(
                            'Disable Browser geo location',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'disable_geo',
                    ],
                ],
            ],
            [
                'type' => 'fieldset',
                'title' => $this->translator->trans(
                    'Fallback',
                    [],
                    Translation::DOMAIN_ADMIN,
                ),
                'items' => [
                    [
                        'type' => 'input',
                        'label' => $this->translator->trans(
                            'Fallback coordinate latitude',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'fallback_coordinate_lat',
                    ],
                    [
                        'type' => 'input',
                        'label' => $this->translator->trans(
                            'Fallback coordinate longitude',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'fallback_coordinate_lng',
                    ],
                    [
                        'type' => 'input',
                        'label' => $this->translator->trans(
                            'Fallback zip code (show as default value in filter form',
                            [],
                            Translation::DOMAIN_ADMIN,
                        ),
                        'name' => 'fallback_post_code',
                    ],
                ],
            ],
        ];
    }

    public function getName(): string
    {
        return $this->translator->trans('Location map', [], Translation::DOMAIN_ADMIN);
    }
}
