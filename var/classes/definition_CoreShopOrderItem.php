<?php

/**
 * Inheritance: no
 * Variants: no
 *
 * Fields Summary:
 * - localizedfields [localizedfields]
 * -- name [input]
 * - isGiftItem [checkbox]
 * - digitalProduct [checkbox]
 * - unitIdentifier [input]
 * - unit [coreShopProductUnit]
 * - customItemDiscount [numeric]
 * - quantity [numeric]
 * - allocatedQuantity [numeric]
 * - defaultUnitQuantity [numeric]
 * - product [coreShopRelation]
 * - objectId [numeric]
 * - mainObjectId [numeric]
 * - itemWeight [numeric]
 * - totalWeight [numeric]
 * - unitDefinition [coreShopProductUnitDefinition]
 * - order [coreShopRelation]
 * - totalDepositNet [coreShopMoney]
 * - totalDepositGross [coreShopMoney]
 * - depositPercentage [numeric]
 * - deposit [checkbox]
 * - immutable [booleanSelect]
 * - itemWholesalePrice [coreShopMoney]
 * - customItemPrice [coreShopMoney]
 * - itemDiscountNet [coreShopMoney]
 * - itemDiscountGross [coreShopMoney]
 * - itemDiscountPriceNet [coreShopMoney]
 * - itemDiscountPriceGross [coreShopMoney]
 * - itemPriceNet [coreShopMoney]
 * - itemPriceGross [coreShopMoney]
 * - itemRetailPriceNet [coreShopMoney]
 * - itemRetailPriceGross [coreShopMoney]
 * - subtotalNet [coreShopMoney]
 * - subtotalGross [coreShopMoney]
 * - totalNet [coreShopMoney]
 * - totalGross [coreShopMoney]
 * - itemTax [coreShopMoney]
 * - taxes [fieldcollections]
 * - pimcoreAdjustmentTotalNet [coreShopMoney]
 * - pimcoreAdjustmentTotalGross [coreShopMoney]
 * - adjustmentItems [fieldcollections]
 * - convertedItemWholesalePrice [coreShopMoney]
 * - convertedCustomItemPrice [coreShopMoney]
 * - convertedItemDiscountNet [coreShopMoney]
 * - convertedItemDiscountGross [coreShopMoney]
 * - convertedItemDiscountPriceNet [coreShopMoney]
 * - convertedItemDiscountPriceGross [coreShopMoney]
 * - convertedItemPriceNet [coreShopMoney]
 * - convertedItemPriceGross [coreShopMoney]
 * - convertedItemRetailPriceNet [coreShopMoney]
 * - convertedItemRetailPriceGross [coreShopMoney]
 * - convertedTotalNet [coreShopMoney]
 * - convertedTotalGross [coreShopMoney]
 * - convertedSubtotalNet [coreShopMoney]
 * - convertedSubtotalGross [coreShopMoney]
 * - convertedItemTax [coreShopMoney]
 * - convertedTaxes [fieldcollections]
 * - convertedPimcoreAdjustmentTotalNet [coreShopMoney]
 * - convertedPimcoreAdjustmentTotalGross [coreShopMoney]
 * - convertedAdjustmentItems [fieldcollections]
 * - priceRuleItems [fieldcollections]
 * - attributes [fieldcollections]
 */

