CREATE TABLE IF NOT EXISTS Employees(
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO Employees (id, name) VALUES (1, 'Alice');
INSERT INTO Employees (id, name) VALUES (7, 'Bob');
INSERT INTO Employees (id, name) VALUES (11, 'Meir');
INSERT INTO Employees (id, name) VALUES (90, 'Winston');
INSERT INTO Employees (id, name) VALUES (3, 'Jonathan');

CREATE TABLE IF NOT EXISTS EmployeeUNI(
	id INT,
	unique_id INT,
	
	PRIMARY KEY (id, unique_id)
); 

INSERT INTO EmployeeUNI (id, unique_id) VALUES (3, '1');
INSERT INTO EmployeeUNI (id, unique_id) VALUES (11, '2');
INSERT INTO EmployeeUNI (id, unique_id) VALUES (90, '3');

SELECT emp_uni.unique_id, emps.name FROM Employees emps LEFT JOIN EmployeeUNI emp_uni ON emps.id = emp_uni.id;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeeUNI;