CREATE DATABASE restaurantdb;

CREATE TABLE meniu(
	idMeniu INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	numeCategorie VARCHAR(50),
	caleImagineCategorie VARCHAR(100)
);

CREATE TABLE detaliiMeniu(
	idMeniu INT,
	idProdus INT
);
CREATE TABLE produse(
    idProdus INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	numeProdus VARCHAR(50),
	pret DECIMAL(8,2),
	gramaj DECIMAL(8,2),
	ingrediente VARCHAR(300),
	caleImagineProdus VARCHAR(100)
);

ALTER TABLE detaliiMeniu
ADD CONSTRAINT FK_Id_Categorie
FOREIGN KEY (idMeniu) REFERENCES meniu(idMeniu);

ALTER TABLE detaliiMeniu
ADD CONSTRAINT FK_Id_Produs
FOREIGN KEY (idProdus) REFERENCES produse(idProdus);

CREATE TABLE cont(
	idCont INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nume VARCHAR(50),
	prenume VARCHAR(50),
	username VARCHAR(50),
	password VARCHAR(50)
);