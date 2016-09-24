DROP TABLE IF EXISTS Pessoas;
DROP TABLE IF EXISTS Conhecidos;
DROP TABLE IF EXISTS Artista_musical;

CREATE TABLE Pessoas (
	login VARCHAR (200) NOT NULL PRIMARY KEY
);

CREATE TABLE Conhecidos (
	pessoa VARCHAR REFERENCES Pessoas,
	conhecido VARCHAR REFERENCES Pessoas	
);

CREATE TABLE Razao(
	razao VARCHAR (200) NOT NULL PRIMARY KEY
);

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

