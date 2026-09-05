<?php

/**
 * Inheritance: no
 * Variants: no
 *
 * Fields Summary:
 * - orderNumber [input]
 * - name [input]
 * - quoteNumber [input]
 * - saleState [input]
 * - token [input]
 * - backendCreated [checkbox]
 * - orderDate [datetime]
 * - lastActivatedAt [datetime]
 * - localeCode [language]
 * - carrier [coreShopCarrier]
 * - store [coreShopStore]
 * - paymentProvider [coreShopPaymentProvider]
 * - paymentSettings [coreShopSerializedData]
 * - comment [textarea]
 * - additionalData [objectbricks]
 * - totalPaymentLaterNet [coreShopMoney]
 * - totalPaymentLaterGross [coreShopMoney]
 * - totalPaymentNowNet [coreShopMoney]
 * - totalPaymentNowGross [coreShopMoney]
 * - totalDepositNet [coreShopMoney]
 * - totalDepositGross [coreShopMoney]
 * - subtotalDepositNet [coreShopMoney]
 * - subtotalDepositGross [coreShopMoney]
 * - hasDepositItem [checkbox]
 * - immutable [booleanSelect]
 * - loyaltyPoints [numeric]
 * - quoteState [input]
 * - orderState [input]
 * - paymentState [input]
 * - shippingState [input]
 * - invoiceState [input]
 * - ticketingState [input]
 * - baseCurrency [coreShopCurrency]
 * - paymentTotal [numeric]
 * - totalNet [coreShopMoney]
 * - totalGross [coreShopMoney]
 * - subtotalNet [coreShopMoney]
 * - subtotalGross [coreShopMoney]
 * - shippingTaxRate [numeric]
 * - taxes [fieldcollections]
 * - pimcoreAdjustmentTotalNet [coreShopMoney]
 * - pimcoreAdjustmentTotalGross [coreShopMoney]
 * - adjustmentItems [fieldcollections]
 * - currency [coreShopCurrency]
 * - convertedPaymentTotal [numeric]
 * - convertedTotalNet [coreShopMoney]
 * - convertedTotalGross [coreShopMoney]
 * - convertedSubtotalNet [coreShopMoney]
 * - convertedSubtotalGross [coreShopMoney]
 * - convertedTaxes [fieldcollections]
 * - convertedPimcoreAdjustmentTotalNet [coreShopMoney]
 * - convertedPimcoreAdjustmentTotalGross [coreShopMoney]
 * - convertedAdjustmentItems [fieldcollections]
 * - weight [numeric]
 * - priceRuleItems [fieldcollections]
 * - items [coreShopRelations]
 * - needsRecalculation [checkbox]
 * - customer [coreShopRelation]
 * - shippingAddress [coreShopRelation]
 * - invoiceAddress [coreShopRelation]
 */

