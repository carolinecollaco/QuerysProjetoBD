DROP TABLE IF EXISTS Conhecidos;
DROP TABLE IF EXISTS Razao_de_bloqueio;
DROP TABLE IF EXISTS Razao;
DROP TABLE IF EXISTS Outras;
DROP TABLE IF EXISTS Bloqueio;
DROP TABLE IF EXISTS Curtidas;
DROP TABLE IF EXISTS Musico;
DROP TABLE IF EXISTS Artista_musical;
DROP TABLE IF EXISTS Curtidas;
DROP TABLE IF EXISTS Pessoas;

CREATE TABLE Pessoas (
	login VARCHAR (200) NOT NULL PRIMARY KEY,
	nome VARCHAR (200) NOT NULL,
	cidade VARCHAR (200) NOT NULL
);

CREATE TABLE Conhecidos (
	pessoa VARCHAR REFERENCES Pessoas,
	conhecido VARCHAR REFERENCES Pessoas	
);

CREATE TABLE Razao(
	razao VARCHAR (200) NOT NULL PRIMARY KEY
);

INSERT INTO Razao (razao) VALUES ('spammer'),('conteudo abusivo'),('motivos pessoais');

CREATE TABLE Bloqueio (
	id SERIAL NOT NULL PRIMARY KEY,
	bloqueador VARCHAR REFERENCES Pessoas,
	bloqueado VARCHAR REFERENCES Pessoas
);

CREATE TABLE Razao_de_bloqueio (
	bloqueio INT REFERENCES Bloqueio,
	razao VARCHAR REFERENCES Razao
);		

CREATE TABLE Outras(
	bloqueio INT REFERENCES Bloqueio,
	explicacao VARCHAR (200)
);

CREATE TABLE Artista_musical(
	tipo VARCHAR,
	id SERIAL NOT NULL PRIMARY KEY
);

CREATE TABLE Musico(
	artista INT REFERENCES Artista_musical
);

CREATE TABLE Curtidas(
	avaliador VARCHAR REFERENCES Pessoas,
	avaliado INT REFERENCES Artista_musical,
	nota INT
);

