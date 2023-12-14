
SET NAMES utf8mb4;

INSERT INTO documents_email (`id`,`controller`,`template`,`to`,`from`,`replyTo`,`cc`,`bcc`,`subject`,`missingRequiredEditable`) VALUES (11,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Registrierung erfolgreich abgeschlossen',0), 
(12,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Registrierung erfolgreich abgeschlossen',0), 
(14,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Reset Password',0), 
(15,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Passwort zurücksetzen',0), 
(17,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Confirm Newsletter',0), 
(18,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Newsletter Anmeldung',0), 
(20,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Newsletter subscription confirmed',0), 
(21,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Newsletter Anmeldung bestätigt',0), 
(23,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::orderConfirmationAction',NULL,'','','','','','Order Confirmation {{ orderNumber }}',0), 
(24,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::orderConfirmationAction',NULL,'','','','','','Bestellbestätigung {{ orderNumber }}',0), 
(26,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Your order has been shipped {{ orderNumber }}',0), 
(27,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Ihre Bestellung wurde versandt {{ orderNumber }}',0), 
(29,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Notes on your order {{ orderNumber }}',0), 
(30,'CoreShop\\Bundle\\FrontendBundle\\Controller\\MailController::mailAction',NULL,'','','','','','Hinweise zu Ihrer Bestellung {{ orderNumber }}',0);
