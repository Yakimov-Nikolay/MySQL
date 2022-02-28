
# 01 exsersise CRUD
SELECT * FROM departments
order by `department_id`;

# 02 exsersise CRUD
SELECT `name` FROM departments
ORDER BY `department_id`;

# 03 exsersise CRUD
SELECT `first_name`, `last_name`, `salary`
 FROM `employees`;
 
 # 04 exersise CRUD
 SELECT `first_name`, `middle_name`, `last_name`
 FROM employees;
 
 # 05 
 SELECT concat(`first_name`,'.',`last_name`,'@softuni.bg') 
 AS 'full_email_address'
 from `employees`;
 
 # 06
 SELECT DISTINCT `salary` from `employees`
 ORDER BY `employee_id`;
 
 #7
 SELECT * from `employees`
 WHERE `job_title` = 'Sales Representative'
 ORDER BY `employee_id`;
 
 #8
SELECT `first_name`, `last_name`, `job_title` 
FROM employees
WHERE `salary` BETWEEN 20000 AND 30000
order by `employee_id`;
 
 #9
 SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`)
 AS 'Full Name'
 from `employees`
 WHERE `salary` in (25000, 14000, 12500, 23600);
 
 #10
 SELECT * from `employees`
 WHERE `manager_id` is null;
 
 #11
 SELECT `first_name`, `last_name`, `salary` from employees
 WHERE `salary` > 50000
 ORDER BY `salary` DESC;
 
 #12
SELECT 
    `first_name`, `last_name`
FROM
    `employees`
ORDER BY `salary` DESC
LIMIT 5;

#13
SELECT  `first_name`, `last_name` FROM `employees`
WHERE `department_id` !=4 ;

#14
SELECT *FROM`employees`
ORDER BY `salary` DESC , `first_name` , `last_name` DESC , `middle_name`;

#15
CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`, `last_name`, `salary` FROM `employees`;
SELECT * FROM `v_employees_salaries`;

#16
CREATE VIEW `v_employees_job_titles` AS
 SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) 
 AS 'full name', `job_title`
 from `employees`;
 SELECT * FROM `v_employees_job_titles`;
 
 #17
 SELECT DISTINCT `job_title` FROM `employees`
 ORDER BY `job_title`;
 
 #18
 SELECT * from `projects`
 ORDER BY `start_date`, `name`, `project_id`
 LIMIT 10;
 
 #19 
 SELECT `first_name`, `last_name`, `hire_date` FROM `employees`
 ORDER BY `hire_date` DESC
 LIMIT 7;
 
 #20
 SELECT * From `employees`;
 update `employees`
 set `salary` = `salary` * 1.12
 where `department_id` in (1, 2, 4, 11);
 SELECT `salary` FROM `employees`;
 
 #21
 SELECT `peak_name` FROM `peaks`
 ORDER BY `peak_name`;
 
 #22
 SELECT `country_name`,`continent_code`,`population` 
 FROM `countries`
 WHERE `continent_code` = 'EU'
 ORDER BY `population` DESC, `country_name`
 LIMIT 30;
 
 #23
   SELECT `country_name`,`country_code`,
   if(`currency_code`= 'EUR', 'Euro', 'Not Euro')AS 'currency'
   from `countries`
   ORDER BY `country_name`;
   
   #24
   SELECT `name` FROM `characters`
   ORDER BY `name`ASC;
 
 
 
 
 
 

