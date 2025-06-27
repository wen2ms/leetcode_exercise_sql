CREATE TABLE IF NOT EXISTS Transactions(
	id INT PRIMARY KEY,
	country VARCHAR(20),
	state ENUM('approved', 'declined'),
	amount INT,
	trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES (121, 'US', 'approved', 1000, '2018-12-18');
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES (122, 'US', 'declined', 2000, '2018-12-19');
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES (123, 'US', 'approved', 2000, '2019-01-01');
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES (124, 'DE', 'approved', 2000, '2019-01-07');

SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(id) AS trans_count, SUM(state = 'approved') AS approved_count,
SUM(amount) AS trans_total_amount, SUM((state = 'approved') * amount) AS approved_total_amount
FROM Transactions GROUP BY month, country;

DROP TABLE IF EXISTS Transactions;