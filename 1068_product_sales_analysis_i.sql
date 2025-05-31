CREATE TABLE IF NOT EXISTS Product(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(10)
);

INSERT INTO Product VALUES (100, 'Nokia');
INSERT INTO Product VALUES (200, 'Apple');
INSERT INTO Product VALUES (300, 'Samsung');

CREATE TABLE IF NOT EXISTS Sales(
	sale_id INT, 
	product_id INT,
	year INT,
	quantity INT,
	price INT,
	
	PRIMARY KEY (sale_id, year),
	CONSTRAINT foreign_key_product_id FOREIGN KEY (product_id) REFERENCES Product(product_id) 
);

INSERT INTO Sales VALUES (1, 100, 2008, 10, 5000);
INSERT INTO Sales VALUES (2, 100, 2009, 12, 5000);
INSERT INTO Sales VALUES (7, 200, 2011, 15, 9000);

SELECT Product.product_name, Sales.year, Sales.price FROM Sales JOIN Product ON Sales.product_id = Product.product_id;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;
