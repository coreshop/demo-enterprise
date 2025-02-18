
SET NAMES utf8mb4;

INSERT INTO coreshop_loyalty_points_transaction (`id`,`loyalty_account`,`pointsValue`,`type`,`details`,`detailParams`,`creationDate`,`modificationDate`) VALUES (1,1,349,'income','order','{\"orderId\": 134}','2023-12-14 10:04:18','2023-12-14 10:04:18'), 
(2,1,100,'expense','voucher_purchase','{\"voucher\": 139, \"voucher_name\": \"Voucher 10€\", \"voucher_code_id\": 1}','2023-12-14 10:04:26','2023-12-14 10:04:26'), 
(3,1,1000,'income','order','{\"orderId\": 151}','2023-12-14 15:00:49','2023-12-14 15:00:49'), 
(4,1,349,'income','order','{\"orderId\": 145}','2023-12-14 16:32:40','2023-12-14 16:32:40'), 
(5,1,349,'income','order','{\"orderId\": 172}','2023-12-14 20:39:13','2023-12-14 20:39:13'), 
(6,1,438,'income','order','{\"orderId\": 185}','2023-12-15 12:44:20','2023-12-15 12:44:20'), 
(7,1,438,'income','order','{\"orderId\": 194}','2023-12-15 12:45:49','2023-12-15 12:45:49'), 
(8,1,13560,'income','order','{\"orderId\": 231}','2024-10-24 14:08:07','2024-10-24 14:08:07'), 
(9,2,12000,'income','order','{\"orderId\": 264}','2025-01-29 08:01:09','2025-01-29 08:01:09');
