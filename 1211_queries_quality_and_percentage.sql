CREATE TABLE IF NOT EXISTS Queries(
	query_name VARCHAR(50),
	result VARCHAR(20),
	position INT,
	rating INT
);

INSERT INTO Queries(query_name, result, position, rating) VALUES ('Dog', 'Golden Retriever', 1, 5);
INSERT INTO Queries(query_name, result, position, rating) VALUES ('Dog', 'German Shepherd', 2, 5);
INSERT INTO Queries(query_name, result, position, rating) VALUES ('Dog', 'Mule', 200, 1);
INSERT INTO Queries(query_name, result, position, rating) VALUES ('Cat', 'Shirazi', 5, 2);
INSERT INTO Queries(query_name, result, position, rating) VALUES ('Cat', 'Siamese', 3, 3);
INSERT INTO Queries(query_name, result, position, rating) VALUES ('Cat', 'Sphynx', 7, 4);

SELECT query_name, ROUND(AVG(rating/ position), 2) AS quality,
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(query_name), 2) AS poor_query_percentage 
FROM Queries GROUP BY query_name;

DROP TABLE IF EXISTS Queries;