DROP TABLE users;
CREATE TABLE users (
    user_id SERIAL,
    user_name varchar(100),
    user_lastname varchar(100),
    user_document varchar(100),
    user_email varchar(100),
    user_password varchar(100),
    PRIMARY KEY (user_id), UNIQUE (user_document)
);

INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) 
      VALUES ('John', 'Doe', '00000-1', 'john.doe@email.com.br', '******'); 
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) 
      VALUES ('Karen', 'Fischer', '00000-2', 'karen.fischer@email.com.br', '******');
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) 
      VALUES ('Michael', 'Watson', '00000-3', 'michael.watson@email.com.br', '******'); 
INSERT INTO users (user_name, user_lastname, user_document, user_email, user_password) 
      VALUES ('Joanah', 'Silver', '00000-4', 'joanah.silver@email.com.br', '******'); 

SELECT * FROM users;


DROP TABLE users_addresses;
CREATE TABLE users_addresses (
    addr_id SERIAL,
    user_id INTEGER REFERENCES users (user_id) ON DELETE CASCADE,
    addr_street varchar(100),
    addr_number varchar(100),
    addr_complement varchar(100),
    addr_district varchar(100),
    addr_city varchar(100),
    addr_state varchar(2),
    addr_country varchar(100),
    PRIMARY KEY (addr_id)
);

INSERT INTO users_addresses (user_id, addr_street, addr_number, addr_complement, addr_district, addr_city, addr_state, addr_country) 
      VALUES (1, 'Rua Dom Alberto Gonçalves', '1213', 'Apt.', '', 'Palmeira', 'PR', 'Brasil');
INSERT INTO users_addresses (user_id, addr_street, addr_number, addr_complement, addr_district, addr_city, addr_state, addr_country) 
      VALUES (2, 'Rua Dom Alberto Gonçalves', '1214', 'Casa.', '', 'Palmeira', 'PR', 'Brasil');

SELECT * FROM users_addresses;

DELETE FROM users_addresses WHERE addr_id = 1;

DELETE FROM users WHERE user_id = 1;

