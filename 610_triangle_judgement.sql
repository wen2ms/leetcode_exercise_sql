CREATE TABLE IF NOT EXISTS Triangle(
	x INT,
	y INT,
	z INT,
	
	PRIMARY KEY (x, y, z)
);

INSERT INTO Triangle (x, y, z) VALUES (13, 15, 30);
INSERT INTO Triangle (x, y, z) VALUES (10, 20, 15);

SELECT x, y, z, IF(x + y > z AND y + z > x AND x + z > y, 'Yes', 'No') AS triangle FROM Triangle; 

DROP TABLE IF EXISTS Triangle;