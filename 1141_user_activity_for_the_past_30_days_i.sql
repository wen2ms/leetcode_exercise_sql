CREATE TABLE IF NOT EXISTS Activity(
	user_id INT,
	session_id INT,
	activity_date DATE,
	activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message')
);

INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (1, 1, '2019-07-20', 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (1, 1, '2019-07-20', 'scroll_down');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (1, 1, '2019-07-20', 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (2, 4, '2019-07-20', 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (2, 4, '2019-07-21', 'send_message');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (2, 4, '2019-07-21', 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (3, 2, '2019-07-21', 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (3, 2, '2019-07-21', 'send_message');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (3, 2, '2019-07-21', 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (4, 3, '2019-06-25', 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES (4, 3, '2019-06-25', 'end_session');

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users FROM Activity
WHERE activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY) AND activity_date <= '2019-07-27' GROUP BY activity_date;

DROP TABLE IF EXISTS Activity;