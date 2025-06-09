CREATE TABLE IF NOT EXISTS Employee(
	employee_id INT PRIMARY KEY,
	name VARCHAR(25),
	experience_years INT NOT NULL
);

INSERT INTO Employee (employee_id, name, experience_years) VALUES (1, 'Khaled', 3);
INSERT INTO Employee (employee_id, name, experience_years) VALUES (2, 'Ali', 2);
INSERT INTO Employee (employee_id, name, experience_years) VALUES (3, 'John', 1);
INSERT INTO Employee (employee_id, name, experience_years) VALUES (4, 'Doe', 2);

CREATE TABLE IF NOT EXISTS Project(
	project_id INT,
	employee_id INT,
	
	CONSTRAINT foreign_key_employee_id FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

INSERT INTO Project (project_id, employee_id) VALUES (1, 1);
INSERT INTO Project (project_id, employee_id) VALUES (1, 2);
INSERT INTO Project (project_id, employee_id) VALUES (1, 3);
INSERT INTO Project (project_id, employee_id) VALUES (2, 1);
INSERT INTO Project (project_id, employee_id) VALUES (2, 4);

SELECT p.project_id, ROUND(AVG(e.experience_years), 2) AS average_years FROM Project p  LEFT JOIN Employee e
ON e.employee_id = p.employee_id GROUP BY p.project_id;

DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;