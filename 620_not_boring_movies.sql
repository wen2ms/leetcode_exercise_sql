CREATE TABLE IF NOT EXISTS Cinema(
	id INT PRIMARY KEY,
	movie VARCHAR(25),
	description VARCHAR(25),
	rating FLOAT(4, 2) CHECK (rating >= 0 AND rating <= 10)
);

INSERT INTO Cinema (id, movie, description, rating) VALUES (1, 'War', 'great 3D', 8.9);
INSERT INTO Cinema (id, movie, description, rating) VALUES (2, 'Science', 'fiction', 8.5);
INSERT INTO Cinema (id, movie, description, rating) VALUES (3, 'irish', 'boring', 6.2);
INSERT INTO Cinema (id, movie, description, rating) VALUES (4, 'Ice song', 'Fantacy', 8.6);
INSERT INTO Cinema (id, movie, description, rating) VALUES (5, 'House card', 'Interesting', 9.1);

SELECT id, movie, description, rating FROM Cinema WHERE MOD(id, 2) = 1 AND description != 'boring' ORDER BY rating DESC;

DROP TABLE IF EXISTS Cinema;