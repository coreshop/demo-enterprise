
SET NAMES utf8mb4;

INSERT INTO coreshop_rule_action (`id`,`type`,`sort`,`configuration`) VALUES (1,'user.mail',NULL,'a:2:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"12\";s:2:\"en\";s:2:\"11\";}s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(2,'user.mail',NULL,'a:2:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"15\";s:2:\"en\";s:2:\"14\";}s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(3,'user.mail',NULL,'a:2:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"18\";s:2:\"en\";s:2:\"17\";}s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(4,'user.mail',NULL,'a:2:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"21\";s:2:\"en\";s:2:\"20\";}s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(5,'order.orderMail',NULL,'a:4:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"27\";s:2:\"en\";s:2:\"26\";}s:12:\"sendInvoices\";b:0;s:13:\"sendShipments\";b:0;s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(6,'order.mail',NULL,'a:2:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"24\";s:2:\"en\";s:2:\"23\";}s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(7,'order.orderMail',NULL,'a:4:{s:5:\"mails\";a:2:{s:2:\"de\";s:2:\"30\";s:2:\"en\";s:2:\"29\";}s:12:\"sendInvoices\";b:0;s:13:\"sendShipments\";b:0;s:30:\"doNotSendToDesignatedRecipient\";b:0;}'), 
(8,'price',NULL,'a:2:{s:5:\"price\";i:500;s:8:\"currency\";i:1;}'), 
(9,'price',NULL,'a:2:{s:5:\"price\";i:1000;s:8:\"currency\";i:1;}'), 
(10,'price',NULL,'a:2:{s:5:\"price\";i:2000;s:8:\"currency\";i:1;}'), 
(11,'pointsPerAmount',1,'a:2:{s:15:\"pointsPerAmount\";d:1;s:8:\"currency\";i:1;}'), 
(12,'discountAmount',1,'a:4:{s:6:\"amount\";i:1000;s:5:\"gross\";b:0;s:7:\"applyOn\";s:5:\"total\";s:8:\"currency\";i:1;}'), 
(13,'voucherCredit',1,'N;'), 
(14,'saveAttachmentToAsset',1,'N;');
