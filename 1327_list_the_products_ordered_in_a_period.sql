CREATE TABLE IF NOT EXISTS Products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(40),
	product_category VARCHAR(20)
);

INSERT INTO Products (product_id, product_name, product_category) VALUES (1, 'Leetcode Solutions', 'Book');
INSERT INTO Products (product_id, product_name, product_category) VALUES (2, 'Jewels of Stringology', 'Book');
INSERT INTO Products (product_id, product_name, product_category) VALUES (3, 'HP', 'Laptop');
INSERT INTO Products (product_id, product_name, product_category) VALUES (4, 'Lenovo', 'Laptop');
INSERT INTO Products (product_id, product_name, product_category) VALUES (5, 'Leetcode Kit', 'T-shirt');

CREATE TABLE IF NOT EXISTS Orders(
	product_id INT,
	order_date DATE,
	unit INT,
	
	CONSTRAINT foreign_key_product_id FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Orders (product_id, order_date, unit) VALUES (1, '2020-02-05', 60);
INSERT INTO Orders (product_id, order_date, unit) VALUES (1, '2020-02-10', 70);
INSERT INTO Orders (product_id, order_date, unit) VALUES (2, '2020-01-18', 30);
INSERT INTO Orders (product_id, order_date, unit) VALUES (2, '2020-02-11', 80);
INSERT INTO Orders (product_id, order_date, unit) VALUES (3, '2020-02-17', 2);
INSERT INTO Orders (product_id, order_date, unit) VALUES (3, '2020-02-24', 3);
INSERT INTO Orders (product_id, order_date, unit) VALUES (4, '2020-03-01', 20);
INSERT INTO Orders (product_id, order_date, unit) VALUES (4, '2020-03-04', 30);
INSERT INTO Orders (product_id, order_date, unit) VALUES (4, '2020-03-04', 60);
INSERT INTO Orders (product_id, order_date, unit) VALUES (5, '2020-02-25', 50);
INSERT INTO Orders (product_id, order_date, unit) VALUES (5, '2020-02-27', 50);
INSERT INTO Orders (product_id, order_date, unit) VALUES (5, '2020-03-01', 50);

SELECT prod.product_name AS product_name, SUM(ord.unit) AS unit 
FROM Products prod JOIN Orders ord ON prod.product_id = ord.product_id 
WHERE YEAR(ord.order_date) = 2020 AND MONTH(ord.order_date) = 2
GROUP BY prod.product_id HAVING SUM(ord.unit) >= 100;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;