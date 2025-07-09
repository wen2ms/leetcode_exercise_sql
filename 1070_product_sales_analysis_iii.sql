CREATE TABLE IF NOT EXISTS Product(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(10)
);

INSERT INTO Product (product_id, product_name) VALUES (100, 'Nokia');
INSERT INTO Product (product_id, product_name) VALUES (200, 'Apple');

CREATE TABLE IF NOT EXISTS Sales(
	sale_id INT,
	product_id INT,
	year INT,
	quantity INT,
	price INT,
	
	PRIMARY KEY (sale_id, product_id),
	CONSTRAINT foreign_key_product_id FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES (1, 100, 2008, 10, 5000);
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES (2, 100, 2009, 12, 5000);
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES (7, 200, 2011, 15, 9000);

SELECT product_id, year AS first_year, quantity, price FROM Sales WHERE (product_id, year)
IN (SELECT product_id, MIN(year) from Sales GROUP BY product_id);

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;