CREATE TABLE IF NOT EXISTS Tweets(
	tweet_id INT PRIMARY KEY,
	content VARCHAR(50)
);

INSERT INTO Tweets (tweet_id, content) VALUES (1, 'Let us Code');
INSERT INTO Tweets (tweet_id, content) VALUES (2, 'More than fifteen chars are here!');

-- SELECT tweet_id FROM Tweets WHERE CHAR_LENGTH(content) > 15;
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15;

DROP TABLE IF EXISTS Tweets;