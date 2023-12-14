
SET NAMES utf8mb4;

INSERT INTO coreshop_rule_condition (`id`,`type`,`sort`,`configuration`) VALUES (1,'user.userType',NULL,'a:1:{s:8:\"userType\";s:8:\"register\";}'), 
(2,'user.userType',NULL,'a:1:{s:8:\"userType\";s:14:\"password-reset\";}'), 
(3,'user.userType',NULL,'a:1:{s:8:\"userType\";s:24:\"newsletter-double-opt-in\";}'), 
(4,'user.userType',NULL,'a:1:{s:8:\"userType\";s:20:\"newsletter-confirmed\";}'), 
(5,'order.orderShippingTransition',NULL,'a:1:{s:10:\"transition\";s:4:\"ship\";}'), 
(6,'order.orderTransition',NULL,'a:1:{s:10:\"transition\";s:7:\"confirm\";}'), 
(7,'order.comment',NULL,'a:1:{s:13:\"commentAction\";s:6:\"create\";}'), 
(8,'amount',NULL,'a:2:{s:9:\"minAmount\";i:0;s:9:\"maxAmount\";i:15000;}'), 
(9,'amount',NULL,'a:2:{s:9:\"minAmount\";i:15000;s:9:\"maxAmount\";i:200000;}'), 
(10,'amount',NULL,'a:2:{s:9:\"minAmount\";i:200000;s:9:\"maxAmount\";i:300000;}'), 
(11,'voucher',1,'a:3:{s:15:\"maxUsagePerCode\";d:1;s:15:\"maxUsagePerUser\";N;s:14:\"onlyOnePerCart\";b:1;}');