return \Pimcore\Model\DataObject\ClassDefinition::__set_state(array(
   'dao' => NULL,
   'id' => 'cs_order',
   'name' => 'CoreShopOrder',
   'title' => '',
   'description' => '',
   'creationDate' => NULL,
   'modificationDate' => 1788615670,
   'userOwner' => 0,
   'userModification' => 0,
   'parentClass' => 'CoreShop\\Component\\Core\\Model\\Order',
   'implementsInterfaces' => '\\CoreShop\\Bundle\\LoyaltyBundle\\Model\\LoyaltyPointsAwareInterface,\\CoreShop\\Bundle\\DepositBundle\\Model\\DepositAwareInterface,\\CoreShop\\Bundle\\TicketingBundle\\Model\\OrderTicketingAwareInterface',
   'listingParentClass' => '',
   'useTraits' => '\\CoreShop\\Bundle\\DepositBundle\\Model\\DepositAwareTrait',
   'listingUseTraits' => '',
   'encryption' => false,
   'encryptedTables' => 
  array (
  ),
   'allowInherit' => false,
   'allowVariants' => false,
   'showVariants' => false,
   'layoutDefinitions' => 
  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
     'name' => 'pimcore_root',
     'type' => NULL,
     'region' => NULL,
     'title' => NULL,
     'width' => 0,
     'height' => 0,
     'collapsible' => false,
     'collapsed' => false,
     'bodyStyle' => NULL,
     'datatype' => 'layout',
     'children' => 
    array (
      0 => 
      \Pimcore\Model\DataObject\ClassDefinition\Layout\Tabpanel::__set_state(array(
         'name' => 'Layout',
         'type' => NULL,
         'region' => NULL,
         'title' => NULL,
         'width' => 0,
         'height' => 0,
         'collapsible' => false,
         'collapsed' => false,
         'bodyStyle' => NULL,
         'datatype' => 'layout',
         'children' => 
        array (
          0 => 
          \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'order',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order.order',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'orderNumber',
                 'title' => 'coreshop.order.number',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              1 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'name',
                 'title' => 'coreshop.order.name',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => '',
                 'defaultValueGenerator' => '',
              )),
              2 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'quoteNumber',
                 'title' => 'coreshop.order.quote.number',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              3 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'saleState',
                 'title' => 'coreshop.order.sale_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              4 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'token',
                 'title' => 'coreshop.order.token',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => true,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => true,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              5 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                 'name' => 'backendCreated',
                 'title' => 'coreshop.order.backend_created',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => 0,
                 'defaultValueGenerator' => '',
              )),
              6 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Datetime::__set_state(array(
                 'name' => 'orderDate',
                 'title' => 'coreshop.order.date',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'useCurrentDate' => false,
                 'respectTimezone' => true,
                 'columnType' => 'bigint(20)',
                 'defaultValueGenerator' => '',
              )),
              7 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Datetime::__set_state(array(
                 'name' => 'lastActivatedAt',
                 'title' => 'Last Activated At',
                 'tooltip' => 'Timestamp the cart was last selected/activated by its customer; used to restore the last-opened cart across sessions.',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => true,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'useCurrentDate' => false,
                 'respectTimezone' => true,
                 'columnType' => 'bigint(20)',
                 'defaultValueGenerator' => '',
              )),
              8 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Language::__set_state(array(
                 'name' => 'localeCode',
                 'title' => 'coreshop.order.locale',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'options' => NULL,
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'dynamicOptions' => false,
                 'enforceValidation' => false,
                 'defaultValueGenerator' => '',
                 'width' => '',
                 'optionsProviderType' => NULL,
                 'optionsProviderClass' => NULL,
                 'optionsProviderData' => NULL,
                 'onlySystemLanguages' => false,
              )),
              9 => 
              \CoreShop\Bundle\ShippingBundle\CoreExtension\Carrier::__set_state(array(
                 'name' => 'carrier',
                 'title' => 'coreshop.order.carrier',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopCarrier',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'allowEmpty' => false,
              )),
              10 => 
              \CoreShop\Bundle\StoreBundle\CoreExtension\Store::__set_state(array(
                 'name' => 'store',
                 'title' => 'coreshop.order.store',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopStore',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'allowEmpty' => false,
                 'options' => 
                array (
                ),
                 'optionsProviderClass' => '@CoreShop\\Bundle\\StoreBundle\\CoreExtension\\StoreOptionProvider',
              )),
              11 => 
              \CoreShop\Bundle\PaymentBundle\CoreExtension\PaymentProvider::__set_state(array(
                 'name' => 'paymentProvider',
                 'title' => 'coreshop.order.payment_provider',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopPaymentProvider',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'allowEmpty' => false,
              )),
              12 => 
              \CoreShop\Bundle\PimcoreBundle\CoreExtension\SerializedData::__set_state(array(
                 'name' => 'paymentSettings',
                 'title' => 'coreshop.order.payment_settings',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopSerializedData',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'phpdocType' => '',
              )),
              13 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Textarea::__set_state(array(
                 'name' => 'comment',
                 'title' => 'coreshop.order.comment',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'maxLength' => NULL,
                 'showCharCount' => false,
                 'excludeFromSearchIndex' => false,
                 'height' => '',
                 'width' => 350,
              )),
              14 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Objectbricks::__set_state(array(
                 'name' => 'additionalData',
                 'title' => 'coreshop.order.additional_data',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'allowedTypes' => 
                array (
                ),
                 'maxItems' => NULL,
                 'border' => false,
              )),
              15 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalPaymentLaterNet',
                 'title' => 'Total Payment Later Net',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              16 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalPaymentLaterGross',
                 'title' => 'Total Payment Later Gross',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              17 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalPaymentNowNet',
                 'title' => 'Total Payment Now Net',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              18 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalPaymentNowGross',
                 'title' => 'Total Payment Now Gross',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              19 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalDepositNet',
                 'title' => 'Total Deposit Net',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              20 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'totalDepositGross',
                 'title' => 'Total Deposit Gross',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              21 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'subtotalDepositNet',
                 'title' => 'Subtotal Deposit Net',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              22 => 
              \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                 'name' => 'subtotalDepositGross',
                 'title' => 'Subtotal Deposit Gross',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => 'coreShopMoney',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'width' => NULL,
                 'defaultValue' => NULL,
                 'phpdocType' => 'int',
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'nullable' => false,
              )),
              23 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                 'name' => 'hasDepositItem',
                 'title' => 'hasDepositItem',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => false,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'defaultValueGenerator' => '',
              )),
              24 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\BooleanSelect::__set_state(array(
                 'name' => 'immutable',
                 'title' => 'coreshop.order.immutable',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'yesLabel' => 'yes',
                 'noLabel' => 'no',
                 'emptyLabel' => 'null',
                 'options' => 
                array (
                  0 => 
                  array (
                    'key' => 'null',
                    'value' => 0,
                  ),
                  1 => 
                  array (
                    'key' => 'yes',
                    'value' => 1,
                  ),
                  2 => 
                  array (
                    'key' => 'no',
                    'value' => -1,
                  ),
                ),
                 'width' => '',
              )),
              25 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                 'name' => 'loyaltyPoints',
                 'title' => 'Loyalty Points',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => 39,
                 'integer' => true,
                 'unsigned' => false,
                 'minValue' => NULL,
                 'maxValue' => NULL,
                 'unique' => false,
                 'decimalSize' => NULL,
                 'decimalPrecision' => NULL,
                 'width' => '',
                 'defaultValueGenerator' => '',
              )),
            ),
             'locked' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'fieldtype' => 'panel',
             'layout' => NULL,
             'border' => false,
             'icon' => NULL,
             'labelWidth' => 100,
             'labelAlign' => 'left',
          )),
          1 => 
          \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'status',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order.status',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'quoteState',
                 'title' => 'coreshop.order.quote_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              1 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'orderState',
                 'title' => 'coreshop.order.order_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              2 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'paymentState',
                 'title' => 'coreshop.order.payment_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              3 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'shippingState',
                 'title' => 'coreshop.order.shipping_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              4 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'invoiceState',
                 'title' => 'coreshop.order.invoice_state',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
              5 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'ticketingState',
                 'title' => 'coreshop_ticketing.order.ticketing_state',
                 'tooltip' => NULL,
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => NULL,
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => NULL,
                 'columnLength' => 190,
                 'regex' => '',
                 'regexFlags' => 
                array (
                ),
                 'unique' => false,
                 'showCharCount' => false,
                 'width' => NULL,
                 'defaultValueGenerator' => '',
              )),
            ),
             'locked' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'fieldtype' => 'panel',
             'layout' => NULL,
             'border' => false,
             'icon' => NULL,
             'labelWidth' => 100,
             'labelAlign' => 'left',
          )),
          2 => 
          \Pimcore\Model\DataObject\ClassDefinition\Layout\Tabpanel::__set_state(array(
             'name' => 'numbers',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order.numbers',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                 'name' => 'numbers_store',
                 'type' => NULL,
                 'region' => NULL,
                 'title' => 'coreshop.order.numbers',
                 'width' => 0,
                 'height' => 0,
                 'collapsible' => false,
                 'collapsed' => false,
                 'bodyStyle' => '',
                 'datatype' => 'layout',
                 'children' => 
                array (
                  0 => 
                  \CoreShop\Bundle\CurrencyBundle\CoreExtension\Currency::__set_state(array(
                     'name' => 'baseCurrency',
                     'title' => 'coreshop.order.base_currency',
                     'tooltip' => '',
                     'mandatory' => false,
                     'noteditable' => true,
                     'index' => false,
                     'locked' => false,
                     'style' => '',
                     'permissions' => NULL,
                     'fieldtype' => 'coreShopCurrency',
                     'relationType' => false,
                     'invisible' => false,
                     'visibleGridView' => false,
                     'visibleSearch' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'allowEmpty' => false,
                  )),
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                     'name' => 'totals',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.totals',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                         'name' => 'paymentTotal',
                         'title' => 'coreshop.order.payment_total',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'defaultValue' => NULL,
                         'integer' => true,
                         'unsigned' => false,
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'unique' => false,
                         'decimalSize' => NULL,
                         'decimalPrecision' => NULL,
                         'width' => '',
                         'defaultValueGenerator' => '',
                      )),
                      1 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalNet',
                         'title' => 'coreshop.order.total_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      2 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalGross',
                         'title' => 'coreshop.order.total_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      3 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalNet',
                         'title' => 'coreshop.order.subtotal_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      4 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalGross',
                         'title' => 'coreshop.order.subtotal_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'fieldset',
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  2 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                     'name' => 'shipping',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.shipping',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                         'name' => 'shippingTaxRate',
                         'title' => 'coreshop.order.shipping_tax_rate',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'defaultValue' => NULL,
                         'integer' => false,
                         'unsigned' => false,
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'unique' => false,
                         'decimalSize' => NULL,
                         'decimalPrecision' => NULL,
                         'width' => '',
                         'defaultValueGenerator' => '',
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'fieldset',
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  3 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'taxes',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.taxes',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'taxes',
                         'title' => 'coreshop.order.taxes',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => false,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'allowedTypes' => 
                        array (
                          0 => 'CoreShopTaxItem',
                        ),
                         'lazyLoading' => true,
                         'maxItems' => NULL,
                         'disallowAddRemove' => false,
                         'disallowReorder' => false,
                         'collapsed' => false,
                         'collapsible' => false,
                         'border' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'panel',
                     'layout' => NULL,
                     'border' => false,
                     'icon' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  4 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'adjustments',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.adjustments',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order.adjustments_total_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      1 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order.adjustments_total_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      2 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'adjustmentItems',
                         'title' => 'coreshop.order.adjustments',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'allowedTypes' => 
                        array (
                          0 => 'CoreShopAdjustment',
                        ),
                         'lazyLoading' => true,
                         'maxItems' => NULL,
                         'disallowAddRemove' => false,
                         'disallowReorder' => false,
                         'collapsed' => false,
                         'collapsible' => false,
                         'border' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'panel',
                     'layout' => NULL,
                     'border' => false,
                     'icon' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                ),
                 'locked' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'fieldtype' => 'panel',
                 'layout' => NULL,
                 'border' => false,
                 'icon' => NULL,
                 'labelWidth' => 100,
                 'labelAlign' => 'left',
              )),
              1 => 
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                 'name' => 'numbers_converted',
                 'type' => NULL,
                 'region' => NULL,
                 'title' => 'coreshop.order.numbers_converted',
                 'width' => 0,
                 'height' => 0,
                 'collapsible' => false,
                 'collapsed' => false,
                 'bodyStyle' => '',
                 'datatype' => 'layout',
                 'children' => 
                array (
                  0 => 
                  \CoreShop\Bundle\CurrencyBundle\CoreExtension\Currency::__set_state(array(
                     'name' => 'currency',
                     'title' => 'coreshop.order.converted_currency',
                     'tooltip' => '',
                     'mandatory' => false,
                     'noteditable' => true,
                     'index' => false,
                     'locked' => false,
                     'style' => '',
                     'permissions' => NULL,
                     'fieldtype' => 'coreShopCurrency',
                     'relationType' => false,
                     'invisible' => false,
                     'visibleGridView' => false,
                     'visibleSearch' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'allowEmpty' => false,
                  )),
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                     'name' => 'totals',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.converted_totals',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                         'name' => 'convertedPaymentTotal',
                         'title' => 'coreshop.order.converted_payment_total',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'defaultValue' => NULL,
                         'integer' => true,
                         'unsigned' => false,
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'unique' => false,
                         'decimalSize' => NULL,
                         'decimalPrecision' => NULL,
                         'width' => '',
                         'defaultValueGenerator' => '',
                      )),
                      1 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalNet',
                         'title' => 'coreshop.order.converted_total_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      2 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalGross',
                         'title' => 'coreshop.order.converted_total_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      3 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalNet',
                         'title' => 'coreshop.order.converted_subtotal_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      4 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalGross',
                         'title' => 'coreshop.order.converted_subtotal_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'fieldset',
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  2 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'taxes_converted',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.converted_taxes',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'convertedTaxes',
                         'title' => 'coreshop.order.converted_taxes',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => false,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'allowedTypes' => 
                        array (
                          0 => 'CoreShopTaxItem',
                        ),
                         'lazyLoading' => true,
                         'maxItems' => NULL,
                         'disallowAddRemove' => false,
                         'disallowReorder' => false,
                         'collapsed' => false,
                         'collapsible' => false,
                         'border' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'panel',
                     'layout' => NULL,
                     'border' => false,
                     'icon' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  3 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'adjustments_converted',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.converted_adjustments',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order.converted_adjustments_total_net',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      1 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order.converted_adjustments_total_gross',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => 'coreShopMoney',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'width' => NULL,
                         'defaultValue' => NULL,
                         'phpdocType' => 'int',
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'nullable' => false,
                      )),
                      2 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'convertedAdjustmentItems',
                         'title' => 'coreshop.order.converted_adjustments',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'allowedTypes' => 
                        array (
                          0 => 'CoreShopAdjustment',
                        ),
                         'lazyLoading' => true,
                         'maxItems' => NULL,
                         'disallowAddRemove' => false,
                         'disallowReorder' => false,
                         'collapsed' => false,
                         'collapsible' => false,
                         'border' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'panel',
                     'layout' => NULL,
                     'border' => false,
                     'icon' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                ),
                 'locked' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'fieldtype' => 'panel',
                 'layout' => NULL,
                 'border' => false,
                 'icon' => NULL,
                 'labelWidth' => 100,
                 'labelAlign' => 'left',
              )),
              2 => 
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                 'name' => 'other',
                 'type' => NULL,
                 'region' => NULL,
                 'title' => 'coreshop.order.other',
                 'width' => 0,
                 'height' => 0,
                 'collapsible' => false,
                 'collapsed' => false,
                 'bodyStyle' => '',
                 'datatype' => 'layout',
                 'children' => 
                array (
                  0 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                     'name' => 'weight',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.weight',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                         'name' => 'weight',
                         'title' => 'coreshop.order.weight',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'defaultValue' => NULL,
                         'integer' => false,
                         'unsigned' => false,
                         'minValue' => NULL,
                         'maxValue' => NULL,
                         'unique' => false,
                         'decimalSize' => NULL,
                         'decimalPrecision' => NULL,
                         'width' => '',
                         'defaultValueGenerator' => '',
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'fieldset',
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                     'name' => 'price_rules',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order.price_rules',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'priceRuleItems',
                         'title' => 'coreshop.order.price_rules',
                         'tooltip' => '',
                         'mandatory' => false,
                         'noteditable' => true,
                         'index' => false,
                         'locked' => false,
                         'style' => '',
                         'permissions' => NULL,
                         'fieldtype' => '',
                         'relationType' => false,
                         'invisible' => false,
                         'visibleGridView' => false,
                         'visibleSearch' => false,
                         'blockedVarsForExport' => 
                        array (
                        ),
                         'allowedTypes' => 
                        array (
                          0 => 'CoreShopProposalCartPriceRuleItem',
                        ),
                         'lazyLoading' => true,
                         'maxItems' => NULL,
                         'disallowAddRemove' => false,
                         'disallowReorder' => false,
                         'collapsed' => false,
                         'collapsible' => false,
                         'border' => false,
                      )),
                    ),
                     'locked' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'fieldtype' => 'fieldset',
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                ),
                 'locked' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'fieldtype' => 'panel',
                 'layout' => NULL,
                 'border' => false,
                 'icon' => NULL,
                 'labelWidth' => 100,
                 'labelAlign' => 'left',
              )),
            ),
             'locked' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'fieldtype' => 'tabpanel',
             'border' => false,
             'tabPosition' => 'top',
          )),
          3 => 
          \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'items',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order.items',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelations::__set_state(array(
                 'name' => 'items',
                 'title' => 'coreshop.order.items',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => true,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'classes' => 
                array (
                ),
                 'displayMode' => NULL,
                 'pathFormatterClass' => '',
                 'maxItems' => NULL,
                 'assetInlineDownloadAllowed' => false,
                 'allowToClearRelation' => true,
                 'objectsAllowed' => true,
                 'assetsAllowed' => false,
                 'assetTypes' => 
                array (
                ),
                 'documentsAllowed' => false,
                 'documentTypes' => 
                array (
                ),
                 'enableTextSelection' => false,
                 'width' => '',
                 'height' => 400,
                 'stack' => 'coreshop.order_item',
              )),
              1 => 
              \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                 'name' => 'needsRecalculation',
                 'title' => 'coreshop.order.needs_recalculation',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => false,
                 'invisible' => true,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'defaultValue' => 0,
                 'defaultValueGenerator' => '',
              )),
            ),
             'locked' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'fieldtype' => 'panel',
             'layout' => NULL,
             'border' => false,
             'icon' => NULL,
             'labelWidth' => 100,
             'labelAlign' => 'left',
          )),
          4 => 
          \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'customer',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order.customer',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                 'name' => 'customer',
                 'title' => 'coreshop.order.customer',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => true,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'classes' => 
                array (
                  0 => 
                  array (
                    'classes' => 'CoreShopCustomer',
                  ),
                ),
                 'displayMode' => NULL,
                 'pathFormatterClass' => '',
                 'assetInlineDownloadAllowed' => false,
                 'allowToClearRelation' => true,
                 'objectsAllowed' => true,
                 'assetsAllowed' => false,
                 'assetTypes' => 
                array (
                ),
                 'documentsAllowed' => false,
                 'documentTypes' => 
                array (
                ),
                 'width' => '',
                 'stack' => 'coreshop.customer',
                 'returnConcrete' => false,
              )),
              1 => 
              \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                 'name' => 'shippingAddress',
                 'title' => 'coreshop.order.shipping_address',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => true,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'classes' => 
                array (
                  0 => 
                  array (
                    'classes' => 'CoreShopAddress',
                  ),
                ),
                 'displayMode' => NULL,
                 'pathFormatterClass' => '',
                 'assetInlineDownloadAllowed' => false,
                 'allowToClearRelation' => true,
                 'objectsAllowed' => true,
                 'assetsAllowed' => false,
                 'assetTypes' => 
                array (
                ),
                 'documentsAllowed' => false,
                 'documentTypes' => 
                array (
                ),
                 'width' => '',
                 'stack' => 'coreshop.address',
                 'returnConcrete' => false,
              )),
              2 => 
              \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                 'name' => 'invoiceAddress',
                 'title' => 'coreshop.order.invoice_address',
                 'tooltip' => '',
                 'mandatory' => false,
                 'noteditable' => true,
                 'index' => false,
                 'locked' => false,
                 'style' => '',
                 'permissions' => NULL,
                 'fieldtype' => '',
                 'relationType' => true,
                 'invisible' => false,
                 'visibleGridView' => false,
                 'visibleSearch' => false,
                 'blockedVarsForExport' => 
                array (
                ),
                 'classes' => 
                array (
                  0 => 
                  array (
                    'classes' => 'CoreShopAddress',
                  ),
                ),
                 'displayMode' => NULL,
                 'pathFormatterClass' => '',
                 'assetInlineDownloadAllowed' => false,
                 'allowToClearRelation' => true,
                 'objectsAllowed' => true,
                 'assetsAllowed' => false,
                 'assetTypes' => 
                array (
                ),
                 'documentsAllowed' => false,
                 'documentTypes' => 
                array (
                ),
                 'width' => '',
                 'stack' => 'coreshop.address',
                 'returnConcrete' => false,
              )),
            ),
             'locked' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'fieldtype' => 'panel',
             'layout' => NULL,
             'border' => false,
             'icon' => NULL,
             'labelWidth' => 100,
             'labelAlign' => 'left',
          )),
        ),
         'locked' => false,
         'blockedVarsForExport' => 
        array (
        ),
         'fieldtype' => 'tabpanel',
         'border' => false,
         'tabPosition' => 'top',
      )),
    ),
     'locked' => false,
     'blockedVarsForExport' => 
    array (
    ),
     'fieldtype' => 'panel',
     'layout' => NULL,
     'border' => false,
     'icon' => NULL,
     'labelWidth' => 100,
     'labelAlign' => 'left',
  )),
   'icon' => NULL,
   'group' => 'CoreShop',
   'showAppLoggerTab' => false,
   'linkGeneratorReference' => NULL,
   'previewGeneratorReference' => NULL,
   'compositeIndices' => 
  array (
  ),
   'showFieldLookup' => false,
   'propertyVisibility' => 
  array (
    'grid' => 
    array (
      'id' => true,
      'key' => false,
      'path' => true,
      'published' => true,
      'modificationDate' => true,
      'creationDate' => true,
    ),
    'search' => 
    array (
      'id' => true,
      'key' => false,
      'path' => true,
      'published' => true,
      'modificationDate' => true,
      'creationDate' => true,
    ),
  ),
   'enableGridLocking' => false,
   'deletedDataComponents' => 
  array (
  ),
   'blockedVarsForExport' => 
  array (
  ),
   'fieldDefinitionsCache' => 
  array (
  ),
   'activeDispatchingEvents' => 
  array (
  ),
));
