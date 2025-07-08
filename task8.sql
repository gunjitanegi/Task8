CREATE DATABASE E;
USE E;

CREATE TABLE employees(
e_id INTEGER ,
fname VARCHAR(100),
lname VARCHAR(100),
start_date DATE
);

INSERT INTO employees (e_id, fname, lname, start_date)
VALUES (1, 'Michael', 'Smith', '2001-06-22'),
(2, 'Susan', 'Barker', '2002-09-12'),
(3,	'Robert', 'Tvler',	'2000-02-09'),
(4,	'Susan', 'Hawthorne', '2002-04-24');

DELIMITER //

CREATE FUNCTION no_of_years(date1 date) RETURNS int DETERMINISTIC
BEGIN
 DECLARE date2 DATE;
  Select current_date()into date2;
  RETURN year(date2)-year(date1);
END 

//

DELIMITER ;

Select e_id, fname, lname, no_of_years(start_date) as 'years' from employees;

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
SELECT * FROM employees;
 END //
 
 DELIMITER ;
 
 CALL GetAllEmployees();