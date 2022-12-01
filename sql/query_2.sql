/* https://www.postgresql.org/docs/current/sql-createsequence.html */
CREATE SEQUENCE IF NOT EXISTS teste_seq
    INCREMENT 1
    MINVALUE 1 
	MAXVALUE 99999999999999
    START 1 
	CACHE 1;
	

CREATE TABLE teste (
	teste_id integer DEFAULT nextval('teste_seq'),
	name varchar(255)
);

INSERT INTO teste (name) VALUES ('Carlos Brown');

SELECT * FROM teste;

CREATE TABLE teste_2 (
	teste_id SERIAL,
	name varchar(255)
);

INSERT INTO teste_2 (name) VALUES ('John Doe');

SELECT * FROM teste_2;