CREATE TABLE IF NOT EXISTS Movies (
	movie_id INT PRIMARY KEY,
	title VARCHAR(20)
);

INSERT INTO Movies (movie_id, title) VALUES (1, 'Avengers');
INSERT INTO Movies (movie_id, title) VALUES (2, 'Frozen 2');
INSERT INTO Movies (movie_id, title) VALUES (3, 'Joker');

CREATE TABLE IF NOT EXISTS Users (
	user_id INT PRIMARY KEY,
	name VARCHAR(20) UNIQUE
);

INSERT INTO Users (user_id, name) VALUES (1, 'Daniel');
INSERT INTO Users (user_id, name) VALUES (2, 'Monica');
INSERT INTO Users (user_id, name) VALUES (3, 'Maria');
INSERT INTO Users (user_id, name) VALUES (4, 'James');

CREATE TABLE IF NOT EXISTS MovieRating (
	movie_id INT,
	user_id INT,
	rating INT,
	created_at DATE,
	
	PRIMARY KEY (movie_id, user_id)
);

INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (1, 1, 3, '2020-01-12');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (1, 2, 4, '2020-02-11');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (1, 3, 2, '2020-02-12');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (1, 4, 1, '2020-01-01');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (2, 1, 5, '2020-02-17');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (2, 2, 2, '2020-02-01');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (2, 3, 2, '2020-03-01');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (3, 1, 3, '2020-02-22');
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES (3, 2, 4, '2020-02-25');

(SELECT u.name AS results FROM MovieRating mr, Users u WHERE mr.user_id = u.user_id 
GROUP BY mr.user_id ORDER BY COUNT(mr.user_id) DESC, u.name LIMIT 1)
UNION ALL
(SELECT m.title AS results FROM MovieRating mr, Movies m WHERE mr.movie_id = m.movie_id AND mr.created_at 
LIKE '2020-02-%' GROUP BY mr.movie_id ORDER BY AVG(mr.rating) DESC, m.title LIMIT 1);

DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS MovieRating;
