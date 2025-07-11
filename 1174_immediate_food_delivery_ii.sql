CREATE TABLE IF NOT EXISTS Delivery(
	delivery_id INT UNIQUE,
	customer_id INT,
	order_date DATE,
	customer_pref_delivery_date DATE
);

INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES (1, 1, '2019-08-01', '2019-08-02');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) 
VALUES (2, 2, '2019-08-02', '2019-08-02');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) 
VALUES (3, 1, '2019-08-11', '2019-08-12');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES (4, 3, '2019-08-24', '2019-08-24');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES (5, 3, '2019-08-21', '2019-08-22');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES (6, 2, '2019-08-11', '2019-08-13');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES (7, 4, '2019-08-09', '2019-08-09');

SELECT ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage 
FROM Delivery WHERE (customer_id, order_date)
IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);

DROP TABLE IF EXISTS Delivery;