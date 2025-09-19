CREATE TABLE IF NOT EXISTS Insurance(
	pid INT PRIMARY KEY,
	tiv_2015 FLOAT,
	tiv_2016 FLOAT,
	lat FLOAT NOT NULL,
	lon FLOAT NOT NULL
);

INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES (1, 10, 5, 10, 10);
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES (2, 20, 20, 20, 20);
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES (3, 10, 30, 20, 20);
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES (4, 10, 40, 40, 40);

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016 FROM 
(SELECT tiv_2016, COUNT(pid) OVER(PARTITION BY tiv_2015) AS count1, COUNT(pid) OVER(PARTITION BY lat, lon) AS count2
FROM Insurance) AS base WHERE count1 >= 2 AND count2 = 1;

DROP TABLE IF EXISTS Insurance;