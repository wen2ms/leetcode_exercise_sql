CREATE TABLE IF NOT EXISTS Customer (
	customer_id INT,
	name VARCHAR(20),
	visited_on DATE,
	amount INT,
	
	PRIMARY KEY (customer_id, visited_on)
);

INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (1, 'Jhon', '2019-01-01', 100);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (2, 'Daniel', '2019-01-02', 110);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (3, 'Jade', '2019-01-03', 120);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (4, 'Khaled', '2019-01-04', 130);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (5, 'Winston', '2019-01-05', 110);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (6, 'Elvis', '2019-01-06', 140);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (7, 'Anna', '2019-01-07', 150);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (8, 'Maria', '2019-01-08', 80);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (9, 'Jaze', '2019-01-09', 110);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (1, 'Jhon', '2019-01-10', 130);
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES (3, 'Jade', '2019-01-10', 150);

SELECT visited_on, 
(SELECT SUM(amount) FROM Customer WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on)
AS amount, 
ROUND((SELECT SUM(amount) / 7 FROM Customer WHERE visited_on 
BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on), 2) AS average_amount
FROM Customer c WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM customer) 
GROUP BY visited_on ORDER BY visited_on;

DROP TABLE IF EXISTS Customer;