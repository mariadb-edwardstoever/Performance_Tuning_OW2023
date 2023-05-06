create schema if not exists slap;
use slap;

CREATE TABLE IF NOT EXISTS `slap_results` (
  `slap_id` int(11) NOT NULL AUTO_INCREMENT,
  `tick` datetime DEFAULT current_timestamp(),
  `script` varchar(40) DEFAULT NULL,
  `load_type` varchar(20) DEFAULT NULL,
  `average_seconds` decimal(9,3) DEFAULT NULL,
  `minimum_seconds` decimal(9,3) DEFAULT NULL,
  `maximum_seconds` decimal(9,3) DEFAULT NULL,
  `client_count` int(11) DEFAULT NULL,
  `queries_per_session` int(11) DEFAULT NULL,
  PRIMARY KEY (`slap_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

