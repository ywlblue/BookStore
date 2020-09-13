USE `pineappledb`;

-- MUST BE IN THIS ORDER
DROP TABLE IF EXISTS `order_detail`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `book`;
DROP TABLE IF EXISTS `book_order`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  UNIQUE KEY `user_id_UNIQUE`(`user_id`)
) ENGINE=InnoDB;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  UNIQUE KEY `category_id_UNIQUE`(`category_id`)
) ENGINE=InnoDB;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `image` blob NOT NULL,
  `price` float NOT NULL,
  `publish_date` date NOT NULL,
  `last_update_time` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  UNIQUE KEY `book_id_UNIQUE`(`book_id`),
  UNIQUE KEY `title_UNIQUE`(`title`),
  KEY `category_fk_idx`(`category_id`),
  CONSTRAINT `category_fk` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address_line1` varchar(64) NOT NULL,
  `address_line2` varchar(64) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(64) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `zipcode` varchar(24) NOT NULL,
  `password` varchar(16) NOT NULL,
  `register_date` datetime NOT NULL,
  UNIQUE KEY `customer_id_UNIQUE`(`customer_id`),
  UNIQUE KEY `email_UNIQUE`(`email`)
) ENGINE=InnoDB;

CREATE TABLE `book_order` (
  `order_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `r_firstname` varchar(30) NOT NULL,
  `r_lastname` varchar(30) NOT NULL,
  `r_address_line1` varchar(64) NOT NULL,
  `r_address_line2` varchar(64) NOT NULL,
  `r_city` varchar(30) NOT NULL,
  `r_state` varchar(30) NOT NULL,
  `r_country` varchar(64) NOT NULL,
  `r_phone` varchar(16) NOT NULL,
  `r_zipcode` varchar(24) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `total` float NOT NULL,
  `status` varchar(20) NOT NULL,
  `shipping_fee` float NOT NULL,
  `tax` float NOT NULL,
  `subtotal` float NOT NULL,
  UNIQUE KEY `order_id_UNIQUE`(`order_id`),
  KEY `customer_fk_2_idx`(`customer_id`),
  CONSTRAINT `customer_fk_2` FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `order_detail` (
  `order_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  KEY `order_fk_idx`(`order_id`),
  KEY `book_fk_2_idx`(`book_id`),
  CONSTRAINT `book_fk_2` FOREIGN KEY(`book_id`) REFERENCES `book`(`book_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_fk` FOREIGN KEY(`order_id`) REFERENCES `book_order`(`order_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `review_time` datetime NOT NULL,
  UNIQUE KEY `review_id_UNIQUE`(`review_id`),
  KEY `book_fk_idx`(`book_id`),
  KEY `customer_fk_idx`(`customer_id`),
  CONSTRAINT `book_fk` FOREIGN KEY(`book_id`) REFERENCES `book`(`book_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_fk` FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`) ON
    DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
