CREATE TABLE IF NOT EXISTS Prices(
	product_id INT,
	start_date DATE,
	end_date DATE,
	price INT,
	
	PRIMARY KEY (product_id, start_date, end_date)
);

INSERT INTO Prices (product_id, start_date, end_date, price) VALUES (1, '2019-02-17', '2019-02-28', 5);
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES (1, '2019-03-01', '2019-03-22', 20);
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES (2, '2019-02-01', '2019-02-20', 15);
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES (2, '2019-02-21', '2019-03-31', 30);

CREATE TABLE IF NOT EXISTS UnitsSold(
	product_id INT,
	purchase_date DATE,
	units INT
);

INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES (1, '2019-02-25', 100);
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES (1, '2019-03-01', 15);
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES (2, '2019-02-10', 200);
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES (2, '2019-03-22', 30);

SELECT p.product_id, IFNULL(ROUND(SUM(u.units * p.price) / SUM(u.units), 2), 0) AS average_price FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id 
AND u.purchase_date BETWEEN p.start_date AND p.end_date GROUP BY p.product_id;

DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS UnitsSold;