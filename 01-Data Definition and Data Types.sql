CREATE DATABASE `minions`;
use `minions`;

CREATE TABLE `minions`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) not null,
`age` INT
);

CREATE TABLE `towns`(
`town_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) not null
);


TRUNCATE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;

CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` FLOAT(5, 2),
`weight` FLOAT(5, 2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);

CREATE TABLE `users`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB,
`last_login_time` DATETIME,
`is_deleted` BOOLEAN
);

INSERT INTO `users`(`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`)
VALUES
(1, 'pepo', '1234', NULL,'2000-02-02 23:00:00', TRUE),
(2, 'kiki', '12345', NULL,'2001-02-02 23:01:00', FALSE),
(3, 'niki', '12346', NULL,'2002-02-02 23:02:00', TRUE),
(4, 'niki2', '12347', NULL,'2003-02-02 23:03:00', TRUE),
(5, 'niki5', '123432', NULL,'2003-02-02 23:04:00', TRUE);

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY (`id`, `username`);

ALTER TABLE `users` 
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY (`id`);



CREATE DATABASE `soft_uni`;
create table `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

CREATE TABLE `departments`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

create table `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`middle_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30)NOT NULL,
`job_title` VARCHAR(45) NOT NULL,
`department_id` INT,
`hire_date` DATE,
`salary` DECIMAL
);


insert into `towns`
values
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna'),
(4, 'Burgas');

insert into `departments`
values 
(1,'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Software Development'),
(5, 'Quality Assurance');

insert into `employees`(`id`, `first_name`, `middle_name`, `last_name`, `job_title`, `department_id`,
 `hire_date`, `salary`)
values
(1, 'Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
(2, 'Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
(3, 'Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
(4, 'Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
(5, 'Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

SELECT * FROM `towns`
order by `name`;
SELECT * FROM `departments`
order by `name`;
SELECT * FROM `employees`
ORDER BY `salary` DESC;

UPDATE `employees`
SET `salary` = `salary` * 1.1








