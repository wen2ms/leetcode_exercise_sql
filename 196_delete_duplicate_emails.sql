CREATE TABLE IF NOT EXISTS Person(
	id INT PRIMARY KEY,
	email VARCHAR(20)
);

INSERT INTO Person (id, email) VALUES (1, 'john@example.com');
INSERT INTO Person (id, email) VALUES (2, 'bob@example.com');
INSERT INTO Person (id, email) VALUES (3, 'john@example.com');

DELETE p1 FROM Person p1, Person p2 WHERE p1.email = p2.email AND p1.id > p2.id;
SELECT id, email FROM Person;

DROP TABLE IF EXISTS Person;