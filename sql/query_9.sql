-- DROP TABLE users;
CREATE TABLE users (
	user_id SERIAL,
	user_name varchar(100),
	user_lastname varchar(100),
	user_document varchar(100) UNIQUE,
	user_email varchar(100),
	user_password varchar(100),
	PRIMARY KEY (user_id)
);

INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) 
	VALUES ('John', 'Doe', '00000-1', 'john.doe@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password)
	VALUES ('Karen', 'Waltz', '00000-2', 'karen.waltz@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password)
 	VALUES ('Victoria', 'Dullman', '00000-3', 'victoria.dullman@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password)
   	VALUES ('Michael', 'Jhonson', '00000-4', 'michael.jhonson@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password)
  	VALUES ('Luis', 'Palmer', '00000-5', 'luis.palmer@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password)
	VALUES ('Sabrina', 'Schultz', '00000-6', 'sabrina.schultz@email.com.br', '******');
	
SELECT * FROM users;
-- DELETE FROM users WHERE user_id = 1;

-- DROP FUNCTION list_users();
CREATE OR REPLACE FUNCTION list_users()
RETURNS text AS $$
DECLARE 
	u_name 	character varying(100);
	sum_pkey  	bigint;
	
	users_rec 	RECORD;
BEGIN
  	u_name = 'admin';
	sum_pkey = 0;
	
	-- EXECUTE 'SELECT * FROM users' INTO users_rec;
	
	-- RAISE NOTICE 'Nome do usuário: % %', users_rec.user_name;
	
	FOR users_rec IN SELECT * FROM users LOOP
		RAISE NOTICE 'Nome do usuário: %', users_rec.user_name;
		
		sum_pkey = sum_pkey + users_rec.user_id;
	END LOOP;
	
	RAISE NOTICE 'A soma dos IDs é: %', sum_pkey;
	
  	RETURN 'Olá ' || u_name || ', seja bem-vindo!';
END;
$$ LANGUAGE plpgsql;

SELECT list_users();