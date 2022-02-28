
use fsd;
INSERT INTO `coaches`(`first_name`, `last_name`,`salary`, `coach_level`)
SELECT `first_name`, `last_name`, `salary` * 2, char_length(`first_name`)
FROM `players`
WHERE age >= 45;


#3
UPDATE `coaches` AS c
JOIN players_coaches AS pc
on pc.coach_id = c.id
SET `coach_level` = `coach_level` + 1
WHERE `first_name` LIKE 'A%';

#4
DELETE FROM players
WHERE  age >= 45;

#5
SELECT `first_name`, `age`, `salary`
FROM `players`
ORDER BY `salary` DESC;

#6
SELECT * FROM players AS p
JOIN skills_data AS sd
ON sd.id = p.skills_data_id
WHERE age < 23 AND position = 'A' AND p.hire_date IS NULL AND sd.strength > 50
ORDER BY salary ASC, age asc;

#7

SELECT t.`name`, t.`established`, t.`fan_base`,(SELECT COUNT(*) FROM `players` WHERE `team_id` = t.`id`) AS `pc`
FROM `teams` AS t
ORDER BY `pc` DESC, `fan_base` DESC;

#8
SELECT COUNT(`id`)
FROM players
GROUP BY `team_id`
ORDER BY `team_id`;