
SET NAMES utf8mb4;



DROP TABLE IF EXISTS `cache_items`;
CREATE TABLE `cache_items` (
  `item_id` varbinary(255) NOT NULL,
  `item_data` mediumblob NOT NULL,
  `item_lifetime` int unsigned DEFAULT NULL,
  `item_time` int unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;



DROP TABLE IF EXISTS `coreshop_address_identifier`;
CREATE TABLE `coreshop_address_identifier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_batch_messenger_task`;
CREATE TABLE `coreshop_batch_messenger_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `taskData` json NOT NULL,
  `batchSize` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_batch_messenger_task_item`;
CREATE TABLE `coreshop_batch_messenger_task_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task` int DEFAULT NULL,
  `taskData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '(DC2Type:object)',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `error` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9EE681D5527EDB25` (`task`),
  CONSTRAINT `FK_9EE681D5527EDB25` FOREIGN KEY (`task`) REFERENCES `coreshop_batch_messenger_task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_carrier`;
CREATE TABLE `coreshop_carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trackingUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hideFromCheckout` tinyint(1) NOT NULL,
  `logo` int DEFAULT NULL COMMENT '(DC2Type:pimcoreAsset)',
  `taxCalculationStrategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `taxRuleGroupId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD869DA27EE5294C` (`taxRuleGroupId`),
  CONSTRAINT `FK_CD869DA27EE5294C` FOREIGN KEY (`taxRuleGroupId`) REFERENCES `coreshop_tax_rule_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_carrier_stores`;
CREATE TABLE `coreshop_carrier_stores` (
  `carrier_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`carrier_id`,`store_id`),
  KEY `IDX_E7EE2F7C21DFC797` (`carrier_id`),
  KEY `IDX_E7EE2F7CB092A811` (`store_id`),
  CONSTRAINT `FK_E7EE2F7C21DFC797` FOREIGN KEY (`carrier_id`) REFERENCES `coreshop_carrier` (`id`),
  CONSTRAINT `FK_E7EE2F7CB092A811` FOREIGN KEY (`store_id`) REFERENCES `coreshop_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_carrier_translation`;
CREATE TABLE `coreshop_carrier_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_carrier_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_CE09FC1C2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_CE09FC1C2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_carrier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule`;
CREATE TABLE `coreshop_cart_price_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isVoucherRule` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule_action`;
CREATE TABLE `coreshop_cart_price_rule_action` (
  `price_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`action_id`),
  KEY `IDX_830435D1F68CB0D` (`price_rule_id`),
  KEY `IDX_830435D9D32F035` (`action_id`),
  CONSTRAINT `FK_830435D1F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_cart_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_830435D9D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule_conditions`;
