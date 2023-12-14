
SET NAMES utf8mb4;

INSERT INTO coreshop_loyalty_points_transaction (`id`,`loyalty_account`,`pointsValue`,`type`,`details`,`detailParams`,`creationDate`,`modificationDate`) VALUES (1,1,349,'income','order','{\"orderId\": 134}','2023-12-14 10:04:18','2023-12-14 10:04:18'), 
(2,1,100,'expense','voucher_purchase','{\"voucher\": 139, \"voucher_name\": \"Voucher 10€\", \"voucher_code_id\": 1}','2023-12-14 10:04:26','2023-12-14 10:04:26'), 
(3,1,1000,'income','order','{\"orderId\": 151}','2023-12-14 15:00:49','2023-12-14 15:00:49'), 
(4,1,349,'income','order','{\"orderId\": 145}','2023-12-14 16:32:40','2023-12-14 16:32:40');
