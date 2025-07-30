CREATE TABLE IF NOT EXISTS Product(
	product_key INT PRIMARY KEY
);

INSERT INTO Product (product_key) VALUES (5);
INSERT INTO Product (product_key) VALUES (6);

CREATE TABLE IF NOT EXISTS Customer(
	customer_id INT NOT NULL,
	product_key INT,
	
	CONSTRAINT foreign_key_product_key FOREIGN KEY (product_key) REFERENCES Product(product_key)
);

INSERT INTO Customer (customer_id, product_key) VALUES (1, 5);
INSERT INTO Customer (customer_id, product_key) VALUES (2, 6);
INSERT INTO Customer (customer_id, product_key) VALUES (3, 5);
INSERT INTO Customer (customer_id, product_key) VALUES (3, 6);
INSERT INTO Customer (customer_id, product_key) VALUES (1, 6);

SELECT customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product);

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;