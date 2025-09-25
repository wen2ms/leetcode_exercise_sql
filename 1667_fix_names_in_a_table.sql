CREATE TABLE IF NOT EXISTS Users(
	user_id INT PRIMARY KEY,
	name VARCHAR(20)
);

INSERT INTO Users (user_id, name) VALUES (1, 'aLice');
INSERT INTO Users (user_id, name) VALUES (2, 'bOB');

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name FROM Users ORDER BY user_id;

DROP TABLE IF EXISTS Users;