CREATE TABLE `coreshop_cart_price_rule_conditions` (
  `price_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`condition_id`),
  KEY `IDX_1ED1D4341F68CB0D` (`price_rule_id`),
  KEY `IDX_1ED1D434887793B6` (`condition_id`),
  CONSTRAINT `FK_1ED1D4341F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_cart_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1ED1D434887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule_translation`;
CREATE TABLE `coreshop_cart_price_rule_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_cart_price_rule_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_3A3D1D4B2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_3A3D1D4B2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_cart_price_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule_voucher_code`;
CREATE TABLE `coreshop_cart_price_rule_voucher_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `used` tinyint(1) NOT NULL,
  `uses` int NOT NULL,
  `creditUsed` int NOT NULL,
  `creditAvailable` int NOT NULL,
  `isCreditCode` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `cartPriceRuleId` int DEFAULT NULL,
  `currencyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `IDX_4AF500A9B1729C3C` (`cartPriceRuleId`),
  KEY `IDX_4AF500A991000B8A` (`currencyId`),
  CONSTRAINT `FK_4AF500A991000B8A` FOREIGN KEY (`currencyId`) REFERENCES `coreshop_currency` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4AF500A9B1729C3C` FOREIGN KEY (`cartPriceRuleId`) REFERENCES `coreshop_cart_price_rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_cart_price_rule_voucher_code_customer`;
CREATE TABLE `coreshop_cart_price_rule_voucher_code_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `uses` int NOT NULL,
  `voucherCodeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucherCodeId_customerId` (`voucherCodeId`,`customerId`),
  KEY `IDX_7F7BC3AAFDD3BBCD` (`voucherCodeId`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `FK_7F7BC3AAFDD3BBCD` FOREIGN KEY (`voucherCodeId`) REFERENCES `coreshop_cart_price_rule_voucher_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_configuration`;
CREATE TABLE `coreshop_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `configKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '(DC2Type:object)',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70538D04B092A811` (`store_id`),
  CONSTRAINT `FK_70538D04B092A811` FOREIGN KEY (`store_id`) REFERENCES `coreshop_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_country`;
CREATE TABLE `coreshop_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isoCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `addressFormat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `salutations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:simple_array)',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `zoneId` int DEFAULT NULL,
  `currencyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9CCA5D8FE98B76E` (`zoneId`),
  KEY `IDX_D9CCA5D891000B8A` (`currencyId`),
  KEY `isoCode` (`isoCode`),
  CONSTRAINT `FK_D9CCA5D891000B8A` FOREIGN KEY (`currencyId`) REFERENCES `coreshop_currency` (`id`),
  CONSTRAINT `FK_D9CCA5D8FE98B76E` FOREIGN KEY (`zoneId`) REFERENCES `coreshop_zone` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_country_translation`;
CREATE TABLE `coreshop_country_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_country_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_EA69BBC42C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_EA69BBC42C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_currency`;
CREATE TABLE `coreshop_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isoCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numericIsoCode` int DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isoCode` (`isoCode`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_customer_cluster`;
CREATE TABLE `coreshop_customer_cluster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_deposit_store_values`;
CREATE TABLE `coreshop_deposit_store_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store` int DEFAULT NULL,
  `product` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  `allowDeposit` tinyint(1) NOT NULL,
  `depositPercentage` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_store` (`product`,`store`),
  KEY `IDX_30720632FF575877` (`store`),
  CONSTRAINT `FK_30720632FF575877` FOREIGN KEY (`store`) REFERENCES `coreshop_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_document_route`;
CREATE TABLE `coreshop_document_route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `document` int DEFAULT NULL COMMENT '(DC2Type:pimcoreDocument)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_document_site_route`;
CREATE TABLE `coreshop_document_site_route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documentRouteId` int DEFAULT NULL,
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2CCA8F4A67C2CC38` (`documentRouteId`),
  CONSTRAINT `FK_2CCA8F4A67C2CC38` FOREIGN KEY (`documentRouteId`) REFERENCES `coreshop_document_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_document_site_route_translation`;
CREATE TABLE `coreshop_document_site_route_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `document` int DEFAULT NULL COMMENT '(DC2Type:pimcoreDocument)',
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_document_site_route_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_DFC186862C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_DFC186862C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_document_site_route` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_exchange_rate`;
CREATE TABLE `coreshop_exchange_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exchangeRate` decimal(15,10) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `fromCurrency` int NOT NULL,
  `toCurrency` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies` (`fromCurrency`,`toCurrency`),
  KEY `IDX_3CE337786236E8BB` (`fromCurrency`),
  KEY `IDX_3CE337786AF036E1` (`toCurrency`),
  CONSTRAINT `FK_3CE337786236E8BB` FOREIGN KEY (`fromCurrency`) REFERENCES `coreshop_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3CE337786AF036E1` FOREIGN KEY (`toCurrency`) REFERENCES `coreshop_currency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_filter`;
CREATE TABLE `coreshop_filter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resultsPerPage` int DEFAULT NULL,
  `orderDirection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `indexId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A5610D06E070063B` (`indexId`),
  CONSTRAINT `FK_A5610D06E070063B` FOREIGN KEY (`indexId`) REFERENCES `coreshop_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_filter_condition`;
CREATE TABLE `coreshop_filter_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityUnit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  `sort` int DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_filter_condition_conditions`;
CREATE TABLE `coreshop_filter_condition_conditions` (
  `filterId` int NOT NULL,
  `conditionId` int NOT NULL,
  PRIMARY KEY (`filterId`,`conditionId`),
  KEY `IDX_51AF9C632E051C4F` (`filterId`),
  KEY `IDX_51AF9C63128AE9F0` (`conditionId`),
  CONSTRAINT `FK_51AF9C63128AE9F0` FOREIGN KEY (`conditionId`) REFERENCES `coreshop_filter_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_51AF9C632E051C4F` FOREIGN KEY (`filterId`) REFERENCES `coreshop_filter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_filter_condition_pre_conditions`;
CREATE TABLE `coreshop_filter_condition_pre_conditions` (
  `filterId` int NOT NULL,
  `conditionId` int NOT NULL,
  PRIMARY KEY (`filterId`,`conditionId`),
  KEY `IDX_F38B1F712E051C4F` (`filterId`),
  KEY `IDX_F38B1F71128AE9F0` (`conditionId`),
  CONSTRAINT `FK_F38B1F71128AE9F0` FOREIGN KEY (`conditionId`) REFERENCES `coreshop_filter_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F38B1F712E051C4F` FOREIGN KEY (`filterId`) REFERENCES `coreshop_filter` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_inbound_email`;
CREATE TABLE `coreshop_inbound_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imap_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `server_encoding` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_inbound_email_rule`;
CREATE TABLE `coreshop_inbound_email_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inbound_email_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_11EA28BBE540AEA2` (`inbound_email_id`),
  CONSTRAINT `FK_11EA28BBE540AEA2` FOREIGN KEY (`inbound_email_id`) REFERENCES `coreshop_inbound_email` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_inbound_email_rule_action`;
CREATE TABLE `coreshop_inbound_email_rule_action` (
  `inbound_email_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`inbound_email_rule_id`,`action_id`),
  KEY `IDX_FDB31894568B47E1` (`inbound_email_rule_id`),
  KEY `IDX_FDB318949D32F035` (`action_id`),
  CONSTRAINT `FK_FDB31894568B47E1` FOREIGN KEY (`inbound_email_rule_id`) REFERENCES `coreshop_inbound_email_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FDB318949D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_inbound_email_rule_conditions`;
CREATE TABLE `coreshop_inbound_email_rule_conditions` (
  `inbound_email_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`inbound_email_rule_id`,`action_id`),
  KEY `IDX_A80479F2568B47E1` (`inbound_email_rule_id`),
  KEY `IDX_A80479F29D32F035` (`action_id`),
  CONSTRAINT `FK_A80479F2568B47E1` FOREIGN KEY (`inbound_email_rule_id`) REFERENCES `coreshop_inbound_email_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A80479F29D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_index`;
CREATE TABLE `coreshop_index` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `worker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '(DC2Type:array)',
  `indexLastVersion` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_index_column`;
CREATE TABLE `coreshop_index_column` (
  `id` int NOT NULL AUTO_INCREMENT,
  `objectKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `objectType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dataType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `getter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `columnType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `getterConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  `interpreter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `interpreterConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `indexId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B5A44FADE070063B` (`indexId`),
  CONSTRAINT `FK_B5A44FADE070063B` FOREIGN KEY (`indexId`) REFERENCES `coreshop_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_account`;
CREATE TABLE `coreshop_loyalty_points_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `points` int NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_rule`;
CREATE TABLE `coreshop_loyalty_points_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_rule_action`;
CREATE TABLE `coreshop_loyalty_points_rule_action` (
  `loyalty_points_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`loyalty_points_rule_id`,`action_id`),
  KEY `IDX_BA1E048EB8A98CFB` (`loyalty_points_rule_id`),
  KEY `IDX_BA1E048E9D32F035` (`action_id`),
  CONSTRAINT `FK_BA1E048E9D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BA1E048EB8A98CFB` FOREIGN KEY (`loyalty_points_rule_id`) REFERENCES `coreshop_loyalty_points_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_rule_conditions`;
CREATE TABLE `coreshop_loyalty_points_rule_conditions` (
  `loyalty_points_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`loyalty_points_rule_id`,`condition_id`),
  KEY `IDX_718D828AB8A98CFB` (`loyalty_points_rule_id`),
  KEY `IDX_718D828A887793B6` (`condition_id`),
  CONSTRAINT `FK_718D828A887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_718D828AB8A98CFB` FOREIGN KEY (`loyalty_points_rule_id`) REFERENCES `coreshop_loyalty_points_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_rule_translation`;
CREATE TABLE `coreshop_loyalty_points_rule_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_loyalty_points_rule_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_168BDF962C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_168BDF962C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_loyalty_points_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_loyalty_points_transaction`;
CREATE TABLE `coreshop_loyalty_points_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loyalty_account` int DEFAULT NULL,
  `pointsValue` int NOT NULL,
  `type` enum('income','expense') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detailParams` json NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_144F7D5D11F7BE17` (`loyalty_account`),
  CONSTRAINT `FK_144F7D5D11F7BE17` FOREIGN KEY (`loyalty_account`) REFERENCES `coreshop_loyalty_points_account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_notification_rule`;
CREATE TABLE `coreshop_notification_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `sort` int NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_notification_rule_action`;
CREATE TABLE `coreshop_notification_rule_action` (
  `notification_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`notification_id`,`action_id`),
  KEY `IDX_D2282E7BEF1A9D84` (`notification_id`),
  KEY `IDX_D2282E7B9D32F035` (`action_id`),
  CONSTRAINT `FK_D2282E7B9D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D2282E7BEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `coreshop_notification_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_notification_rule_conditions`;
CREATE TABLE `coreshop_notification_rule_conditions` (
  `notification_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`notification_id`,`action_id`),
  KEY `IDX_3F9ADF36EF1A9D84` (`notification_id`),
  KEY `IDX_3F9ADF369D32F035` (`action_id`),
  CONSTRAINT `FK_3F9ADF369D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3F9ADF36EF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `coreshop_notification_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment`;
CREATE TABLE `coreshop_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_provider_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderId` int NOT NULL,
  `datePayment` datetime NOT NULL,
  `details` json NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amount` int DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  PRIMARY KEY (`id`),
  KEY `IDX_E797E8B3FCDF7870` (`payment_provider_id`),
  KEY `IDX_E797E8B338248176` (`currency_id`),
  CONSTRAINT `FK_E797E8B338248176` FOREIGN KEY (`currency_id`) REFERENCES `coreshop_currency` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E797E8B3FCDF7870` FOREIGN KEY (`payment_provider_id`) REFERENCES `coreshop_payment_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_gateway_config`;
CREATE TABLE `coreshop_payment_gateway_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `factory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `config` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider`;
CREATE TABLE `coreshop_payment_provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gateway_config_id` int DEFAULT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int NOT NULL,
  `logo` int DEFAULT NULL COMMENT '(DC2Type:pimcoreAsset)',
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BCF697F8772E836A` (`identifier`),
  KEY `IDX_BCF697F8F23D6140` (`gateway_config_id`),
  CONSTRAINT `FK_BCF697F8F23D6140` FOREIGN KEY (`gateway_config_id`) REFERENCES `coreshop_payment_gateway_config` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_rule`;
CREATE TABLE `coreshop_payment_provider_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_rule_actions`;
CREATE TABLE `coreshop_payment_provider_rule_actions` (
  `payment_provider_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`payment_provider_rule_id`,`action_id`),
  KEY `IDX_2E18D07CBCEDB48` (`payment_provider_rule_id`),
  KEY `IDX_2E18D079D32F035` (`action_id`),
  CONSTRAINT `FK_2E18D079D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2E18D07CBCEDB48` FOREIGN KEY (`payment_provider_rule_id`) REFERENCES `coreshop_payment_provider_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_rule_conditions`;
CREATE TABLE `coreshop_payment_provider_rule_conditions` (
  `payment_provider_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`payment_provider_rule_id`,`condition_id`),
  KEY `IDX_7F17A500CBCEDB48` (`payment_provider_rule_id`),
  KEY `IDX_7F17A500887793B6` (`condition_id`),
  CONSTRAINT `FK_7F17A500887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7F17A500CBCEDB48` FOREIGN KEY (`payment_provider_rule_id`) REFERENCES `coreshop_payment_provider_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_rule_group`;
CREATE TABLE `coreshop_payment_provider_rule_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priority` int NOT NULL,
  `stopPropagation` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `paymentProviderId` int NOT NULL,
  `paymentProviderRuleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B47BF83C7FADB943` (`paymentProviderId`),
  KEY `IDX_B47BF83CD9601F4E` (`paymentProviderRuleId`),
  CONSTRAINT `FK_B47BF83C7FADB943` FOREIGN KEY (`paymentProviderId`) REFERENCES `coreshop_payment_provider` (`id`),
  CONSTRAINT `FK_B47BF83CD9601F4E` FOREIGN KEY (`paymentProviderRuleId`) REFERENCES `coreshop_payment_provider_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_stores`;
CREATE TABLE `coreshop_payment_provider_stores` (
  `payment_method_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`payment_method_id`,`store_id`),
  KEY `IDX_EB819DD55AA1164F` (`payment_method_id`),
  KEY `IDX_EB819DD5B092A811` (`store_id`),
  CONSTRAINT `FK_EB819DD55AA1164F` FOREIGN KEY (`payment_method_id`) REFERENCES `coreshop_payment_provider` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EB819DD5B092A811` FOREIGN KEY (`store_id`) REFERENCES `coreshop_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_provider_translation`;
CREATE TABLE `coreshop_payment_provider_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_payment_provider_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_EB7B44FB2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_EB7B44FB2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_payment_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_payment_security_token`;
CREATE TABLE `coreshop_payment_security_token` (
  `hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:object)',
  `afterUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `targetUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gatewayName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_price_rule`;
CREATE TABLE `coreshop_product_price_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `stopPropagation` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_price_rule_action`;
CREATE TABLE `coreshop_product_price_rule_action` (
  `price_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`action_id`),
  KEY `IDX_47E36FB81F68CB0D` (`price_rule_id`),
  KEY `IDX_47E36FB89D32F035` (`action_id`),
  CONSTRAINT `FK_47E36FB81F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_product_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_47E36FB89D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_price_rule_conditions`;
CREATE TABLE `coreshop_product_price_rule_conditions` (
  `price_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`condition_id`),
  KEY `IDX_825110671F68CB0D` (`price_rule_id`),
  KEY `IDX_82511067887793B6` (`condition_id`),
  CONSTRAINT `FK_825110671F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_product_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_82511067887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_price_rule_translation`;
CREATE TABLE `coreshop_product_price_rule_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_product_price_rule_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_C8C39DC12C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_C8C39DC12C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_product_price_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_quantity_price_rule`;
CREATE TABLE `coreshop_product_quantity_price_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `priority` int NOT NULL,
  `product` int NOT NULL,
  `calculation_behaviour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_quantity_price_rule_conditions`;
CREATE TABLE `coreshop_product_quantity_price_rule_conditions` (
  `product_quantity_price_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`product_quantity_price_rule_id`,`condition_id`),
  KEY `IDX_1AD1944FCCF4F3B6` (`product_quantity_price_rule_id`),
  KEY `IDX_1AD1944F887793B6` (`condition_id`),
  CONSTRAINT `FK_1AD1944F887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1AD1944FCCF4F3B6` FOREIGN KEY (`product_quantity_price_rule_id`) REFERENCES `coreshop_product_quantity_price_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_quantity_price_rule_range`;
CREATE TABLE `coreshop_product_quantity_price_rule_range` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rule_id` int DEFAULT NULL,
  `unit_definition` int DEFAULT NULL,
  `range_starting_from` double NOT NULL,
  `pricing_behaviour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `percentage` double NOT NULL,
  `highlighted` tinyint(1) NOT NULL,
  `amount` bigint NOT NULL COMMENT '(DC2Type:bigintInteger)',
  `pseudo_price` bigint NOT NULL COMMENT '(DC2Type:bigintInteger)',
  `currencyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C6BA05DA744E0351` (`rule_id`),
  KEY `IDX_C6BA05DA91000B8A` (`currencyId`),
  KEY `IDX_C6BA05DA6B98B918` (`unit_definition`),
  CONSTRAINT `FK_C6BA05DA6B98B918` FOREIGN KEY (`unit_definition`) REFERENCES `coreshop_product_unit_definition` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C6BA05DA744E0351` FOREIGN KEY (`rule_id`) REFERENCES `coreshop_product_quantity_price_rule` (`id`),
  CONSTRAINT `FK_C6BA05DA91000B8A` FOREIGN KEY (`currencyId`) REFERENCES `coreshop_currency` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_specific_price_rule`;
CREATE TABLE `coreshop_product_specific_price_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `inherit` tinyint(1) NOT NULL,
  `product` int NOT NULL,
  `stopPropagation` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_specific_price_rule_action`;
CREATE TABLE `coreshop_product_specific_price_rule_action` (
  `price_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`action_id`),
  KEY `IDX_B89BEDCE1F68CB0D` (`price_rule_id`),
  KEY `IDX_B89BEDCE9D32F035` (`action_id`),
  CONSTRAINT `FK_B89BEDCE1F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_product_specific_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B89BEDCE9D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_specific_price_rule_conditions`;
CREATE TABLE `coreshop_product_specific_price_rule_conditions` (
  `price_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`price_rule_id`,`condition_id`),
  KEY `IDX_E4503CBA1F68CB0D` (`price_rule_id`),
  KEY `IDX_E4503CBA887793B6` (`condition_id`),
  CONSTRAINT `FK_E4503CBA1F68CB0D` FOREIGN KEY (`price_rule_id`) REFERENCES `coreshop_product_specific_price_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E4503CBA887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_specific_price_rule_translation`;
CREATE TABLE `coreshop_product_specific_price_rule_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_product_specific_price_rule_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_30C732842C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_30C732842C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_product_specific_price_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_store_values`;
CREATE TABLE `coreshop_product_store_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store` int DEFAULT NULL,
  `product` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  `price` bigint NOT NULL COMMENT '(DC2Type:bigintInteger)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_store` (`product`,`store`),
  KEY `IDX_9EED0E97FF575877` (`store`),
  CONSTRAINT `FK_9EED0E97FF575877` FOREIGN KEY (`store`) REFERENCES `coreshop_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_unit`;
CREATE TABLE `coreshop_product_unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_803A19D05E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_unit_definition`;
CREATE TABLE `coreshop_product_unit_definition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_unit_definitions` int DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `conversion_rate` double DEFAULT NULL,
  `precision` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `definitions_and_unit` (`product_unit_definitions`,`unit`),
  KEY `IDX_37BB52AF8685AB18` (`product_unit_definitions`),
  KEY `IDX_37BB52AFDCBB0C53` (`unit`),
  CONSTRAINT `FK_37BB52AF8685AB18` FOREIGN KEY (`product_unit_definitions`) REFERENCES `coreshop_product_unit_definitions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_37BB52AFDCBB0C53` FOREIGN KEY (`unit`) REFERENCES `coreshop_product_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_unit_definition_price`;
CREATE TABLE `coreshop_product_unit_definition_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit_definition` int DEFAULT NULL,
  `product_store_values` int DEFAULT NULL,
  `price` bigint NOT NULL COMMENT '(DC2Type:bigintInteger)',
  PRIMARY KEY (`id`),
  KEY `IDX_13ECB5B6B98B918` (`unit_definition`),
  KEY `IDX_13ECB5BD314F81B` (`product_store_values`),
  CONSTRAINT `FK_13ECB5B6B98B918` FOREIGN KEY (`unit_definition`) REFERENCES `coreshop_product_unit_definition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_13ECB5BD314F81B` FOREIGN KEY (`product_store_values`) REFERENCES `coreshop_product_store_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_unit_definitions`;
CREATE TABLE `coreshop_product_unit_definitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `default_unit_definition` int DEFAULT NULL,
  `product` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5D50CA20D34A04AD` (`product`),
  UNIQUE KEY `UNIQ_5D50CA20F3CE11C4` (`default_unit_definition`),
  CONSTRAINT `FK_5D50CA20F3CE11C4` FOREIGN KEY (`default_unit_definition`) REFERENCES `coreshop_product_unit_definition` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_product_unit_translation`;
CREATE TABLE `coreshop_product_unit_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `full_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_plural_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_plural_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_product_unit_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_7A572A8D2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_7A572A8D2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_product_unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_rule_action`;
CREATE TABLE `coreshop_rule_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_rule_condition`;
CREATE TABLE `coreshop_rule_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_sequence`;
CREATE TABLE `coreshop_sequence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idx` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7ED5F6CC5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_shipping_rule`;
CREATE TABLE `coreshop_shipping_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_shipping_rule_actions`;
CREATE TABLE `coreshop_shipping_rule_actions` (
  `shipping_rule_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`shipping_rule_id`,`action_id`),
  KEY `IDX_5ECC677392060595` (`shipping_rule_id`),
  KEY `IDX_5ECC67739D32F035` (`action_id`),
  CONSTRAINT `FK_5ECC677392060595` FOREIGN KEY (`shipping_rule_id`) REFERENCES `coreshop_shipping_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5ECC67739D32F035` FOREIGN KEY (`action_id`) REFERENCES `coreshop_rule_action` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_shipping_rule_conditions`;
CREATE TABLE `coreshop_shipping_rule_conditions` (
  `shipping_rule_id` int NOT NULL,
  `condition_id` int NOT NULL,
  PRIMARY KEY (`shipping_rule_id`,`condition_id`),
  KEY `IDX_CDA122C392060595` (`shipping_rule_id`),
  KEY `IDX_CDA122C3887793B6` (`condition_id`),
  CONSTRAINT `FK_CDA122C3887793B6` FOREIGN KEY (`condition_id`) REFERENCES `coreshop_rule_condition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CDA122C392060595` FOREIGN KEY (`shipping_rule_id`) REFERENCES `coreshop_shipping_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_shipping_rule_group`;
CREATE TABLE `coreshop_shipping_rule_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priority` int NOT NULL,
  `stopPropagation` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `carrierId` int NOT NULL,
  `shippingRuleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_509EE03B6709B1C` (`carrierId`),
  KEY `IDX_509EE03BF19946BB` (`shippingRuleId`),
  CONSTRAINT `FK_509EE03B6709B1C` FOREIGN KEY (`carrierId`) REFERENCES `coreshop_carrier` (`id`),
  CONSTRAINT `FK_509EE03BF19946BB` FOREIGN KEY (`shippingRuleId`) REFERENCES `coreshop_shipping_rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_state`;
CREATE TABLE `coreshop_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `isoCode` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66791990FBA2A6B4` (`countryId`),
  CONSTRAINT `FK_66791990FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `coreshop_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_state_translation`;
CREATE TABLE `coreshop_state_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_state_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_7695D9BF2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_7695D9BF2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_state` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_store`;
CREATE TABLE `coreshop_store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isDefault` tinyint(1) NOT NULL,
  `siteId` int NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `useGrossPrice` tinyint(1) NOT NULL,
  `currencyId` int DEFAULT NULL,
  `baseCountryId` int DEFAULT NULL,
  `customer_cluster` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3ABD931C91000B8A` (`currencyId`),
  KEY `IDX_3ABD931C1D78C28F` (`baseCountryId`),
  KEY `IDX_3ABD931CF918CD2A` (`customer_cluster`),
  CONSTRAINT `FK_3ABD931C1D78C28F` FOREIGN KEY (`baseCountryId`) REFERENCES `coreshop_country` (`id`),
  CONSTRAINT `FK_3ABD931C91000B8A` FOREIGN KEY (`currencyId`) REFERENCES `coreshop_currency` (`id`),
  CONSTRAINT `FK_3ABD931CF918CD2A` FOREIGN KEY (`customer_cluster`) REFERENCES `coreshop_customer_cluster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_store_countries`;
CREATE TABLE `coreshop_store_countries` (
  `store_id` int NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`store_id`,`country_id`),
  KEY `IDX_9F906C47B092A811` (`store_id`),
  KEY `IDX_9F906C47F92F3E70` (`country_id`),
  CONSTRAINT `FK_9F906C47B092A811` FOREIGN KEY (`store_id`) REFERENCES `coreshop_store` (`id`),
  CONSTRAINT `FK_9F906C47F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `coreshop_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_tax_rate`;
CREATE TABLE `coreshop_tax_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `rate` double NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_tax_rate_translation`;
CREATE TABLE `coreshop_tax_rate_translation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `translatable_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coreshop_tax_rate_translation_uniq_trans` (`translatable_id`,`locale`),
  KEY `IDX_FFDC5E802C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_FFDC5E802C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `coreshop_tax_rate` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_tax_rule`;
CREATE TABLE `coreshop_tax_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `behavior` int NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `taxRuleGroupId` int NOT NULL,
  `taxRateId` int NOT NULL,
  `countryId` int DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_760482D37EE5294C` (`taxRuleGroupId`),
  KEY `IDX_760482D3ACB12012` (`taxRateId`),
  KEY `IDX_760482D3FBA2A6B4` (`countryId`),
  KEY `IDX_760482D3B5286BEF` (`stateId`),
  CONSTRAINT `FK_760482D37EE5294C` FOREIGN KEY (`taxRuleGroupId`) REFERENCES `coreshop_tax_rule_group` (`id`),
  CONSTRAINT `FK_760482D3ACB12012` FOREIGN KEY (`taxRateId`) REFERENCES `coreshop_tax_rate` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_760482D3B5286BEF` FOREIGN KEY (`stateId`) REFERENCES `coreshop_state` (`id`),
  CONSTRAINT `FK_760482D3FBA2A6B4` FOREIGN KEY (`countryId`) REFERENCES `coreshop_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_tax_rule_group`;
CREATE TABLE `coreshop_tax_rule_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_warehouse`;
CREATE TABLE `coreshop_warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_warehouse_location`;
CREATE TABLE `coreshop_warehouse_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `warehouseId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EDD6CC48E8DE5B58` (`warehouseId`),
  CONSTRAINT `FK_EDD6CC48E8DE5B58` FOREIGN KEY (`warehouseId`) REFERENCES `coreshop_warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_warehouse_stock_item`;
CREATE TABLE `coreshop_warehouse_stock_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stockable` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  `quantity` int NOT NULL,
  `rack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shelf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `warehouseLocationId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1019B005AB83C41F` (`warehouseLocationId`),
  CONSTRAINT `FK_1019B005AB83C41F` FOREIGN KEY (`warehouseLocationId`) REFERENCES `coreshop_warehouse_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_warehouse_stock_movement`;
CREATE TABLE `coreshop_warehouse_stock_movement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stockable` int NOT NULL COMMENT '(DC2Type:pimcoreObject)',
  `quantity` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ingoing` tinyint(1) NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `stockItemId` int NOT NULL,
  `warehouseLocationId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A944061A47C422A` (`stockItemId`),
  KEY `IDX_2A944061AB83C41F` (`warehouseLocationId`),
  CONSTRAINT `FK_2A944061A47C422A` FOREIGN KEY (`stockItemId`) REFERENCES `coreshop_warehouse_stock_item` (`id`),
  CONSTRAINT `FK_2A944061AB83C41F` FOREIGN KEY (`warehouseLocationId`) REFERENCES `coreshop_warehouse_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `coreshop_zone`;
CREATE TABLE `coreshop_zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `documents_newsletter`;
CREATE TABLE `documents_newsletter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `controller` varchar(500) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_documents_newsletter_documents` FOREIGN KEY (`id`) REFERENCES `documents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE `migration_versions` (
  `version` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopAdjustment_cs_order`;
CREATE TABLE `object_collection_CoreShopAdjustment_cs_order` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `typeIdentifier` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `pimcoreAmountNet` bigint DEFAULT NULL,
  `pimcoreAmountGross` bigint DEFAULT NULL,
  `pimcoreNeutral` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopAdjustment_cs_order__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopAdjustment_cs_order_invoice`;
CREATE TABLE `object_collection_CoreShopAdjustment_cs_order_invoice` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `typeIdentifier` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `pimcoreAmountNet` bigint DEFAULT NULL,
  `pimcoreAmountGross` bigint DEFAULT NULL,
  `pimcoreNeutral` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopAdjustment_cs_order_invoice__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopAdjustment_cs_order_item`;
CREATE TABLE `object_collection_CoreShopAdjustment_cs_order_item` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `typeIdentifier` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `pimcoreAmountNet` bigint DEFAULT NULL,
  `pimcoreAmountGross` bigint DEFAULT NULL,
  `pimcoreNeutral` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopAdjustment_cs_order_item__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopPriceRuleItem_cs_order_item`;
CREATE TABLE `object_collection_CoreShopPriceRuleItem_cs_order_item` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `cartPriceRule` int DEFAULT NULL,
  `voucherCode` varchar(190) DEFAULT NULL,
  `discountNet` bigint DEFAULT NULL,
  `discountGross` bigint DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopPriceRuleItem_cs_order_item__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopProposalCartPriceRuleItem_cs_order`;
CREATE TABLE `object_collection_CoreShopProposalCartPriceRuleItem_cs_order` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `cartPriceRule` int DEFAULT NULL,
  `voucherCode` varchar(190) DEFAULT NULL,
  `discountNet` bigint DEFAULT NULL,
  `discountGross` bigint DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopProposalCartPriceRuleItem__a8743537` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopTaxItem_cs_order`;
CREATE TABLE `object_collection_CoreShopTaxItem_cs_order` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `taxRate` int DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopTaxItem_cs_order__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_collection_CoreShopTaxItem_cs_order_item`;
CREATE TABLE `object_collection_CoreShopTaxItem_cs_order_item` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `taxRate` int DEFAULT NULL,
  PRIMARY KEY (`id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_collection_CoreShopTaxItem_cs_order_item__id` FOREIGN KEY (`id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_1`;
CREATE TABLE `object_localized_data_1` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_1__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_attribute_color`;
CREATE TABLE `object_localized_data_cs_attribute_color` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_attribute_color__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_attribute_group`;
CREATE TABLE `object_localized_data_cs_attribute_group` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_attribute_group__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_attribute_value`;
CREATE TABLE `object_localized_data_cs_attribute_value` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_attribute_value__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_category`;
CREATE TABLE `object_localized_data_cs_category` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_category__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_loyalty_voucher`;
CREATE TABLE `object_localized_data_cs_loyalty_voucher` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_loyalty_voucher__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_order_item`;
CREATE TABLE `object_localized_data_cs_order_item` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_order_item__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_data_cs_product`;
CREATE TABLE `object_localized_data_cs_product` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `shortDescription` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_data_cs_product__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_1_de`;
CREATE TABLE `object_localized_query_1_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_1_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_1_en`;
CREATE TABLE `object_localized_query_1_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_1_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_1_fr`;
CREATE TABLE `object_localized_query_1_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_1_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_color_de`;
CREATE TABLE `object_localized_query_cs_attribute_color_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_color_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_color_en`;
CREATE TABLE `object_localized_query_cs_attribute_color_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_color_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_color_fr`;
CREATE TABLE `object_localized_query_cs_attribute_color_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_color_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_group_de`;
CREATE TABLE `object_localized_query_cs_attribute_group_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_group_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_group_en`;
CREATE TABLE `object_localized_query_cs_attribute_group_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_group_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_group_fr`;
CREATE TABLE `object_localized_query_cs_attribute_group_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_group_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_value_de`;
CREATE TABLE `object_localized_query_cs_attribute_value_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_value_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_value_en`;
CREATE TABLE `object_localized_query_cs_attribute_value_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_value_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_attribute_value_fr`;
CREATE TABLE `object_localized_query_cs_attribute_value_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_attribute_value_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_category_de`;
CREATE TABLE `object_localized_query_cs_category_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_category_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_category_en`;
CREATE TABLE `object_localized_query_cs_category_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_category_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_category_fr`;
CREATE TABLE `object_localized_query_cs_category_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_category_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_loyalty_voucher_de`;
CREATE TABLE `object_localized_query_cs_loyalty_voucher_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_loyalty_voucher_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_loyalty_voucher_en`;
CREATE TABLE `object_localized_query_cs_loyalty_voucher_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_loyalty_voucher_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_loyalty_voucher_fr`;
CREATE TABLE `object_localized_query_cs_loyalty_voucher_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_loyalty_voucher_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_order_item_de`;
CREATE TABLE `object_localized_query_cs_order_item_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_order_item_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_order_item_en`;
CREATE TABLE `object_localized_query_cs_order_item_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_order_item_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_order_item_fr`;
CREATE TABLE `object_localized_query_cs_order_item_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_order_item_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_product_de`;
CREATE TABLE `object_localized_query_cs_product_de` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `shortDescription` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_product_de__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_product_en`;
CREATE TABLE `object_localized_query_cs_product_en` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `shortDescription` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_product_en__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_localized_query_cs_product_fr`;
CREATE TABLE `object_localized_query_cs_product_fr` (
  `ooo_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(190) DEFAULT NULL,
  `shortDescription` longtext,
  `pimcoreMetaTitle` varchar(190) DEFAULT NULL,
  `pimcoreMetaDescription` longtext,
  `description` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`),
  CONSTRAINT `fk_object_localized_query_cs_product_fr__ooo_id` FOREIGN KEY (`ooo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_1`;
CREATE TABLE `object_query_1` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '1',
  `oo_className` varchar(255) DEFAULT 'CoreShopVoucherProduct',
  `price__value` bigint DEFAULT NULL,
  `price__currency` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_1__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_2`;
CREATE TABLE `object_query_2` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '2',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderItemVoucher',
  `number` varchar(190) DEFAULT NULL,
  `code` varchar(190) DEFAULT NULL,
  `orderItem__id` int DEFAULT NULL,
  `orderItem__type` enum('document','asset','object') DEFAULT NULL,
  `order__id` int DEFAULT NULL,
  `order__type` enum('document','asset','object') DEFAULT NULL,
  `product__id` int DEFAULT NULL,
  `product__type` enum('document','asset','object') DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_2__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_address`;
CREATE TABLE `object_query_cs_address` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_address',
  `oo_className` varchar(255) DEFAULT 'CoreShopAddress',
  `salutation` varchar(190) DEFAULT NULL,
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `company` varchar(190) DEFAULT NULL,
  `street` varchar(190) DEFAULT NULL,
  `number` varchar(190) DEFAULT NULL,
  `postcode` varchar(190) DEFAULT NULL,
  `city` varchar(190) DEFAULT NULL,
  `country` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `phoneNumber` varchar(190) DEFAULT NULL,
  `addressIdentifier` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_address__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_attribute_color`;
CREATE TABLE `object_query_cs_attribute_color` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_attribute_color',
  `oo_className` varchar(255) DEFAULT 'CoreShopAttributeColor',
  `valueText` varchar(190) DEFAULT NULL,
  `valueColor__rgb` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `valueColor__a` varchar(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `attributeGroup__id` int DEFAULT NULL,
  `attributeGroup__type` enum('document','asset','object') DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_attribute_color__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_attribute_group`;
CREATE TABLE `object_query_cs_attribute_group` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_attribute_group',
  `oo_className` varchar(255) DEFAULT 'CoreShopAttributeGroup',
  `showInList` tinyint(1) DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_attribute_group__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_attribute_value`;
CREATE TABLE `object_query_cs_attribute_value` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_attribute_value',
  `oo_className` varchar(255) DEFAULT 'CoreShopAttributeValue',
  `valueText` varchar(190) DEFAULT NULL,
  `attributeGroup__id` int DEFAULT NULL,
  `attributeGroup__type` enum('document','asset','object') DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_attribute_value__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_category`;
CREATE TABLE `object_query_cs_category` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_category',
  `oo_className` varchar(255) DEFAULT 'CoreShopCategory',
  `filter` int DEFAULT NULL,
  `stores` text,
  `parentCategory__id` int DEFAULT NULL,
  `parentCategory__type` enum('document','asset','object') DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_category__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_company`;
CREATE TABLE `object_query_cs_company` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_company',
  `oo_className` varchar(255) DEFAULT 'CoreShopCompany',
  `name` varchar(190) DEFAULT NULL,
  `vatIdentificationNumber` varchar(190) DEFAULT NULL,
  `addresses` text,
  `creditAmount__value` bigint DEFAULT NULL,
  `creditAmount__currency` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_company__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_customer`;
CREATE TABLE `object_query_cs_customer` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_customer',
  `oo_className` varchar(255) DEFAULT 'CoreShopCustomer',
  `salutation` varchar(190) DEFAULT NULL,
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `company__id` int DEFAULT NULL,
  `company__type` enum('document','asset','object') DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `newsletterActive` tinyint(1) DEFAULT NULL,
  `newsletterConfirmed` tinyint(1) DEFAULT NULL,
  `newsletterToken` varchar(190) DEFAULT NULL,
  `gender` varchar(190) DEFAULT NULL,
  `localeCode` varchar(190) DEFAULT NULL,
  `user__id` int DEFAULT NULL,
  `user__type` enum('document','asset','object') DEFAULT NULL,
  `addressAccessType` varchar(190) DEFAULT NULL,
  `addresses` text,
  `defaultAddress__id` int DEFAULT NULL,
  `defaultAddress__type` enum('document','asset','object') DEFAULT NULL,
  `customerGroups` text,
  `creditAmount__value` bigint DEFAULT NULL,
  `creditAmount__currency` int DEFAULT NULL,
  `customerCluster` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_customer__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_customer_group`;
CREATE TABLE `object_query_cs_customer_group` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_customer_group',
  `oo_className` varchar(255) DEFAULT 'CoreShopCustomerGroup',
  `name` varchar(190) DEFAULT NULL,
  `roles` text,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_customer_group__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_loyalty_voucher`;
CREATE TABLE `object_query_cs_loyalty_voucher` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_loyalty_voucher',
  `oo_className` varchar(255) DEFAULT 'CoreShopLoyaltyVoucher',
  `points` bigint DEFAULT NULL,
  `cartPriceRule` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_loyalty_voucher__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_manufacturer`;
CREATE TABLE `object_query_cs_manufacturer` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_manufacturer',
  `oo_className` varchar(255) DEFAULT 'CoreShopManufacturer',
  `name` varchar(190) DEFAULT NULL,
  `image` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_manufacturer__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order`;
CREATE TABLE `object_query_cs_order` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrder',
  `orderNumber` varchar(190) DEFAULT NULL,
  `quoteNumber` varchar(190) DEFAULT NULL,
  `saleState` varchar(190) DEFAULT NULL,
  `token` varchar(190) DEFAULT NULL,
  `backendCreated` tinyint(1) DEFAULT NULL,
  `orderDate` bigint DEFAULT NULL,
  `localeCode` varchar(190) DEFAULT NULL,
  `carrier` int DEFAULT NULL,
  `store` int DEFAULT NULL,
  `paymentProvider` int DEFAULT NULL,
  `comment` longtext,
  `immutable` tinyint(1) DEFAULT NULL,
  `quoteState` varchar(190) DEFAULT NULL,
  `orderState` varchar(190) DEFAULT NULL,
  `paymentState` varchar(190) DEFAULT NULL,
  `shippingState` varchar(190) DEFAULT NULL,
  `invoiceState` varchar(190) DEFAULT NULL,
  `baseCurrency` int DEFAULT NULL,
  `paymentTotal` bigint DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `shippingTaxRate` double DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `convertedPaymentTotal` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `items` text,
  `needsRecalculation` tinyint(1) DEFAULT NULL,
  `customer__id` int DEFAULT NULL,
  `customer__type` enum('document','asset','object') DEFAULT NULL,
  `shippingAddress__id` int DEFAULT NULL,
  `shippingAddress__type` enum('document','asset','object') DEFAULT NULL,
  `invoiceAddress__id` int DEFAULT NULL,
  `invoiceAddress__type` enum('document','asset','object') DEFAULT NULL,
  `loyaltyPoints` bigint DEFAULT NULL,
  `totalPaymentLaterNet` bigint DEFAULT NULL,
  `totalPaymentLaterGross` bigint DEFAULT NULL,
  `totalPaymentNowNet` bigint DEFAULT NULL,
  `totalPaymentNowGross` bigint DEFAULT NULL,
  `totalDepositNet` bigint DEFAULT NULL,
  `totalDepositGross` bigint DEFAULT NULL,
  `subtotalDepositNet` bigint DEFAULT NULL,
  `subtotalDepositGross` bigint DEFAULT NULL,
  `hasDepositItem` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order_invoice`;
CREATE TABLE `object_query_cs_order_invoice` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order_invoice',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderInvoice',
  `order__id` int DEFAULT NULL,
  `order__type` enum('document','asset','object') DEFAULT NULL,
  `invoiceDate` bigint DEFAULT NULL,
  `invoiceNumber` varchar(190) DEFAULT NULL,
  `state` varchar(190) DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `items` text,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order_invoice__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order_invoice_item`;
CREATE TABLE `object_query_cs_order_invoice_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order_invoice_item',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderInvoiceItem',
  `orderItem__id` int DEFAULT NULL,
  `orderItem__type` enum('document','asset','object') DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order_invoice_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order_item`;
CREATE TABLE `object_query_cs_order_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order_item',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderItem',
  `isGiftItem` tinyint(1) DEFAULT NULL,
  `digitalProduct` tinyint(1) DEFAULT NULL,
  `unitIdentifier` varchar(190) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `customItemDiscount` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `defaultUnitQuantity` double DEFAULT NULL,
  `product__id` int DEFAULT NULL,
  `product__type` enum('document','asset','object') DEFAULT NULL,
  `objectId` double DEFAULT NULL,
  `mainObjectId` double DEFAULT NULL,
  `itemWeight` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `unitDefinition` int DEFAULT NULL,
  `order__id` int DEFAULT NULL,
  `order__type` enum('document','asset','object') DEFAULT NULL,
  `immutable` tinyint(1) DEFAULT NULL,
  `itemWholesalePrice` bigint DEFAULT NULL,
  `customItemPrice` bigint DEFAULT NULL,
  `itemDiscountNet` bigint DEFAULT NULL,
  `itemDiscountGross` bigint DEFAULT NULL,
  `itemDiscountPriceNet` bigint DEFAULT NULL,
  `itemDiscountPriceGross` bigint DEFAULT NULL,
  `itemPriceNet` bigint DEFAULT NULL,
  `itemPriceGross` bigint DEFAULT NULL,
  `itemRetailPriceNet` bigint DEFAULT NULL,
  `itemRetailPriceGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `itemTax` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `convertedItemWholesalePrice` bigint DEFAULT NULL,
  `convertedCustomItemPrice` bigint DEFAULT NULL,
  `convertedItemDiscountNet` bigint DEFAULT NULL,
  `convertedItemDiscountGross` bigint DEFAULT NULL,
  `convertedItemDiscountPriceNet` bigint DEFAULT NULL,
  `convertedItemDiscountPriceGross` bigint DEFAULT NULL,
  `convertedItemPriceNet` bigint DEFAULT NULL,
  `convertedItemPriceGross` bigint DEFAULT NULL,
  `convertedItemRetailPriceNet` bigint DEFAULT NULL,
  `convertedItemRetailPriceGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedItemTax` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `allocatedQuantity` double DEFAULT NULL,
  `totalDepositNet` bigint DEFAULT NULL,
  `totalDepositGross` bigint DEFAULT NULL,
  `depositPercentage` double DEFAULT NULL,
  `deposit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order_shipment`;
CREATE TABLE `object_query_cs_order_shipment` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order_shipment',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderShipment',
  `order__id` int DEFAULT NULL,
  `order__type` enum('document','asset','object') DEFAULT NULL,
  `shipmentDate` bigint DEFAULT NULL,
  `shipmentNumber` varchar(190) DEFAULT NULL,
  `state` varchar(190) DEFAULT NULL,
  `carrier` int DEFAULT NULL,
  `trackingCode` varchar(190) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `items` text,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order_shipment__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_order_shipment_item`;
CREATE TABLE `object_query_cs_order_shipment_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_order_shipment_item',
  `oo_className` varchar(255) DEFAULT 'CoreShopOrderShipmentItem',
  `orderItem__id` int DEFAULT NULL,
  `orderItem__type` enum('document','asset','object') DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `stockItem` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_order_shipment_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_product`;
CREATE TABLE `object_query_cs_product` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_product',
  `oo_className` varchar(255) DEFAULT 'CoreShopProduct',
  `sku` varchar(190) DEFAULT NULL,
  `ean` varchar(190) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `digitalProduct` tinyint(1) DEFAULT NULL,
  `manufacturer__id` int DEFAULT NULL,
  `manufacturer__type` enum('document','asset','object') DEFAULT NULL,
  `stores` text,
  `mainVariant__id` int DEFAULT NULL,
  `mainVariant__type` enum('document','asset','object') DEFAULT NULL,
  `allowedAttributeGroups` text,
  `attributes` text,
  `categories` text,
  `images` text,
  `onHold` bigint DEFAULT NULL,
  `onHand` bigint DEFAULT NULL,
  `isTracked` tinyint(1) DEFAULT NULL,
  `minimumQuantityToOrder` bigint DEFAULT NULL,
  `maximumQuantityToOrder` bigint DEFAULT NULL,
  `itemQuantityFactor` bigint DEFAULT NULL,
  `wholesalePrice` bigint DEFAULT NULL,
  `wholesaleBuyingPrice__value` bigint DEFAULT NULL,
  `wholesaleBuyingPrice__currency` int DEFAULT NULL,
  `taxRule` int DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_product__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_user`;
CREATE TABLE `object_query_cs_user` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_user',
  `oo_className` varchar(255) DEFAULT 'CoreShopUser',
  `loginIdentifier` varchar(190) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `passwordResetHash` varchar(190) DEFAULT NULL,
  `customer__id` int DEFAULT NULL,
  `customer__type` enum('document','asset','object') DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_user__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_wishlist`;
CREATE TABLE `object_query_cs_wishlist` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_wishlist',
  `oo_className` varchar(255) DEFAULT 'CoreShopWishlist',
  `token` varchar(190) DEFAULT NULL,
  `items` text,
  `customer__id` int DEFAULT NULL,
  `customer__type` enum('document','asset','object') DEFAULT NULL,
  `store` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_wishlist__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_query_cs_wishlist_item`;
CREATE TABLE `object_query_cs_wishlist_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'cs_wishlist_item',
  `oo_className` varchar(255) DEFAULT 'CoreShopWishlistItem',
  `product__id` int DEFAULT NULL,
  `product__type` enum('document','asset','object') DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `wishlist__id` int DEFAULT NULL,
  `wishlist__type` enum('document','asset','object') DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_query_cs_wishlist_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_1`;
CREATE TABLE `object_relations_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_1__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_2`;
CREATE TABLE `object_relations_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_2__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_address`;
CREATE TABLE `object_relations_cs_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_address__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_attribute_color`;
CREATE TABLE `object_relations_cs_attribute_color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_attribute_color__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_attribute_group`;
CREATE TABLE `object_relations_cs_attribute_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_attribute_group__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_attribute_value`;
CREATE TABLE `object_relations_cs_attribute_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_attribute_value__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_category`;
CREATE TABLE `object_relations_cs_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_category__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_company`;
CREATE TABLE `object_relations_cs_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_company__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_customer`;
CREATE TABLE `object_relations_cs_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_customer__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_customer_group`;
CREATE TABLE `object_relations_cs_customer_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_customer_group__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_loyalty_voucher`;
CREATE TABLE `object_relations_cs_loyalty_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_loyalty_voucher__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_manufacturer`;
CREATE TABLE `object_relations_cs_manufacturer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_manufacturer__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order`;
CREATE TABLE `object_relations_cs_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order_invoice`;
CREATE TABLE `object_relations_cs_order_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order_invoice__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order_invoice_item`;
CREATE TABLE `object_relations_cs_order_invoice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order_invoice_item__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order_item`;
CREATE TABLE `object_relations_cs_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order_item__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order_shipment`;
CREATE TABLE `object_relations_cs_order_shipment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order_shipment__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_order_shipment_item`;
CREATE TABLE `object_relations_cs_order_shipment_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_order_shipment_item__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_product`;
CREATE TABLE `object_relations_cs_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_product__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_user`;
CREATE TABLE `object_relations_cs_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_user__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_wishlist`;
CREATE TABLE `object_relations_cs_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_wishlist__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_relations_cs_wishlist_item`;
CREATE TABLE `object_relations_cs_wishlist_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int unsigned NOT NULL DEFAULT '0',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `type` enum('object','asset','document') NOT NULL,
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`),
  KEY `fieldname` (`fieldname`),
  CONSTRAINT `fk_object_relations_cs_wishlist_item__src_id` FOREIGN KEY (`src_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_1`;
CREATE TABLE `object_store_1` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `price__value` bigint DEFAULT NULL,
  `price__currency` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_1__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_2`;
CREATE TABLE `object_store_2` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `number` varchar(190) DEFAULT NULL,
  `code` varchar(190) DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_2__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_address`;
CREATE TABLE `object_store_cs_address` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `salutation` varchar(190) DEFAULT NULL,
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `company` varchar(190) DEFAULT NULL,
  `street` varchar(190) DEFAULT NULL,
  `number` varchar(190) DEFAULT NULL,
  `postcode` varchar(190) DEFAULT NULL,
  `city` varchar(190) DEFAULT NULL,
  `country` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `phoneNumber` varchar(190) DEFAULT NULL,
  `addressIdentifier` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_address__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_attribute_color`;
CREATE TABLE `object_store_cs_attribute_color` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `valueText` varchar(190) DEFAULT NULL,
  `valueColor__rgb` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `valueColor__a` varchar(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_attribute_color__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_attribute_group`;
CREATE TABLE `object_store_cs_attribute_group` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `showInList` tinyint(1) DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_attribute_group__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_attribute_value`;
CREATE TABLE `object_store_cs_attribute_value` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `valueText` varchar(190) DEFAULT NULL,
  `sorting` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_attribute_value__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_category`;
CREATE TABLE `object_store_cs_category` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `filter` int DEFAULT NULL,
  `stores` text,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_category__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_company`;
CREATE TABLE `object_store_cs_company` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `vatIdentificationNumber` varchar(190) DEFAULT NULL,
  `creditAmount__value` bigint DEFAULT NULL,
  `creditAmount__currency` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_company__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_customer`;
CREATE TABLE `object_store_cs_customer` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `salutation` varchar(190) DEFAULT NULL,
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `newsletterActive` tinyint(1) DEFAULT NULL,
  `newsletterConfirmed` tinyint(1) DEFAULT NULL,
  `newsletterToken` varchar(190) DEFAULT NULL,
  `gender` varchar(190) DEFAULT NULL,
  `localeCode` varchar(190) DEFAULT NULL,
  `addressAccessType` varchar(190) DEFAULT NULL,
  `creditAmount__value` bigint DEFAULT NULL,
  `creditAmount__currency` int DEFAULT NULL,
  `customerCluster` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_customer__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_customer_group`;
CREATE TABLE `object_store_cs_customer_group` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `roles` text,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_customer_group__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_loyalty_voucher`;
CREATE TABLE `object_store_cs_loyalty_voucher` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `points` bigint DEFAULT NULL,
  `cartPriceRule` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_loyalty_voucher__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_manufacturer`;
CREATE TABLE `object_store_cs_manufacturer` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `image` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_manufacturer__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order`;
CREATE TABLE `object_store_cs_order` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `orderNumber` varchar(190) DEFAULT NULL,
  `quoteNumber` varchar(190) DEFAULT NULL,
  `saleState` varchar(190) DEFAULT NULL,
  `token` varchar(190) DEFAULT NULL,
  `backendCreated` tinyint(1) DEFAULT NULL,
  `orderDate` bigint DEFAULT NULL,
  `localeCode` varchar(190) DEFAULT NULL,
  `carrier` int DEFAULT NULL,
  `store` int DEFAULT NULL,
  `paymentProvider` int DEFAULT NULL,
  `paymentSettings` longblob,
  `comment` longtext,
  `immutable` tinyint(1) DEFAULT NULL,
  `quoteState` varchar(190) DEFAULT NULL,
  `orderState` varchar(190) DEFAULT NULL,
  `paymentState` varchar(190) DEFAULT NULL,
  `shippingState` varchar(190) DEFAULT NULL,
  `invoiceState` varchar(190) DEFAULT NULL,
  `baseCurrency` int DEFAULT NULL,
  `paymentTotal` bigint DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `shippingTaxRate` double DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `convertedPaymentTotal` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `needsRecalculation` tinyint(1) DEFAULT NULL,
  `loyaltyPoints` bigint DEFAULT NULL,
  `totalPaymentLaterNet` bigint DEFAULT NULL,
  `totalPaymentLaterGross` bigint DEFAULT NULL,
  `totalPaymentNowNet` bigint DEFAULT NULL,
  `totalPaymentNowGross` bigint DEFAULT NULL,
  `totalDepositNet` bigint DEFAULT NULL,
  `totalDepositGross` bigint DEFAULT NULL,
  `subtotalDepositNet` bigint DEFAULT NULL,
  `subtotalDepositGross` bigint DEFAULT NULL,
  `hasDepositItem` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order_invoice`;
CREATE TABLE `object_store_cs_order_invoice` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `invoiceDate` bigint DEFAULT NULL,
  `invoiceNumber` varchar(190) DEFAULT NULL,
  `state` varchar(190) DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order_invoice__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order_invoice_item`;
CREATE TABLE `object_store_cs_order_invoice_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` double DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order_invoice_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order_item`;
CREATE TABLE `object_store_cs_order_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `isGiftItem` tinyint(1) DEFAULT NULL,
  `digitalProduct` tinyint(1) DEFAULT NULL,
  `unitIdentifier` varchar(190) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `customItemDiscount` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `defaultUnitQuantity` double DEFAULT NULL,
  `objectId` double DEFAULT NULL,
  `mainObjectId` double DEFAULT NULL,
  `itemWeight` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `unitDefinition` int DEFAULT NULL,
  `immutable` tinyint(1) DEFAULT NULL,
  `itemWholesalePrice` bigint DEFAULT NULL,
  `customItemPrice` bigint DEFAULT NULL,
  `itemDiscountNet` bigint DEFAULT NULL,
  `itemDiscountGross` bigint DEFAULT NULL,
  `itemDiscountPriceNet` bigint DEFAULT NULL,
  `itemDiscountPriceGross` bigint DEFAULT NULL,
  `itemPriceNet` bigint DEFAULT NULL,
  `itemPriceGross` bigint DEFAULT NULL,
  `itemRetailPriceNet` bigint DEFAULT NULL,
  `itemRetailPriceGross` bigint DEFAULT NULL,
  `subtotalNet` bigint DEFAULT NULL,
  `subtotalGross` bigint DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `itemTax` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `pimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `convertedItemWholesalePrice` bigint DEFAULT NULL,
  `convertedCustomItemPrice` bigint DEFAULT NULL,
  `convertedItemDiscountNet` bigint DEFAULT NULL,
  `convertedItemDiscountGross` bigint DEFAULT NULL,
  `convertedItemDiscountPriceNet` bigint DEFAULT NULL,
  `convertedItemDiscountPriceGross` bigint DEFAULT NULL,
  `convertedItemPriceNet` bigint DEFAULT NULL,
  `convertedItemPriceGross` bigint DEFAULT NULL,
  `convertedItemRetailPriceNet` bigint DEFAULT NULL,
  `convertedItemRetailPriceGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `convertedSubtotalNet` bigint DEFAULT NULL,
  `convertedSubtotalGross` bigint DEFAULT NULL,
  `convertedItemTax` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalNet` bigint DEFAULT NULL,
  `convertedPimcoreAdjustmentTotalGross` bigint DEFAULT NULL,
  `allocatedQuantity` double DEFAULT NULL,
  `totalDepositNet` bigint DEFAULT NULL,
  `totalDepositGross` bigint DEFAULT NULL,
  `depositPercentage` double DEFAULT NULL,
  `deposit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order_shipment`;
CREATE TABLE `object_store_cs_order_shipment` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `shipmentDate` bigint DEFAULT NULL,
  `shipmentNumber` varchar(190) DEFAULT NULL,
  `state` varchar(190) DEFAULT NULL,
  `carrier` int DEFAULT NULL,
  `trackingCode` varchar(190) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order_shipment__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_order_shipment_item`;
CREATE TABLE `object_store_cs_order_shipment_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` double DEFAULT NULL,
  `totalNet` bigint DEFAULT NULL,
  `totalGross` bigint DEFAULT NULL,
  `convertedTotalNet` bigint DEFAULT NULL,
  `convertedTotalGross` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `stockItem` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_order_shipment_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_product`;
CREATE TABLE `object_store_cs_product` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(190) DEFAULT NULL,
  `ean` varchar(190) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `digitalProduct` tinyint(1) DEFAULT NULL,
  `stores` text,
  `onHold` bigint DEFAULT NULL,
  `onHand` bigint DEFAULT NULL,
  `isTracked` tinyint(1) DEFAULT NULL,
  `minimumQuantityToOrder` bigint DEFAULT NULL,
  `maximumQuantityToOrder` bigint DEFAULT NULL,
  `itemQuantityFactor` bigint DEFAULT NULL,
  `wholesalePrice` bigint DEFAULT NULL,
  `wholesaleBuyingPrice__value` bigint DEFAULT NULL,
  `wholesaleBuyingPrice__currency` int DEFAULT NULL,
  `taxRule` int DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_product__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_user`;
CREATE TABLE `object_store_cs_user` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `loginIdentifier` varchar(190) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `passwordResetHash` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_user__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_wishlist`;
CREATE TABLE `object_store_cs_wishlist` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `token` varchar(190) DEFAULT NULL,
  `store` int DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_wishlist__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `object_store_cs_wishlist_item`;
CREATE TABLE `object_store_cs_wishlist_item` (
  `oo_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`oo_id`),
  CONSTRAINT `fk_object_store_cs_wishlist_item__oo_id` FOREIGN KEY (`oo_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `plugin_datahub_workspaces_asset`;
CREATE TABLE `plugin_datahub_workspaces_asset` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `configuration` varchar(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `read` tinyint unsigned DEFAULT '0',
  `update` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`configuration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `plugin_datahub_workspaces_document`;
CREATE TABLE `plugin_datahub_workspaces_document` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `configuration` varchar(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `read` tinyint unsigned DEFAULT '0',
  `update` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`configuration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `plugin_datahub_workspaces_object`;
CREATE TABLE `plugin_datahub_workspaces_object` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `configuration` varchar(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `read` tinyint unsigned DEFAULT '0',
  `update` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`configuration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `translations_admin`;
CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(10) DEFAULT NULL,
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

