CREATE TABLE IF NOT EXISTS Users(
	user_id INT PRIMARY KEY,
	user_name VARCHAR(25)
);

INSERT INTO Users (user_id, user_name) VALUES (6, 'Alice');
INSERT INTO Users (user_id, user_name) VALUES (2, 'Bob');
INSERT INTO Users (user_id, user_name) VALUES (7, 'Alex');

CREATE TABLE IF NOT EXISTS Register(
	contest_id INT,
	user_id INT,
	
	PRIMARY KEY (contest_id, user_id)
);

INSERT INTO Register (contest_id, user_id) VALUES (215, 6);
INSERT INTO Register (contest_id, user_id) VALUES (209, 2);
INSERT INTO Register (contest_id, user_id) VALUES (208, 2);
INSERT INTO Register (contest_id, user_id) VALUES (210, 6);
INSERT INTO Register (contest_id, user_id) VALUES (208, 6);
INSERT INTO Register (contest_id, user_id) VALUES (209, 7);
INSERT INTO Register (contest_id, user_id) VALUES (209, 6);
INSERT INTO Register (contest_id, user_id) VALUES (215, 7);
INSERT INTO Register (contest_id, user_id) VALUES (208, 7);
INSERT INTO Register (contest_id, user_id) VALUES (210, 2);
INSERT INTO Register (contest_id, user_id) VALUES (207, 2);
INSERT INTO Register (contest_id, user_id) VALUES (210, 7);

SELECT contest_id, ROUND(COUNT(DISTINCT user_id) * 100 / (SELECT COUNT(user_id) FROM Users), 2) AS percentage 
FROM Register
GROUP BY contest_id ORDER BY percentage DESC, contest_id ASC;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Register;