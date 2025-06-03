CREATE TABLE IF NOT EXISTS Employee(
	id INT PRIMARY KEY,
	name VARCHAR(25),
	department VARCHAR(25),
	managerId INT
);

INSERT INTO Employee (id, name, department, managerId) VALUES (101, 'John', 'A', NULL);
INSERT INTO Employee (id, name, department, managerId) VALUES (102, 'Dan', 'A', 101);
INSERT INTO Employee (id, name, department, managerId) VALUES (103, 'James', 'A', 101);
INSERT INTO Employee (id, name, department, managerId) VALUES (104, 'Amy', 'A', 101);
INSERT INTO Employee (id, name, department, managerId) VALUES (105, 'Anne', 'A', 101);
INSERT INTO Employee (id, name, department, managerId) VALUES (106, 'Ron', 'B', 101);

SELECT e1.name FROM Employee e1 JOIN Employee e2 ON e1.id = e2.managerId GROUP BY e1.id
HAVING COUNT(e2.managerId) >= 5;

DROP TABLE IF EXISTS Employee;