-- DROP TABLE users;
CREATE TABLE users (
	user_id SERIAL,
	user_name varchar(100),
	user_last_name varchar(100),
	user_document varchar(100) UNIQUE,
	user_email varchar(100),
	user_password varchar(100),
	PRIMARY KEY (user_id)
);

INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('John', 'Doe', '00000-1', 'john.doe@email.com.br', '******');
INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('Karen', 'Waltz', '00000-2', 'karen.waltz@email.com.br', '******');
INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('Victoria', 'Dullman', '00000-3', 'victoria.dullman@email.com.br', '******');
INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('Michael', 'Jhonson', '00000-4', 'michael.jhonson@email.com.br', '******');
INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('Luis', 'Palmer', '00000-5', 'luis.palmer@email.com.br', '******');
INSERT INTO users (user_name, user_last_name, user_document, user_email, user_password)
       VALUES ('Sabrina', 'Schultz', '00000-6', 'sabrina.schultz@email.com.br', '******');

SELECT * FROM users;



-- DROP TABLE followups;
CREATE TABLE followups (
	followup_id SERIAL,
	user_id integer REFERENCES users (user_id),
	PRIMARY KEY (followup_id)
);

INSERT INTO followups (user_id) VALUES (1);
INSERT INTO followups (user_id) VALUES (1);
INSERT INTO followups (user_id) VALUES (1);

INSERT INTO followups (user_id) VALUES (2);
INSERT INTO followups (user_id) VALUES (2);

INSERT INTO followups (user_id) VALUES (4);
INSERT INTO followups (user_id) VALUES (4);
INSERT INTO followups (user_id) VALUES (4);
INSERT INTO followups (user_id) VALUES (4);
INSERT INTO followups (user_id) VALUES (4);
INSERT INTO followups (user_id) VALUES (4);

SELECT
    u.user_id,
	u.user_name,
	u.user_last_name,
	u.user_document,
	u.user_email,
	u.user_password,
	COUNT(f.followup_id)
	
	FROM followups f
	JOIN users u ON u.user_id = f.user_id
	GROUP BY u.user_id
	ORDER BY u.user_id


-- Function
-- DROP FUNCTION report_users_followups();
CREATE OR REPLACE FUNCTION report_users_followups() 
RETURNS TABLE(user_id integer, user_name character varying(100), user_last_name character varying(100), user_document character varying(100), user_email character varying(100), user_password character varying(100), totalizador bigint) AS $$
BEGIN

 DROP TABLE IF EXISTS _tmp_report_users_followups;
 CREATE TEMPORARY TABLE _tmp_report_users_followups AS SELECT f.user_id, COUNT(f.followup_id) AS totalizador FROM followups f GROUP BY f.user_id;
 RETURN QUERY SELECT 
                  u.user_id,
				  u.user_name,
				  u.user_last_name,
				  u.user_document,
				  u.user_email,
				  u.user_password,
				  tmp.totalizador
				  
				  FROM users u
				  JOIN _tmp_report_users_followups tmp ON tmp.user_id = u.user_id
				  ORDER BY u.user_id;
 
END;
$$ LANGUAGE plpgsql;

SELECT * FROM report_users_followups();
SELECT * FROM _tmp_report_users_followups;