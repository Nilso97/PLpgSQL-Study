-- DROP TABLE users;

CREATE TABLE users (
	user_id SERIAL,
	user_name varchar(255),
	user_lastname varchar(255),
	user_document varchar(255) UNIQUE,
	user_email varchar(255),
	user_password varchar(255),
	PRIMARY KEY (user_id)
);

SELECT * FROM users;

DELETE FROM users WHERE user_id = 5;


-- BEGIN;
-- COMMIT; 
-- ROLLBACK;

CREATE OR REPLACE FUNCTION user_add(user_name text, user_lastname text, user_document text, user_email text, user_password text)
RETURNS text AS $$
BEGIN
  INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) VALUES (user_name, user_lastname, user_document, user_email, user_password);
  RETURN 'Usuário cadastrado com sucesso!';
END;
$$ LANGUAGE plpgsql;

INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) VALUES (
	'John', 'Doe', '00000-1', 'joh.doe@email.com.br', '******'
);

SELECT * FROM users;

BEGIN;
SELECT user_add('John', 'Doe', '00000-3', 'john.doe@email.com.br', '******');
ROLLBACK;

BEGIN;
SELECT user_add('Julia', 'Watson', '00000-2', 'julia.watson@email.com.br', '******');
COMMIT;