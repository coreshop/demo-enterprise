
SET NAMES utf8mb4;

INSERT INTO coreshop_rule_condition (`id`,`type`,`sort`,`configuration`) VALUES (1,'user.userType',NULL,'{\"userType\": \"register\"}'), 
(2,'user.userType',NULL,'{\"userType\": \"password-reset\"}'), 
(3,'user.userType',NULL,'{\"userType\": \"newsletter-double-opt-in\"}'), 
(4,'user.userType',NULL,'{\"userType\": \"newsletter-confirmed\"}'), 
(5,'order.orderShippingTransition',NULL,'{\"transition\": \"ship\"}'), 
(6,'order.orderTransition',NULL,'{\"transition\": \"confirm\"}'), 
(7,'order.comment',NULL,'{\"commentAction\": \"create\"}'), 
(8,'amount',NULL,'{\"maxAmount\": 15000, \"minAmount\": 0}'), 
(9,'amount',NULL,'{\"maxAmount\": 200000, \"minAmount\": 15000}'), 
(10,'amount',NULL,'{\"maxAmount\": 300000, \"minAmount\": 200000}'), 
(11,'voucher',1,'{\"onlyOnePerCart\": true, \"maxUsagePerCode\": 1, \"maxUsagePerUser\": null}'), 
(12,'to',1,'{\"to\": \"service@coreshop.org\"}');
