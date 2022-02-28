# 01 Employee Address
SELECT e.`employee_id`, e.`job_title`, a.`address_id`, a.`address_text`
FROM `employees`AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
ORDER BY `address_id`
LIMIT 5;

#02 Addresses with Towns
SELECT e.`first_name`, e.`last_name`,t.`name`,a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON a.`town_id` = t.`town_id`
ORDER BY `first_name`, `last_name`
LIMIT 5;

#3 Sales Employee
SELECT e.`employee_id`,e.`first_name`, e.`last_name`, d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY `employee_id` DESC;

#4 
SELECT e.`employee_id`,e.`first_name`, e.`salary`, d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE `salary` > 15000
ORDER BY d.`department_id`  DESC
LIMIT 5;

#5 Employees Without Project
SELECT e.`employee_id`, e.`first_name`, ep.`project_id`
FROM `employees` AS e
LEFT JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
WHERE ep.`project_id` is NULL
ORDER BY `employee_id` DESC
LIMIT 3;

#6 Employees Hired After
SELECT e.`first_name`, e.`last_name`, e.`hire_date`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE DATE(e.`hire_date`) > '1999-01-01'
 AND d.`name` IN ('Sales', 'Finance')
ORDER BY e.`hire_date` ASC;

#7 Employees with Project
SELECT e.`employee_id`, e.`first_name`, p.`name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
on ep.`project_id` = p.`project_id`
WHERE DATE(p.`start_date`) > '2002-08-13'
AND p.`end_date` IS NULL
ORDER BY e.`first_name`ASC,p.`name`asc
LIMIT 5;

#8 Employee 24
SELECT e.`employee_id`, e.`first_name`,
IF(YEAR(p.`start_date`)>2004, null, p.`name`) AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON ep.`employee_id` = e.`employee_id`
JOIN `projects` AS p
on p.`project_id` = ep.`project_id`
WHERE e.`employee_id` = 24
ORDER BY `project_name`;

#9 Employee Manager
SELECT e.`employee_id`, e.`first_name`,e.`manager_id`, m.`first_name` AS `manager_name`
FROM `employees` AS e
JOIN `employees` AS m
ON e.`manager_id` = m.`employee_id`
WHERE e.`manager_id` IN (3 ,7)
ORDER BY e.`first_name`;

#10
SELECT e.`employee_id`,
concat_ws(' ', e.`first_name`, e.`last_name`) AS `employee_name`,
concat_ws(' ', m.`first_name`, m.`last_name`) AS `manager_name`, d.`name`
FROM `employees` AS e
JOIN `employees` AS m
ON e.`manager_id` = m.`employee_id`
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
ORDER BY `employee_id`
LIMIT 5;

#11	Min Average Salary
SELECT avg(`salary`) AS `average`
FROM `employees`
GROUP BY `department_id`
ORDER BY `average`
LIMIT 1;

#12
SELECT c.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` =  m.`id`
JOIN `peaks` AS p
ON p.`mountain_id` = m.`id`
WHERE c.`country_code` = 'BG' AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;

#13 Count Mountain Ranges
SELECT c.`country_code`,count(`mountain_range`) AS `mountain_range`
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` =  m.`id`
WHERE c.`country_code` IN ('US','RU', 'BG')
GROUP BY `country_code`
ORDER BY `mountain_range` DESC;

#14	Countries with Rivers
SELECT c.`country_name`, r.`river_name`
FROM `countries` AS c
JOIN `continents` AS con
ON c.`continent_code` = con.`continent_code`
LEFT JOIN `countries_rivers` AS cr
ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` AS r
ON r.`id` = cr.`river_id`
WHERE con.`continent_code` = 'AF'
ORDER BY `country_name`
LIMIT 5;

#15 Continents and Currencies
SELECT c.`continent_code`,`currency_code`, COUNT(c.`country_name`) AS `used_currency`
FROM `countries` AS c
GROUP BY `continent_code`, `currency_code`
HAVING `used_currency`= (
SELECT COUNT(`country_code`) AS `coun`
FROM `countries` AS c1
WHERE c1.`continent_code` = c.`continent_code`
GROUP BY `currency_code`
ORDER BY `coun` DESC
LIMIT 1
) and `used_currency` > 1
order BY `continent_code`;






#16 Countries Without Any Mountains
SELECT count(`country_name`)
FROM `countries` AS c
WHERE c.`country_code` NOT IN
(
SELECT `country_code` FROM `mountains_countries`
);

#17 Highest Peak and Longest River by Country

SELECT c.`country_name`,
MAX(p.`elevation`) AS `highest_peak_elevation`,
MAX(r.`length`) AS `longest_river_length`
FROM `countries` AS c
JOIN `countries_rivers` AS cr
USING(`country_code`)
JOIN `rivers` AS r
ON r.`id` = cr.`river_id`
JOIN `mountains_countries` AS mc
on c.`country_code` =  mc.`country_code`
JOIN `mountains`AS m
ON mc.`mountain_id`= m.`id`
JOIN `peaks` AS p
on p.`mountain_id` = m.`id`
GROUP BY `country_name`
ORDER BY `highest_peak_elevation` DESC, `longest_river_length`DESC, `country_name`
LIMIT 5;





