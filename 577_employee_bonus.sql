CREATE TABLE IF NOT EXISTS Employee(
	empId INT UNIQUE,
	name VARCHAR(25),
	supervisor INT,
	salary INT
);

INSERT INTO Employee (empId, name, supervisor, salary) VALUES (3, 'Brad', NULL, 4000);
INSERT INTO Employee (empId, name, supervisor, salary) VALUES (1, 'John', 3, 1000);
INSERT INTO Employee (empId, name, supervisor, salary) VALUES (2, 'Dan', 3, 2000);
INSERT INTO Employee (empId, name, supervisor, salary) VALUES (4, 'Thomas', 3, 4000);

CREATE TABLE IF NOT EXISTS Bonus(
	empId INT UNIQUE,
	bonus INT,
	
	CONSTRAINT foriegn_key_empId FOREIGN KEY (empId) REFERENCES Employee(empId)
);

INSERT INTO Bonus (empId, bonus) VALUES (2, 500);
INSERT INTO Bonus (empId, bonus) VALUES (4, 2000);

SELECT emp.name, bns.bonus FROM Employee emp LEFT JOIN Bonus bns ON emp.empId = bns.empId WHERE bns.bonus < 1000 OR bns.bonus IS NULL;  

DROP TABLE IF EXISTS Bonus;
DROP TABLE IF EXISTS Employee;