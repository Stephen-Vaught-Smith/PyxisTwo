CREATE TABLE `act_type`(
`id` int AUTO_INCREMENT NOT NULL,
`title` varchar(25) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE `award_user`(
`id` int AUTO_INCREMENT NOT NULL,
`first_name`varchar(25),
`last_name` varchar(25),
`email` varchar(100) NOT NULL UNIQUE,
`password` varchar(25) NOT NULL,
`sig` mediumblob, 
`department` varchar(25),
`act_id` int NOT NULL,
`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`resetToken` varchar(10),
PRIMARY KEY (`id`),
FOREIGN KEY (act_id) REFERENCES act_type(id)
) ENGINE=InnoDB;

CREATE TABLE `class`(
id int AUTO_INCREMENT NOT NULL,
title varchar(100) NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=InnoDB;

-- date must be in YYYY-MM-DD format
CREATE TABLE `award`(
`id` int AUTO_INCREMENT NOT NULL,
`user_id` int,
`class_id` int NOT NULL,
`proclamation` varchar(100) DEFAULT 'For Exemplary Performance',
`first_name` varchar(50) NOT NULL,
`last_name` varchar(50) NOT NULL,
`email` varchar(100) NOT NULL,
`award_date` DATE NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (user_id) REFERENCES award_user(id) ON DELETE SET NULL,
FOREIGN KEY (class_id) REFERENCES class(id)
)ENGINE=InnoDB;

INSERT INTO `act_type` (`title`) VALUES ('regular');
INSERT INTO `act_type` (`title`) VALUES ('admin');
INSERT INTO `class` (`title`) VALUES ('Exemplary Performance');
INSERT INTO `class` (`title`) VALUES ('Exemplary Attendance');
INSERT INTO `class` (`title`) VALUES ('Exemplary Effort');
INSERT INTO `class` (`title`) VALUES ('Exemplary Customer Service');

insert into award_user (first_name, last_name, email, act_id, password, department) values ('admin', 'admin', 'admin@test.com', 2, 'admin', 'administration');
