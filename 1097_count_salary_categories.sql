CREATE TABLE IF NOT EXISTS Accounts (
	account_id INT PRIMARY KEY,
	income INT
);

INSERT INTO Accounts (account_id, income) VALUES (3, 108939);
INSERT INTO Accounts (account_id, income) VALUES (2, 12747);
INSERT INTO Accounts (account_id, income) VALUES (8, 87709);
INSERT INTO Accounts (account_id, income) VALUES (6, 91796);

SELECT 'Low Salary' AS category, SUM(income < 20000) AS accounts_count FROM Accounts
UNION
SELECT 'Average Salary' AS category, SUM(income BETWEEN 20000 AND 50000) AS accounts_count FROM Accounts
UNION
SELECT 'High Salary' AS category, SUM(income > 50000) AS accounts_count FROM Accounts;

DROP TABLE IF EXISTS Accounts;