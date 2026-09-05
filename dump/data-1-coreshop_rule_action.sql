
SET NAMES utf8mb4;

INSERT INTO coreshop_rule_action (`id`,`type`,`sort`,`configuration`) VALUES (1,'user.mail',NULL,'{\"mails\": {\"de\": \"12\", \"en\": \"11\"}, \"doNotSendToDesignatedRecipient\": false}'), 
(2,'user.mail',NULL,'{\"mails\": {\"de\": \"15\", \"en\": \"14\"}, \"doNotSendToDesignatedRecipient\": false}'), 
(3,'user.mail',NULL,'{\"mails\": {\"de\": \"18\", \"en\": \"17\"}, \"doNotSendToDesignatedRecipient\": false}'), 
(4,'user.mail',NULL,'{\"mails\": {\"de\": \"21\", \"en\": \"20\"}, \"doNotSendToDesignatedRecipient\": false}'), 
(5,'order.orderMail',NULL,'{\"mails\": {\"de\": \"27\", \"en\": \"26\"}, \"sendInvoices\": false, \"sendShipments\": false, \"doNotSendToDesignatedRecipient\": false}'), 
(6,'order.mail',NULL,'{\"mails\": {\"de\": \"24\", \"en\": \"23\"}, \"doNotSendToDesignatedRecipient\": false}'), 
(7,'order.orderMail',NULL,'{\"mails\": {\"de\": \"30\", \"en\": \"29\"}, \"sendInvoices\": false, \"sendShipments\": false, \"doNotSendToDesignatedRecipient\": false}'), 
(8,'price',NULL,'{\"price\": 500, \"currency\": 1}'), 
(9,'price',NULL,'{\"price\": 1000, \"currency\": 1}'), 
(10,'price',NULL,'{\"price\": 2000, \"currency\": 1}'), 
(11,'pointsPerAmount',1,'{\"currency\": 1, \"pointsPerAmount\": 1}'), 
(12,'discountAmount',1,'{\"gross\": false, \"amount\": 1000, \"applyOn\": \"total\", \"currency\": 1}'), 
(13,'voucherCredit',1,NULL), 
(14,'saveAttachmentToAsset',1,NULL);
