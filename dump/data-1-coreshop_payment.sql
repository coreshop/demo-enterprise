
SET NAMES utf8mb4;

INSERT INTO coreshop_payment (`id`,`payment_provider_id`,`currency_id`,`state`,`orderId`,`datePayment`,`details`,`creationDate`,`modificationDate`,`number`,`description`,`total_amount`,`currency_code`,`order`) VALUES (1,2,1,'completed',123,'2023-12-14 09:53:04','{\"status\": \"financial_hold\"}','2023-12-14 09:53:04','2023-12-14 09:53:14','O1_181012262712201','1 item(s) for 404.4.',40440,'EUR',123), 
(2,2,1,'financial_hold',134,'2023-12-14 10:04:17','{\"status\": \"financial_hold\"}','2023-12-14 10:04:17','2023-12-14 10:04:18','O2_417178295756952','1 item(s) for 349.14.',34914,'EUR',134), 
(3,2,1,'completed',151,'2023-12-14 15:00:48','{\"status\": \"financial_hold\"}','2023-12-14 15:00:48','2023-12-14 15:01:45','O3_931584427451758','1 Einträge für 1000.',100000,'EUR',151), 
(4,2,1,'completed',145,'2023-12-14 16:32:39','{\"status\": \"financial_hold\"}','2023-12-14 16:32:40','2023-12-14 16:33:44','O4_480926317657827','1 item(s) for 349.14.',34914,'EUR',145);
