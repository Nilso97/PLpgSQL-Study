-- DROP TABLE users;

-- DROP TABLE users_addresses;

CREATE FUNCTION nome_funcao(param1 tipo, param2 tipo)
RETURNS TIPOS AS $$
BEGIN

END;

$$ LANGUAGE plpgsql;

DROP FUNCTION soma(integer, integer);
CREATE OR REPLACE FUNCTION soma(numero1 int, numero2 int)
RETURNS text AS $$
BEGIN
  RETURN 'A soma dos dois números é: ' || numero1 + numero2;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION user_role(user_pay double precision)
RETURNS text AS $$
BEGIN

  IF user_pay < 1800 THEN
     RETURN 'Estagiário';
  ELSEIF user_pay < 5000 THEN
     RETURN 'Auxiliar';
  ELSEIF user_pay < 10000 THEN
     RETURN 'Programador';
  ELSE
     RETURN 'Não parametrizado';
  END IF;
  
END;
$$ LANGUAGE plpgsql;

SELECT user_role(8000);

SELECT soma(1, 5);

CREATE TABLE users (
	user_id SERIAL,
	user_name varchar(255)
);

SELECT 
     user_id,
	 user_name,
	 soma(2, 10),
	 user_role(user_pay)
	 
	 FROM users;
	 
INSERT INTO users (user_name) VALUES ('John Doe');

ALTER TABLE users ADD COLUMN user_pay double precision;

SELECT * FROM users;

UPDATE users SET user_pay = 8000 WHERE user_id = 1;
