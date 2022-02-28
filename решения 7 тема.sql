#01	Employees with Salary Above 35000
CREATE PROCEDURE usp_get_employees_salary_above_35000 ()
BEGIN 
SELECT `first_name`, `last_name`
from `employees`
Where `salary` > 35000
order by `first_name`, `last_name`, `employee_id`;

End $$


# 02  Employees with Salary Above Number
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(min_salary DECIMAL(19, 4))
BEGIN
    SELECT `first_name`, `last_name`
    FROM `employees`
    WHERE `salary` >= min_salary
    ORDER BY `first_name`, `last_name`, `employee_id`;
END; $$
CALL usp_get_employees_salary_above(45000);

#03 Town Names Starting With

DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with (start_str VARCHAR(20))
BEGIN
SELECT `name` 
FROM `towns`
WHERE `name` LIKE concat(start_str, '%')
ORDER BY `name`;
END; $$
call usp_get_towns_starting_with('b');


