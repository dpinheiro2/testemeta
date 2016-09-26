DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
  id bigint PRIMARY KEY,
  descricao varchar(255) NOT NULL
);

DROP TABLE IF EXISTS habitats;

CREATE TABLE habitats (
  id bigint PRIMARY KEY,
  descricao varchar(255) NOT NULL
);

DROP TABLE IF EXISTS ordens;

CREATE TABLE ordens (
  id bigint PRIMARY KEY,
  descricao varchar(255) NOT NULL,
  idClasse bigint NOT NULL
);

DROP TABLE IF EXISTS animais;

CREATE TABLE animais (
  id bigint PRIMARY KEY,
  nome varchar(255) NOT NULL,
  nomeCientifico varchar(255) NOT NULL,
  idHabitat bigint DEFAULT NULL,
  indAmeacado char(1) NOT NULL,
  idOrdem bigint NOT NULL
);