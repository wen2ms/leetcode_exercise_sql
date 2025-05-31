CREATE TABLE IF NOT EXISTS Customer (
	id INT PRIMARY KEY,
	name VARCHAR(25),
	referee_id INT
);

INSERT INTO Customer VALUES (1, 'Will', NULL);
INSERT INTO Customer VALUES (2, 'Jane', NULL);
INSERT INTO Customer VALUES (3, 'Alex', 2);
INSERT INTO Customer VALUES (4, 'Bill', NULL);
INSERT INTO Customer VALUES (5, 'Zack', 1);
INSERT INTO Customer VALUES (6, 'Mark', 2);

SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS NULL;

DROP TABLE IF EXISTS Customer;