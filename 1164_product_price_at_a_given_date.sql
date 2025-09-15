CREATE TABLE IF NOT EXISTS Products (
	product_id INT,
	new_price INT,
	change_date DATE,
	
	PRIMARY KEY (product_id, change_date)
);

INSERT INTO Products (product_id, new_price, change_date) VALUES (1, 20, '2019-08-14');
INSERT INTO Products (product_id, new_price, change_date) VALUES (2, 50, '2019-08-14');
INSERT INTO Products (product_id, new_price, change_date) VALUES (1, 30, '2019-08-15');
INSERT INTO Products (product_id, new_price, change_date) VALUES (1, 35, '2019-08-16');
INSERT INTO Products (product_id, new_price, change_date) VALUES (2, 65, '2019-08-17');
INSERT INTO Products (product_id, new_price, change_date) VALUES (3, 20, '2019-08-18');

SELECT DISTINCT product_id, 10 AS price FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Products WHERE change_date <= '2019-08-16')
UNION
SELECT product_id, new_price AS price FROM Products WHERE (product_id, change_date) IN
(SELECT product_id, MAX(change_date) AS latest_date FROM Products WHERE change_date <= '2019-08-16' GROUP BY product_id);

DROP TABLE IF EXISTS Products;