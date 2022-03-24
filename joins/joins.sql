/*
inner join
*/
select o.`name`, t.`name` FROM offices As o
join towns As t
on o.`town_id` = t.`id`;

/*
left
*/
select o.`name`, t.`name` FROM offices As o
 left join towns As t
on o.`town_id` = t.`id`;

/*
rightemployees
*/

select o.`name`, t.`name` FROM offices As o
right join towns As t
on o.`town_id` = t.`id`;