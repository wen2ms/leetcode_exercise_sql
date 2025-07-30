CREATE TABLE IF NOT EXISTS Employees(
	employee_id INT UNIQUE,
	name VARCHAR(50),
	reports_to INT,
	age INT
);

INSERT INTO Employees (employee_id, name, reports_to, age) VALUES (9, 'Hercy', NULL, 43);
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES (6, 'Alice', 9, 41);
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES (4, 'Bob', 9, 36);
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES (2, 'Winston', NULL, 37);

SELECT mgr.employee_id, mgr.name,
COUNT(emp.reports_to) AS reports_count, ROUND(AVG(emp.age)) AS average_age
FROM Employees emp JOIN Employees mgr
ON emp.reports_to = mgr.employee_id GROUP BY mgr.employee_id ORDER BY mgr.employee_id;

DROP TABLE IF EXISTS Employees;