return \Pimcore\Model\DataObject\ClassDefinition::__set_state(array(
   'dao' => NULL,
   'id' => 'cs_order_item',
   'name' => 'CoreShopOrderItem',
   'title' => '',
   'description' => '',
   'creationDate' => NULL,
   'modificationDate' => 1729769577,
   'userOwner' => 0,
   'userModification' => 0,
   'parentClass' => 'CoreShop\\Component\\Core\\Model\\OrderItem',
   'implementsInterfaces' => '\\CoreShop\\Bundle\\WarehouseBundle\\Model\\AllocationAwareInterface,\\CoreShop\\Bundle\\DepositBundle\\Model\\DepositItemAwareInterface',
   'listingParentClass' => '',
   'useTraits' => '\\CoreShop\\Bundle\\DepositBundle\\Model\\DepositItemAwareTrait',
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
      \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
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
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Fieldset::__set_state(array(
                 'name' => 'informations',
                 'type' => NULL,
                 'region' => NULL,
                 'title' => 'coreshop.order_item.informations',
                 'width' => 0,
                 'height' => 0,
                 'collapsible' => false,
                 'collapsed' => false,
                 'bodyStyle' => '',
                 'datatype' => 'layout',
                 'children' => 
                array (
                  0 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Localizedfields::__set_state(array(
                     'name' => 'localizedfields',
                     'title' => NULL,
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
                     'visibleGridView' => true,
                     'visibleSearch' => true,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'children' => 
                    array (
                      0 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                         'name' => 'name',
                         'title' => 'coreshop.order_item.name',
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
                    ),
                     'region' => NULL,
                     'layout' => NULL,
                     'maxTabs' => NULL,
                     'border' => false,
                     'provideSplitView' => false,
                     'tabPosition' => 'top',
                     'hideLabelsWhenTabsReached' => NULL,
                     'referencedFields' => 
                    array (
                    ),
                     'permissionView' => NULL,
                     'permissionEdit' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                     'width' => NULL,
                     'height' => NULL,
                     'fieldDefinitionsCache' => NULL,
                  )),
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                     'name' => 'isGiftItem',
                     'title' => 'coreshop.order_item.is_gift_item',
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
                  2 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                     'name' => 'digitalProduct',
                     'title' => 'coreshop.order_item.digital_product',
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
                  3 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                     'name' => 'unitIdentifier',
                     'title' => 'coreshop.order_item.unit_identifier',
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
                  \CoreShop\Bundle\ProductBundle\CoreExtension\ProductUnit::__set_state(array(
                     'name' => 'unit',
                     'title' => 'coreshop.order_item.unit',
                     'tooltip' => '',
                     'mandatory' => false,
                     'noteditable' => true,
                     'index' => false,
                     'locked' => false,
                     'style' => '',
                     'permissions' => NULL,
                     'fieldtype' => 'coreShopProductUnit',
                     'relationType' => false,
                     'invisible' => false,
                     'visibleGridView' => false,
                     'visibleSearch' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'allowEmpty' => true,
                  )),
                  5 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'customItemDiscount',
                     'title' => 'coreshop.order_item.custom_item_discount',
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
                  6 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'quantity',
                     'title' => 'coreshop.order_item.quantity',
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
                  7 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'allocatedQuantity',
                     'title' => 'Allocated Quantity',
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
                     'integer' => false,
                     'unsigned' => false,
                     'minValue' => NULL,
                     'maxValue' => NULL,
                     'unique' => false,
                     'decimalSize' => NULL,
                     'decimalPrecision' => NULL,
                     'width' => 0,
                     'defaultValueGenerator' => '',
                  )),
                  8 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'defaultUnitQuantity',
                     'title' => 'coreshop.order_item.default_unit_quantity',
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
                  9 => 
                  \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                     'name' => 'product',
                     'title' => 'coreshop.order_item.product',
                     'tooltip' => NULL,
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
                        'classes' => 'CoreShopProduct',
                      ),
                      1 => 
                      array (
                        'classes' => 'CoreShopVoucherProduct',
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
                     'stack' => 'coreshop.purchasable',
                     'returnConcrete' => false,
                  )),
                  10 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'objectId',
                     'title' => 'coreshop.order_item.object_id',
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
                  11 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'mainObjectId',
                     'title' => 'coreshop.order_item.main_object_id',
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
                  12 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'itemWeight',
                     'title' => 'coreshop.order_item.item_weight',
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
                  13 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'totalWeight',
                     'title' => 'coreshop.order_item.total_weight',
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
                  14 => 
                  \CoreShop\Bundle\ProductBundle\CoreExtension\ProductUnitDefinition::__set_state(array(
                     'name' => 'unitDefinition',
                     'title' => 'coreshop.order_item.unit_definition',
                     'tooltip' => '',
                     'mandatory' => false,
                     'noteditable' => true,
                     'index' => false,
                     'locked' => false,
                     'style' => '',
                     'permissions' => NULL,
                     'fieldtype' => 'coreShopProductUnitDefinition',
                     'relationType' => false,
                     'invisible' => false,
                     'visibleGridView' => false,
                     'visibleSearch' => false,
                     'blockedVarsForExport' => 
                    array (
                    ),
                     'phpdocType' => '\\CoreShop\\Component\\Product\\Model\\ProductUnitDefinitionInterface',
                     'allowEmpty' => false,
                  )),
                  15 => 
                  \CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                     'name' => 'order',
                     'title' => 'coreshop.order_item.order',
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
                        'classes' => 'CoreShopOrder',
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
                     'width' => NULL,
                     'stack' => 'coreshop.order',
                     'returnConcrete' => false,
                  )),
                  16 => 
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
                  17 => 
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
                  18 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Numeric::__set_state(array(
                     'name' => 'depositPercentage',
                     'title' => 'Deposit Percentage',
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
                     'integer' => false,
                     'unsigned' => false,
                     'minValue' => NULL,
                     'maxValue' => NULL,
                     'unique' => false,
                     'decimalSize' => NULL,
                     'decimalPrecision' => NULL,
                     'width' => NULL,
                     'defaultValueGenerator' => '',
                  )),
                  19 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
                     'name' => 'deposit',
                     'title' => 'Deposit',
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
                  20 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\BooleanSelect::__set_state(array(
                     'name' => 'immutable',
                     'title' => 'coreshop.order_item.immutable',
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
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Tabpanel::__set_state(array(
                 'name' => 'numbers',
                 'type' => NULL,
                 'region' => NULL,
                 'title' => 'coreshop.order_item.numbers',
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
                     'title' => 'coreshop.order_item.numbers_store',
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
                         'name' => 'itemWholesalePrice',
                         'title' => 'coreshop.order_item.item_wholesale_price',
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
                         'name' => 'customItemPrice',
                         'title' => 'coreshop.order_item.custom_item_price',
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
                         'name' => 'itemDiscountNet',
                         'title' => 'coreshop.order_item.item_discount_net',
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
                         'name' => 'itemDiscountGross',
                         'title' => 'coreshop.order_item.item_discount_gross',
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
                         'name' => 'itemDiscountPriceNet',
                         'title' => 'coreshop.order_item.item_discount_price_net',
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
                      5 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemDiscountPriceGross',
                         'title' => 'coreshop.order_item.item_discount_price_gross',
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
                      6 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemPriceNet',
                         'title' => 'coreshop.order_item.item_price_net',
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
                      7 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemPriceGross',
                         'title' => 'coreshop.order_item.item_price_gross',
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
                      8 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemRetailPriceNet',
                         'title' => 'coreshop.order_item.item_retail_price_net',
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
                      9 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemRetailPriceGross',
                         'title' => 'coreshop.order_item.item_retail_price_gross',
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
                      10 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalNet',
                         'title' => 'coreshop.order_item.subtotal_net',
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
                      11 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalGross',
                         'title' => 'coreshop.order_item.subtotal_gross',
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
                      12 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalNet',
                         'title' => 'coreshop.order_item.total_net',
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
                      13 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalGross',
                         'title' => 'coreshop.order_item.total_gross',
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
                      14 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'itemTax',
                         'title' => 'coreshop.order_item.item_tax',
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
                      15 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'taxes',
                         'title' => 'coreshop.order_item.taxes',
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
                      16 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order_item.adjustments_total_net',
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
                      17 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order_item.adjustments_total_gross',
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
                      18 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'adjustmentItems',
                         'title' => 'coreshop.order_item.adjustments',
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
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'numbers_converted',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order_item.numbers_converted',
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
                         'name' => 'convertedItemWholesalePrice',
                         'title' => 'coreshop.order_item.converted_item_wholesale_price',
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
                         'name' => 'convertedCustomItemPrice',
                         'title' => 'coreshop.order_item.converted_custom_item_price',
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
                         'name' => 'convertedItemDiscountNet',
                         'title' => 'coreshop.order_item.converted_item_discount_net',
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
                         'name' => 'convertedItemDiscountGross',
                         'title' => 'coreshop.order_item.converted_item_discount_gross',
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
                         'name' => 'convertedItemDiscountPriceNet',
                         'title' => 'coreshop.order_item.converted_item_discount_price_net',
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
                      5 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemDiscountPriceGross',
                         'title' => 'coreshop.order_item.converted_item_discount_price_gross',
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
                      6 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemPriceNet',
                         'title' => 'coreshop.order_item.converted_item_price_net',
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
                      7 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemPriceGross',
                         'title' => 'coreshop.order_item.converted_item_price_gross',
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
                      8 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemRetailPriceNet',
                         'title' => 'coreshop.order_item.converted_item_retail_price_net',
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
                      9 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemRetailPriceGross',
                         'title' => 'coreshop.order_item.converted_item_retail_price_gross',
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
                      10 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalNet',
                         'title' => 'coreshop.order_item.converted_total_net',
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
                      11 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalGross',
                         'title' => 'coreshop.order_item.converted_total_gross',
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
                      12 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalNet',
                         'title' => 'coreshop.order_item.converted_subtotal_net',
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
                      13 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalGross',
                         'title' => 'coreshop.order_item.converted_subtotal_gross',
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
                      14 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedItemTax',
                         'title' => 'coreshop.order_item.converted_item_tax',
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
                      15 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'convertedTaxes',
                         'title' => 'coreshop.order_item.converted_taxes',
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
                      16 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order_item.converted_adjustments',
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
                      17 => 
                      \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order_item.converted_adjustments_total_gross',
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
                      18 => 
                      \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'convertedAdjustmentItems',
                         'title' => 'coreshop.order_item.converted_adjustments_total_net',
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
                 'fieldtype' => 'tabpanel',
                 'border' => false,
                 'tabPosition' => 'top',
              )),
              2 => 
              \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
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
                      0 => 'CoreShopPriceRuleItem',
                    ),
                     'lazyLoading' => true,
                     'maxItems' => NULL,
                     'disallowAddRemove' => false,
                     'disallowReorder' => false,
                     'collapsed' => false,
                     'collapsible' => false,
                     'border' => false,
                  )),
                  1 => 
                  \Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                     'name' => 'attributes',
                     'title' => 'coreshop.order.attributes',
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
