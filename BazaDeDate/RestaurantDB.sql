CREATE DATABASE restaurantdb;

CREATE TABLE meniu(
	idMeniu INT NOT NULL AUTO_INCREMENT,
	numeCategorie VARCHAR(50) UNIQUE,
	caleImagineCategorie VARCHAR(100),
    PRIMARY KEY(idMeniu),
    UNIQUE(numeCategorie)
);

CREATE TABLE detaliiMeniu(
	idMeniu INT,
	idProdus INT
);
CREATE TABLE produse(
    idProdus INT NOT NULL AUTO_INCREMENT,
	numeProdus VARCHAR(50),
	pret FLOAT,
	gramaj FLOAT,
	ingrediente VARCHAR(300),
	caleImagineProdus VARCHAR(100),
	PRIMARY KEY(idProdus),
	UNIQUE(numeProdus)
);

ALTER TABLE detaliiMeniu
ADD CONSTRAINT FK_Id_Categorie
FOREIGN KEY (idMeniu) REFERENCES meniu(idMeniu);

ALTER TABLE detaliiMeniu
ADD CONSTRAINT FK_Id_Produs
FOREIGN KEY (idProdus) REFERENCES produse(idProdus);

CREATE TABLE cont(
	idCont INT NOT NULL AUTO_INCREMENT,
	nume VARCHAR(50) UNIQUE,
	prenume VARCHAR(50),
	username VARCHAR(50),
	password VARCHAR(50),
    PRIMARY KEY(idCont),
    UNIQUE(username)
);

INSERT INTO cont (`nume`,`prenume`,`username`,`password`) VALUES ('Zachary','Soler','zach_s',MD5('TehnologiiWeb'));