CREATE SCHEMA fsd;
CREATE TABLE `players` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR (10) NOT NULL,
`last_name` VARCHAR (20) NOT NULL,
`age` INT NOT NULL DEFAULT 0,
`position` CHAR(1) NOT NULL,
`salary` DECIMAL (10, 2) NOT NULL DEFAULT 0,
`hire_date` DATETIME,
`skills_data_id` INT NOT NULL,
`team_id` INT 
);

CREATE TABLE `coaches` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR (10) NOT NULL,
`last_name` VARCHAR (20) NOT NULL,
`salary` DECIMAL (10, 2) NOT NULL DEFAULT 0,
`coach_level` INT NOT NULL DEFAULT 0
);

CREATE TABLE `players_coaches`(
`player_id` INT,
`coach_id` INT,
CONSTRAINT pk_players_coahers_players
PRIMARY KEY (player_id, coach_id),
CONSTRAINT  `fk_player_id_id`
FOREIGN KEY (`player_id`)
REFERENCES `players`(`id`),
CONSTRAINT `fk_coach_id_id`
FOREIGN KEY (`coach_id`)
REFERENCES coaches(`id`)
);

CREATE TABLE `skills_data` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`dribbling` int DEFAULT 0,
`pace` int DEFAULT 0,
`passing` int DEFAULT 0,
`shooting` int DEFAULT 0,
`speed` int DEFAULT 0,
`strength` int DEFAULT 0
);

CREATE TABLE `countries`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (45) NOT NULL,
`country_id` INT NOT NULL,
CONSTRAINT `fk_countries_towns`
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`)
);

CREATE TABLE `stadiums`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (45) NOT NULL,
`capacity` INT NOT NULL,
`town_id` int NOT NULL,
CONSTRAINT `fk_towns_stadiums`
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`)
);

CREATE TABLE `teams`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (45) NOT NULL,
`established` DATE NOT NULL,
`fan_base` BIGINT NOT NULL DEFAULT 0,
`stadium_id` INT NOT NULL,
CONSTRAINT `fk_stadiums_teams`
FOREIGN KEY (`stadium_id`)
REFERENCES `stadiums`(`id`)
);

ALTER TABLE `players`
ADD CONSTRAINT `fk_players_skills`
FOREIGN KEY (`skills_data_id`)
REFERENCES `skills_data`(`id`),
ADD CONSTRAINT `fk_players_teams`
FOREIGN KEY (`team_id`)
REFERENCES `teams`(`id`);
