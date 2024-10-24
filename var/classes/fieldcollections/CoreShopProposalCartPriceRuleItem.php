<?php

/**
 * Fields Summary:
 * - cartPriceRule [coreShopCartPriceRule]
 * - voucherCode [input]
 * - discountNet [coreShopMoney]
 * - discountGross [coreShopMoney]
 */

return \Pimcore\Model\DataObject\Fieldcollection\Definition::__set_state(array(
   'dao' => NULL,
   'key' => 'CoreShopProposalCartPriceRuleItem',
   'parentClass' => 'CoreShop\\Component\\Order\\Model\\ProposalCartPriceRuleItem',
   'implementsInterfaces' => NULL,
   'title' => NULL,
   'group' => 'CoreShop',
   'layoutDefinitions' => 
  \Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
     'name' => NULL,
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
          \CoreShop\Bundle\OrderBundle\CoreExtension\CartPriceRule::__set_state(array(
             'name' => 'cartPriceRule',
             'title' => 'coreshop.cart_price_rule_item.price_rule',
             'tooltip' => '',
             'mandatory' => false,
             'noteditable' => false,
             'index' => false,
             'locked' => false,
             'style' => '',
             'permissions' => NULL,
             'fieldtype' => 'coreShopCartPriceRule',
             'relationType' => false,
             'invisible' => false,
             'visibleGridView' => false,
             'visibleSearch' => false,
             'blockedVarsForExport' => 
            array (
            ),
             'allowEmpty' => false,
             'phpdocType' => 'CoreShop\\Component\\Order\\Model\\CartPriceRule',
          )),
          1 => 
          \Pimcore\Model\DataObject\ClassDefinition\Data\Input::__set_state(array(
             'name' => 'voucherCode',
             'title' => 'coreshop.cart_price_rule_item.voucher_code',
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
          \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
             'name' => 'discountNet',
             'title' => 'coreshop.cart_price_rule_item.discount_net',
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
          3 => 
          \CoreShop\Bundle\MoneyBundle\CoreExtension\Money::__set_state(array(
             'name' => 'discountGross',
             'title' => 'coreshop.cart_price_rule_item.discount_gross',
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
   'fieldDefinitionsCache' => NULL,
   'blockedVarsForExport' => 
  array (
  ),
   'activeDispatchingEvents' => 
  array (
  ),
));
