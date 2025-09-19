CREATE TABLE IF NOT EXISTS Department(
	id INT PRIMARY KEY,
	name VARCHAR(20)
);

INSERT INTO Department (id, name) VALUES (1, 'IT');
INSERT INTO Department (id, name) VALUES (2, 'Sales');

CREATE TABLE IF NOT EXISTS Employee(
	id INT PRIMARY KEY,
	name VARCHAR(20),
	salary INT,
	departmentId INT,
	
	CONSTRAINT foreign_key_departmentId FOREIGN KEY (departmentId) REFERENCES Department(id)
);

INSERT INTO Employee (id, name, salary, departmentId) VALUES (1, 'Joe', 85000, 1);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (2, 'Henry', 80000, 2);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (3, 'Sam', 60000, 2);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (4, 'Max', 90000, 1);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (5, 'Janet', 69000, 1);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (6, 'Randy', 85000, 1);
INSERT INTO Employee (id, name, salary, departmentId) VALUES (7, 'Will', 70000, 1);

SELECT dept.name AS Department, emp1.name AS Employee, emp1.salary AS Salary
FROM Employee emp1 JOIN Department dept ON emp1.departmentId = dept.id
WHERE (SELECT COUNT(DISTINCT salary) FROM Employee emp2 
WHERE emp2.departmentId = emp1.departmentId AND emp2.salary >= emp1.salary) <= 3
ORDER BY Department, Salary DESC;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;