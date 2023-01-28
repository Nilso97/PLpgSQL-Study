-- Database: "INNER JOIN vs LEFT JOIN"

-- DROP DATABASE "INNER JOIN vs LEFT JOIN";

CREATE DATABASE "INNER JOIN vs LEFT JOIN"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;

CREATE TABLE palco (
  palco_id       INTEGER     NOT NULL,
  nome           VARCHAR(50) NOT NULL,
  PRIMARY KEY(palco_id)
);

CREATE TABLE genero (
  genero_id       INTEGER     NOT NULL,
  nome            VARCHAR(50) NOT NULL,
  PRIMARY KEY(genero_id)
);

CREATE TABLE artista (
  artista_id      INTEGER      NOT NULL,
  nome            VARCHAR(100) NOT NULL,
  genero_id       INTEGER,
  dt_apresentacao DATE,
  palco_id        INTEGER,	
  PRIMARY KEY(artista_id),
  FOREIGN KEY(genero_id) REFERENCES genero,
  FOREIGN KEY(palco_id) REFERENCES palco
);

INSERT INTO palco VALUES(1, 'Palco Mundo');
INSERT INTO palco VALUES(2, 'Palco Sunset');
INSERT INTO palco VALUES(3, 'New Dance Order');

INSERT INTO genero VALUES(1, 'Pop');
INSERT INTO genero VALUES(2, 'Rock');
INSERT INTO genero VALUES(3, 'Heavy Metal');
INSERT INTO genero VALUES(4, 'Mpb');
INSERT INTO genero VALUES(5, 'Rap');
INSERT INTO genero VALUES(6, 'Eletrônica');

INSERT INTO artista VALUES(1, 'Iron Maiden', 3, '2022-09-02', 1);
INSERT INTO artista VALUES(2, 'Post Malone', 5, '2022-09-03', 1);
INSERT INTO artista VALUES(3, 'Alok', 6, '2022-09-03', 1);
INSERT INTO artista VALUES(4, 'Justin Bieber', 1, '2022-09-04', 1);
INSERT INTO artista VALUES(5, 'Duda Beat', 1, '2022-09-08', 2);
INSERT INTO artista VALUES(6, 'Gloria Groove', 1, '2022-09-08', 2);
INSERT INTO artista VALUES(7, 'Coldplay', 1, '2022-09-10', 1);
INSERT INTO artista VALUES(8, 'Camila Cabello', 1, '2022-09-10', 1);
INSERT INTO artista VALUES(9, 'Dua Lipa', 1, '2022-09-11', 1);
INSERT INTO artista VALUES(10, 'Ivete Sangalo', 1, '2022-09-11', 1);
INSERT INTO artista VALUES(11, 'Ludmilla', 1, '2022-09-11', 2);

INSERT INTO artista VALUES(12, 'Beyoncé', 1);
INSERT INTO artista VALUES(13, 'Jay-Z', 5);
INSERT INTO artista VALUES(14, 'Lady Gaga', 1);
INSERT INTO artista VALUES(15, 'Bruno Mars', 1);
INSERT INTO artista VALUES(16, 'Demi Lovato', 1, '2022-09-04', 1);
INSERT INTO artista VALUES(17, 'Iza', 1, '2022-09-04', 1);
INSERT INTO artista VALUES(18, 'Jason Derulo', 1, '2022-09-04', 1);

-- A: Listar o nome das atrações com data de apresentação e palco definido.
SELECT a.nome, g.nome, a.dt_apresentacao, p.nome  
  FROM artista a
  INNER JOIN palco p ON p.palco_id = a.palco_id
  INNER JOIN genero g ON g.genero_id = a.genero_id;

-- A1: Listar as atrações que vão se apresentar entre os dias 04 e 11 no palco mundo
SELECT a.nome, g.nome, a.dt_apresentacao, p.nome 
  FROM artista a 
  INNER JOIN palco p ON p.palco_id = a.palco_id
  INNER JOIN genero g ON g.genero_id = a.genero_id
  WHERE a.dt_apresentacao BETWEEN '2022-09-04' AND '2022-09-11' AND p.nome LIKE '%Mundo'
  ORDER BY a.dt_apresentacao ASC;

-- B: Listar todas as atrações, independependente de haver data e palco definidos
SELECT a.nome, g.nome, a.dt_apresentacao, p.nome
  FROM artista a
  LEFT JOIN palco p ON p.palco_id = a.palco_id
  INNER JOIN genero g ON g.genero_id = a.genero_id;