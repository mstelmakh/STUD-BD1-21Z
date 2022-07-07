

--1
SELECT * FROM departments;

--2
SELECT department_id, name, manager_id
FROM departments;

--3
SELECT department_id, UPPER(name), manager_id
FROM departments;

--4
SELECT employee_id, name, surname,salary, 0.23*salary
FROM employees;

--5
SELECT employee_id, name, surname,salary, 0.23*salary AS taxes
FROM employees;

--6
SELECT COUNT(*)
FROM employees;

--7
SELECT name
FROM employees;

SELECT COUNT(name)
FROM employees;

--8
SELECT DISTINCT name
FROM employees;

SELECT count(DISTINCT name)
FROM employees;


--WHERE

--1
SELECT * FROM employees WHERE salary > 3000;
--2
SELECT * FROM employees WHERE salary BETWEEN 2000 AND 3000;

SELECT COUNT(*) FROM employees WHERE salary BETWEEN 2000 AND 3000;
--3
SELECT COUNT(*) FROM employees WHERE salary BETWEEN 2000 AND 3000 
AND date_employed > '1/1/2010';

SELECT e.*, EXTRACT(YEAR FROM date_employed) as year_employed FROM employees e;
--4
SELECT * FROM employees WHERE 0.23*salary < 500;
--5
SELECT * FROM countries WHERE name LIKE 'K%';
--6
SELECT * FROM employees WHERE department_id IS NULL;
--7
SELECT * FROM employees WHERE department_id IN (102, 103, 105);
--8
SELECT * FROM employees WHERE department_id NOT IN (102, 103, 105);
--9
SELECT name, surname, nvl(salary, 0) FROM employees WHERE salary IS NULL;

UPDATE employees
SET salary = NULL
WHERE salary = 0;

SELECT name, surname FROM employees WHERE salary = 0;

--ORDER BY/ FETCH

--1
SELECT name, surname, salary
FROM employees
ORDER BY salary DESC NULLS LAST
FETCH NEXT 5 ROWS ONLY;

--2


--3

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


-- INSERT
DROP TABLE computer;
CREATE TABLE computer
    (
        computer_id         NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT computer_pk PRIMARY KEY,
        name              VARCHAR2 (40 CHAR) NOT NULL,
        price               NUMBER (4) UNIQUE
    );
    
DESC computer;

INSERT INTO computer(name, price) VALUES ('lenovo', 5000);

UPDATE computer
SET name = 'asus'
WHERE computer_id = 1;

DELETE FROM computer WHERE name='asus';

SELECT * FROM computer;




-- 1
SELECT * FROM departments;

-- 2
SELECT name, address_id, manager_id 
FROM departments;

-- 3
SELECT UPPER(name) AS name, address_id, manager_id
FROM departments;

-- 4
SELECT employee_id, name, surname, salary, 0.23*salary as taxes 
FROM employees;

--6
SELECT COUNT(*) AS number_of_employees
FROM employees;

--7
SELECT name
FROM employees;

SELECT COUNT(name)
FROM employees;

--8
SELECT DISTINCT name
FROM employees;

SELECT COUNT(DISTINCT name)
FROM employees;


-- WHERE

--1
SELECT * FROM employees WHERE salary>3000;

--2
SELECT COUNT(*) FROM employees WHERE salary BETWEEN 2000 AND 3000;

--3
SELECT * FROM employees WHERE salary BETWEEN 2000 AND 3000 
AND date_employed > '01-JAN-2011';

--4
SELECT * FROM employees WHERE salary*0.23<500;

--5
SELECT * FROM countries WHERE name LIKE 'K%';

--6
SELECT * FROM employees WHERE department_id IS NULL;

--7
SELECT * FROM employees WHERE department_id IN (102,103,105);

--8
SELECT * FROM employees WHERE department_id NOT IN (102,103,105);

--9
SELECT name, surname, NVL(salary, 0) AS salary FROM employees WHERE salary IS NULL;

--ORDER BY
--1
SELECT name, surname FROM employees ORDER BY salary DESC NULLS LAST
FETCH NEXT 5 ROWS ONLY;

--2
SELECT * FROM employees ORDER BY date_employed NULLS LAST FETCH NEXT 1 ROWS ONLY;

--3
SELECT * FROM departments ORDER BY 
(SELECT MAX(salary)-MIN(salary) FROM employees WHERE department_id = departments.department_id)
DESC NULLS LAST
FETCH NEXT 2 ROWS ONLY;



-- KOLOKWIUM
--1
ALTER TABLE regions
    ADD status VARCHAR2(40 CHAR) DEFAULT 'active';
--2
DELETE FROM computer WHERE name='asus';

--3
ALTER TABLE employees
    ADD evaluation NUMBER CONSTRAINT evoluation_constraint CHECK(evaluation BETWEEN 0 AND 5);
DESC employees;

--4
ALTER TABLE employees
    ADD emp_projects DATE DEFAULT SYSDATE;
ALTER TABLE employees
    DROP COLUMN emp_projects;

--5
DESC szkolenia;
DROP TABLE szkolenia;
CREATE TABLE szkolenia
(
    id_szkolenia    NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT szkolenia_pk PRIMARY KEY,
    nazwa           VARCHAR2(40 CHAR),
    nazwa_skrocona  VARCHAR2(10 CHAR) UNIQUE, 
);
--6
SELECT CONCAT(SUBSTR(name, 1, 1), SUBSTR(surname, 1, 1)) AS initials
FROM employees WHERE department_id IN (101, 102, 103, 104, 105);

--7
SELECT year_budget FROM departments WHERE established < '01-JAN-05'
ORDER BY year_budget DESC FETCH FIRST 1 ROW ONLY;

--8
SELECT name, year_budget*110 AS future_budget FROM departments WHERE year_budget < 5500000;

--9
SELECT surname, LENGTH(surname) FROM employees ORDER BY LENGTH(surname) FETCH FIRST 1 ROW ONLY;

--10
SELECT COUNT(*), MIN(salary), ROUND(AVG(salary), 1), MAX(salary) FROM employees WHERE department_id = 101;

--11