CREATE TABLE IF NOT EXISTS RequestAccepted(
	requester_id INT,
	accepter_id INT,
	accept_date DATE,
	
	PRIMARY KEY (requester_id, accepter_id)
);

INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES (1, 2, '2016/06/03');
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES (1, 3, '2016/06/08');
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES (2, 3, '2016/06/08');
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016/06/09');

WITH base AS (SELECT requester_id id FROM RequestAccepted
UNION ALL
SELECT accepter_id id FROM RequestAccepted)
SELECT id, COUNT(id) num FROM base GROUP BY id ORDER BY num DESC LIMIT 1;

DROP TABLE IF EXISTS RequestAccepted;