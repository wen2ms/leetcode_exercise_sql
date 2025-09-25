CREATE TABLE IF NOT EXISTS Employee(
	id INT PRIMARY KEY,
	salary INT
);

INSERT INTO Employee (id, salary) VALUES (1, 100);
INSERT INTO Employee (id, salary) VALUES (2, 200);
INSERT INTO Employee (id, salary) VALUES (3, 300);

SELECT (SELECT DISTINCT Salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 1) AS SecondHighestSalary;

DROP TABlE IF EXISTS Employee;