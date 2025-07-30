CREATE TABLE IF NOT EXISTS Employee(
	employee_id INT,
	department_id INT,
	primary_flag ENUM('Y', 'N'),
	
	PRIMARY KEY (employee_id, department_id)
);

INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (1, 1, 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (2, 1, 'Y');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (2, 2, 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (3, 3, 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (4, 2, 'N');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (4, 3, 'Y');
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES (4, 4, 'N');

SELECT employee_id, department_id FROM Employee WHERE primary_flag = 'Y' OR employee_id IN 
(SELECT employee_id FROM Employee GROUP BY employee_id HAVING COUNT(employee_id) = 1);

DROP TABLE IF EXISTS Employee;