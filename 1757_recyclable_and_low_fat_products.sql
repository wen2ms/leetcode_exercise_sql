CREATE TABLE IF NOT EXISTS products (
	product_id INT PRIMARY KEY,
	low_fats ENUM('Y', 'N'),
	recyclable ENUM('Y', 'N')
);

INSERT INTO products(product_id, low_fats, recyclable) VALUES (0, 'Y', 'N');
INSERT INTO products(product_id, low_fats, recyclable) VALUES (1, 'Y', 'Y');
INSERT INTO products(product_id, low_fats, recyclable) VALUES (2, 'N', 'Y');
INSERT INTO products(product_id, low_fats, recyclable) VALUES (3, 'Y', 'Y');
INSERT INTO products(product_id, low_fats, recyclable) VALUES (4, 'N', 'N');
 
SELECT product_id FROM products WHERE low_fats = 'Y' AND recyclable = 'Y';
 
DROP TABLE IF EXISTS products;