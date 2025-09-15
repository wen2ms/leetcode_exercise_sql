CREATE TABLE IF NOT EXISTS Logs (
	id INT PRIMARY KEY, 
	num VARCHAR(20)
);

INSERT INTO Logs (id, num) VALUES (1, '1');
INSERT INTO Logs (id, num) VALUES (2, '1');
INSERT INTO Logs (id, num) VALUES (3, '1');
INSERT INTO Logs (id, num) VALUES (4, '2');
INSERT INTO Logs (id, num) VALUES (5, '1');
INSERT INTO Logs (id, num) VALUES (6, '2');
INSERT INTO Logs (id, num) VALUES (7, '2');

SELECT DISTINCT logs1.num AS ConsecutiveNums FROM Logs logs1, Logs logs2, Logs logs3 WHERE logs1.num = logs2.num AND
logs2.num = logs3.num AND logs1.id = logs2.id - 1 AND logs2.id = logs3.id - 1;

DROP TABLE IF EXISTS Logs;
