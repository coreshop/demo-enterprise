<?php

/**
 * Inheritance: no
 * Variants: no
 *
 * Fields Summary:
 * - order [coreShopRelation]
 * - invoiceDate [date]
 * - invoiceNumber [input]
 * - state [input]
 * - totalNet [coreShopMoney]
 * - totalGross [coreShopMoney]
 * - subtotalNet [coreShopMoney]
 * - subtotalGross [coreShopMoney]
 * - adjustmentItems [fieldcollections]
 * - pimcoreAdjustmentTotalGross [coreShopMoney]
 * - pimcoreAdjustmentTotalNet [coreShopMoney]
 * - convertedTotalNet [coreShopMoney]
 * - convertedTotalGross [coreShopMoney]
 * - convertedSubtotalNet [coreShopMoney]
 * - convertedSubtotalGross [coreShopMoney]
 * - convertedAdjustmentItems [fieldcollections]
 * - convertedPimcoreAdjustmentTotalGross [coreShopMoney]
 * - convertedPimcoreAdjustmentTotalNet [coreShopMoney]
 * - items [coreShopRelations]
 */

return Pimcore\Model\DataObject\ClassDefinition::__set_state(array(
   'dao' => NULL,
   'id' => 'cs_order_invoice',
   'name' => 'CoreShopOrderInvoice',
   'title' => '',
   'description' => '',
   'creationDate' => NULL,
   'modificationDate' => 1702546719,
   'userOwner' => 0,
   'userModification' => 0,
   'parentClass' => 'CoreShop\\Component\\Order\\Model\\OrderInvoice',
   'implementsInterfaces' => NULL,
   'listingParentClass' => '',
   'useTraits' => '',
   'listingUseTraits' => '',
   'encryption' => false,
   'encryptedTables' => 
  array (
  ),
   'allowInherit' => false,
   'allowVariants' => false,
   'showVariants' => false,
   'layoutDefinitions' => 
  Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
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
      Pimcore\Model\DataObject\ClassDefinition\Layout\Tabpanel::__set_state(array(
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
          Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'Invoice',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order_invoice.invoice',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelation::__set_state(array(
                 'name' => 'order',
                 'title' => 'coreshop.order_invoice.order',
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
                 'width' => '',
                 'stack' => 'coreshop.order',
                 'returnConcrete' => false,
              )),
              1 => 
              Pimcore\Model\DataObject\ClassDefinition\Data\Date::__set_state(array(
                 'name' => 'invoiceDate',
                 'title' => 'coreshop.order_invoice.date',
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
                 'columnType' => 'bigint(20)',
                 'defaultValueGenerator' => '',
              )),
              2 => 
              Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'invoiceNumber',
                 'title' => 'coreshop.order_invoice.number',
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
              Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
                 'name' => 'state',
                 'title' => 'coreshop.order_invoice.state',
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
          Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'Numbers',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order_invoice.numbers',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              Pimcore\Model\DataObject\ClassDefinition\Layout\Tabpanel::__set_state(array(
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
                  Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'numbers_store',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order_invoice.numbers_store',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalNet',
                         'title' => 'coreshop.order_invoice.total_net',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'totalGross',
                         'title' => 'coreshop.order_invoice.total_gross',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalNet',
                         'title' => 'coreshop.order_invoice.subtotal_net',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'subtotalGross',
                         'title' => 'coreshop.order_invoice.subtotal_gross',
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
                      Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'adjustmentItems',
                         'title' => 'coreshop.order_invoice.adjustments',
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
                      5 => 
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order_invoice.adjustments_total_gross',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'pimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order_invoice.adjustments_total_net',
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
                     'fieldtype' => 'panel',
                     'layout' => NULL,
                     'border' => false,
                     'icon' => NULL,
                     'labelWidth' => 100,
                     'labelAlign' => 'left',
                  )),
                  1 => 
                  Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
                     'name' => 'numbers_converted',
                     'type' => NULL,
                     'region' => NULL,
                     'title' => 'coreshop.order_invoice.numbers_converted',
                     'width' => 0,
                     'height' => 0,
                     'collapsible' => false,
                     'collapsed' => false,
                     'bodyStyle' => '',
                     'datatype' => 'layout',
                     'children' => 
                    array (
                      0 => 
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalNet',
                         'title' => 'coreshop.order_invoice.converted_total_net',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedTotalGross',
                         'title' => 'coreshop.order_invoice.converted_total_gross',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalNet',
                         'title' => 'coreshop.order_invoice.converted_subtotal_net',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedSubtotalGross',
                         'title' => 'coreshop.order_invoice.converted_subtotal_gross',
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
                      Pimcore\Model\DataObject\ClassDefinition\Data\Fieldcollections::__set_state(array(
                         'name' => 'convertedAdjustmentItems',
                         'title' => 'coreshop.order_invoice.converted_adjustments',
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
                      5 => 
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalGross',
                         'title' => 'coreshop.order_invoice.converted_adjustments_total_gross',
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
                      CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
                         'name' => 'convertedPimcoreAdjustmentTotalNet',
                         'title' => 'coreshop.order_invoice.converted_adjustments_total_net',
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
          2 => 
          Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
             'name' => 'Items',
             'type' => NULL,
             'region' => NULL,
             'title' => 'coreshop.order_invoice.items',
             'width' => 0,
             'height' => 0,
             'collapsible' => false,
             'collapsed' => false,
             'bodyStyle' => '',
             'datatype' => 'layout',
             'children' => 
            array (
              0 => 
              CoreShop\Bundle\ResourceBundle\CoreExtension\CoreShopRelations::__set_state(array(
                 'name' => 'items',
                 'title' => 'coreshop.order_invoice.items',
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
                 'stack' => 'coreshop.order_invoice_item',
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
