CREATE TABLE users (
    user_id SERIAL,
    user_name varchar(100),
    user_lastname varchar(100),
    user_document varchar(100),
    user_email varchar(100),
    user_password varchar(100),
    PRIMARY KEY (user_id), UNIQUE (user_document)
);

INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) VALUES ('Nilso', 'Junior', '00000-1', 'nilsojunior@email.com.br', '******'); 
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) VALUES ('Francine', 'Andrade', '00000-2', 'francine.andrade@email.com.br', '******'); 

SELECT * FROM users;

CREATE TABLE users_addresses (
    addr_id SERIAL,
    user_id INTEGER REFERENCES users (user_id),
    addr_street varchar(100),
    addr_number varchar(100),
    addr_complement varchar(100),
    addr_district varchar(100),
    addr_city varchar(100),
    addr_state varchar(2),
    addr_country varchar(100),
    PRIMARY KEY (addr_id)
);

INSERT INTO users_addresses (user_id, addr_street, addr_number) VALUES (1, 'Rua Dom Alberto Gonçalves', '1213');

SELECT * FROM users_addresses;

DELETE FROM users_addresses WHERE addr_id = 9;

DELETE FROM users WHERE user_id = 1;

SELECT * FROM users;
