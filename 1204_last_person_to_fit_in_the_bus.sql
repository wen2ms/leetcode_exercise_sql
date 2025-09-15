CREATE TABLE IF NOT EXISTS Queue (
	person_id INT UNIQUE,
	person_name VARCHAR(20),
	weight INT,
	turn INT 
);

INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (5, 'Alice', 250, 1);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (4, 'Bob', 175, 5);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (3, 'Alex', 350, 2);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (6, 'John Cena', 400, 3);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (1, 'Winston', 500, 6);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES (2, 'Marie', 200, 4);

SELECT person_name FROM (SELECT person_name, turn, SUM(weight) OVER (ORDER BY turn) AS cummulative_weight FROM queue) 
AS info WHERE cummulative_weight <= 1000 ORDER BY turn DESC LIMIT 1;

DROP TABlE IF EXISTS Queue;