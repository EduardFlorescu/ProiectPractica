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

ALTER DATABASE restaurantdb CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE cont CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE detaliimeniu CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE meniu CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE produse CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;

INSERT INTO `cont` (`nume`,`prenume`,`username`,`password`) VALUES ('Zachary','Soler','zach_s',MD5('TehnologiiWeb'));

INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('1','SUPA','../Imagini/supa.jpg');
INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('1','SUPA CU GALUSTE','9.50','300','gris, ou, morcov, verdeata, ulei, Delikat','../Imagini/supa-cu-galuste.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('2','CREMA DE ROSII','11.50','300','rosii in bulion, usturoi, ardei gras, ceapa','../Imagini/crema-de-rosii.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('3','CREMA DE LEGUME','11.50','300','legume, lapte, unt','../Imagini/crema-de-legume.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('4','CIORBA DE PUI A LA GREC','11.50','300','pui','../Imagini/ciorba-de-pui-a-la-grec.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('5','CIORBA DE LEGUME','9.50','300','cartofi, morcov, telina, ceapa, ardei gras, fasole verde, mazare, rosii in bulion','../Imagini/ciorba-de-legume.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('6','CIORBA DE FASOLE CU COSTITA','11','300','fasole uscata, legume, costita','../Imagini/ciorba-de-fasole-cu-costita.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('7','CIORBA DE VACUTA','12','300','vita fiarta, legume','../Imagini/ciorba-de-vacuta.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('8','CIORBA DE BURTA','12','300','burta, smantana, oua, otet, morcov, ulei','../Imagini/ciorba-de-burta.jpg');
 
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','1');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','2');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','3');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','4');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','5');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','6');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','7');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('1','8');

INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('2','APERITIVE','../Imagini/aperitive.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('9','ZACUSCA','12.50','200','legume','../Imagini/aperitive-zacusca.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('10','PLATOU DE BRANZETURI','36.00','450','gorgonzola, feta, mozzarella, telemea, nuca, mar','../Imagini/aperitive-platou-de-branzeturi.jpg');
INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('11','OMLETA TARANEASCA','9.50','200','oua, costita, ardei gras, ceapa, rosii','../Imagini/aperitive-omleta-taraneasca.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('12','OMLETA ASORTATA','9.50','200','oua, sunca, cascaval, carnaciori, ciuperci','../Imagini/aperitive-omleta-asortata.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('13','OCHIURI SIMPLE (3 buc)','8.00','180','oua, sare, ulei','../Imagini/aperitive-ochiuri-simple.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('14','OCHIURI CU SUNCA','9.50','200','oua, sunca','../Imagini/aperitive-ochiuri-cu-sunca.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('15','MAMALIGA CU BRANZA SI SMANTANA','13.50','450','malai, branza de vaci, smantana, branza telemea','../Imagini/aperitive-mamaliga-cu-branza-si-smantana.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('16','GUSTARE RECE','35.00','450','rosii, brana telemea, sunca, cascaval, salam banatean, masline','../Imagini/aperitive-gustare-rece.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('17','GUSTARE CALDA','35.00','400','ficat de pui, cascaval, carnaciori, ciuperci','../Imagini/aperitive-gustare-calda.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('18','FICATEI LA TIGAIE CU SUNCA SI CIUPERCI','17.00','300','ficat de pui, sunca, ciuperci','../Imagini/aperitive-ficatei-la-tigaie-cu-sunca-si-ciuperci.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('19','CASCAVAL PANE','15.00','200','cascaval, ou, pesmet, ulei','../Imagini/aperitive-cascaval-pane.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('20','CARNACIORI OLTENESTI CABANOS','13.00','200','carnaciori, ulei','../Imagini/aperitive-carnaciori-oltenesti-cabanos.jpg');

INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','9');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','10');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','11');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','12');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','13');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','14');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','15');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','16');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','17');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','18');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','19');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('2','20');


 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('3','PASTE','../Imagini/paste.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('21','SPAGHETE QUATTRO FORMAGGI','22.50','250','spaghete, smantana, gorgonzola, parmezan, mozzarella, cascaval, unt','../Imagini/spaghete-quttroformaggi.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('22','SPAGHETE NAPOLETANE','20.50','250','spaghete, rosii decojite, parmezan, oregano','../Imagini/spaghete-napoletane.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('23','SPAGHETE MILANEZE CU PARMEZAN','20.50','250','spaghete, rosii decojite, ciuperci, sunca, parmezan, oregano','../Imagini/spaghete-milaneze.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('24','SPAGHETE CARBONARA','20.50','250','spaghete, costita, ou, smantana, parmezan, vin alb','../Imagini/spaghete-carbonara.jpg');
 
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('3','21');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('3','22');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('3','23');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('3','24');


 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('4','GARNITURI','../Imagini/garnituri.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('25','VARZA CALITA','10.00','200','varza, ulei','../Imagini/garnituri-varza-calita.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('26','OREZ SARBESC','10.00','300','orez, legume','../Imagini/garnituri-orez-sarbesc.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('27','LEGUME LA CUPTOR','14.00','300','dovlecel, morcov, ceapa, ardei, usturoi, masline, vin alb, rosii','../Imagini/garnituri-legume-la-cuptor.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('28','FASOLE BATUTA','9.00','200','fasole alba, legume, ulei','../Imagini/garnituri-fasole-batuta.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('29','CIUPERCI SOTE','15.00','300','ciuperci, unt','../Imagini/garnituri-ciuperci-sote.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('30','CARTOFI LA CUPTOR','11.50','300','cartofi, branza de vaci','../Imagini/garnituri-cartofi-la-cuptor.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('31','PIURE DE CARTOFI','7.50','300','cartofi, unt','../Imagini/garnituri-piure-cartofi.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('32','CARTOFI PRAJITI','7.50','200','cartofi, ulei','../Imagini/garnituri-cartofi-prajiti.jpg');

INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','25');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','26');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','27');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','28');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','29');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','30');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','31');
INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('4','32');
  

  INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('5','SALATE','../Imagini/salate.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('33','SALATA VERDE CU LAMAIE','10.00','200','salata verde, ulei de masline, lamaie','../Imagini/salata-verde-cu-lamaie.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('34','SALATA DE VARZA ALBA','8.00','200','varza, ulei, otet','../Imagini/salata-de-varza-alba.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('35','SALATA DE GOGOSARI','8.00','200','gogosari, ulei, otet','../Imagini/salata-de-gogosari.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('36','SALATA ASORTATA','8.00','200','rosii, castraveti, ardei, ceapa','../Imagini/salata-asortata.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('37','SALATA DE ROSII CU BRANZA','11.00','200','rosii, telemea','../Imagini/salata-rosii-cu-branza.jpg');

  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('5','33');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('5','34');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('5','35');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('5','36');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('5','37');

 
 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('6','PREPARATE DIN LEGUME','../Imagini/legume.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('38','VARZA CU OREZ LA CUPTOR','15.50','200','varza, orez, rosii decojite','../Imagini/preparate-din-legume-varza-cu-orez-la-cuptor.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('39','TOCANITA DE CIUPERCI CU MAMALIGUTA','16.00','200','ciuperci, ceapa, ardei gras, rosii decojite','../Imagini/preparate-din-legume-tocanita-de-ciuperci-cu-mamaliguta.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('40','OREZ CU CIUPERCI','13.50','200','ciuperci, orez, morcovi, ceapa','../Imagini/preparate-din-legume-orez-cu-cuperci.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('41','CIULAMA DE CIUPERCI CU MAMALIGUTA','16.00','200','ciuperci, faina, lapte, unt, malai','../Imagini/preparate-din-legume-ciulama-de-ciuperci-cu-mamaliguta.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('42','CARTOFI PARIZIENI GRATINATI','12.00','200','cartofi, ou, smantana, cascaval','../Imagini/preparate-din-legume-cartofi-parizieni-gratinati.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('43','CARTOFI CU SMANTANA','11.50','200','cartofi, ceapa, smantana','../Imagini/preparate-din-legume-cartofi-cu-smantana.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('44','CIUPERCI CU SMANTANA','18.00','200','ciuperci, smantana, unt, faina, lapte','../Imagini/preparate-din-legume-ciuperci-cu-smantana.jpg');
  
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','38');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','39');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','40');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','41');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','42');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','43');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('6','44');


  INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('7','PREPARATE DIN PESTE','../Imagini/peste.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('45','SARAMURA DE PASTRAV CU MAMALIGA SI ARDEI IUTE','30.50','450','pastrav, ardei, ceapa, usturoi, ardei iute','../Imagini/saramura-de-pastrav-cu-mamaliga-si-ardei-iute.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('46','SARAMURA DE CRAP CU MAMALIGA SI ARDEI IUTE','32.50','450','crap, rosii, ardei, ceapa, usturoi, ardei iute','../Imagini/saramura-de-crap-cu-mamaliga-si-ardei-iute.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('47','PASTRAV LA GRATAR','26.00','350','pastrav','../Imagini/pastrav-la-gratar.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('48','SALAU PARIZIAN CU SOS DE CAPERE SI CARTOFI NATUR','33.00','250','salau, ou, unt, capere, cartofi','../Imagini/salau-parizian-cu-sos-de-capere-si-cartofi-natur.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('49','CRAP PRAJIT','29.00','350','crap','../Imagini/crap-prajit.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('50','CRAP LA GRATAR','29.00','350','crap','../Imagini/crap-la-gratar.jpg');
  
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','45');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','46');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','47');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','48');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','49');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('7','50');


  INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('8','PREPARATE DIN PORC','../Imagini/porc.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('51','TOCHITURA MOLDOVENEASCA','25.00','500','ficat de porc, carnaciori, file de porc, muschi de vita, vin, oua','../Imagini/preparate-din-porc-tochitura-moldoveneasca-2.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('52','TOCANITA DIN FICAT DE PORC','24.00','250','ficat de porc, ceapa, cartofi, usturoi, boia','../Imagini/preparate-din-porc-tocanita-din-ficat-de-porc.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('53','TOCANITA DE PORC CU MAMALIGUTA','21.00','250','ceapa, ceafa de porc, malai, usturoi','../Imagini/preparate-din-porc-tocanita-de-porc-cu-mamaliguta.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('54','SARMALUTE IN FOI DE VARZA CU MAMALIGA SI ARDEI','19.00','250','carne tocata, ceapa, costita, varza, orez, ardei iute','../Imagini/preparate-din-porc-sarmalute-in-foi-de-varza-cu-mamaliga-si-ardei.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('55','POMANA PORCULUI CU MAMALIGUTA','28.00','300','file de porc, carnaciori, malai, usturoi','../Imagini/preparate-din-porc-pomana-porcului-cu-mamaliguta.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('56','SNITEL DE PORC','20.00','250','file de porc, oua, pesmet','../Imagini/preparate-din-porc-snitel-porc.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('57','CHIFTELUTE DE PORC','17.00','200','carne tocata, verdeata, ou, faina, usturoi, ulei','../Imagini/preparate-din-porc-chiftelute-de-porc.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('58','CIOLAN CU FASOLE','22.00','400','ciolan, fasole, usturoi, ceapa','../Imagini/preparate-din-porc-ciolan-cu-fasole.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('59','CARNATI CU VARZA','19.00','250','varza, carnati, bulion, ulei','../Imagini/preparate-din-porc-carnatii-cu-varza.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('60','COSTITA CU FASOLE','19.00','250','costita, fasole, usturoi, ceapa','../Imagini/preparate-din-porc-costita-cu-fasole.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('61','COSTITA CU VARZA','19.00','250','varza, ceapa, costita','../Imagini/preparate-din-porc-costita-cu-varza.jpg');

  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','51');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','52');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','53');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','54');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','55');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','56');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','57');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','58');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','59');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','60');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('8','61');

  
  INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('9','PREPARATE DIN PUI','../Imagini/pui.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('62','PUI SHANGHAI','19.00','250','piept de pui, oua, faina, usturoi','../Imagini/preparate-din-pui-pui-shanghai.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('63','PUI CU SMANTANA SI CARTOFI NATUR','24.00','500','piept de pui, smantana, cartofi','../Imagini/preparate-din-pui-pui-cu-smantana-si-cartofi-natur.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('64','CIULAMA DE PUI CU CIUPERCI SI MAMALIGUTA','21.00','350','ciuperci, faina, malai, piept de pui','../Imagini/preparate-din-pui-ciulama-de-pui-cu-ciuperci-si-mamaliguta.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('65','ARIPIOARE CROCANTE CU MUJDEI','21.00','350','aripioare, usturoi','../Imagini/preparate-din-pui-aripioare-crocante-cu-mujdei.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('66','SNITEL DIN PIEPT DE PUI','19.00','250','piept de pui, faina, oua','../Imagini/preparate-din-pui-snitel-piept-pui.jpg');

  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('9','62');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('9','63');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('9','64');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('9','65');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('9','66');
  
  INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('10','PREPARATE DIN VITA','../Imagini/vita.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('67','SNITEL VIENEZ','31.00','200','muschi de vita, pesmet','../Imagini/preparate-din-vita-snitel-vienez.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('68','BIFTEC TARTAR','34.00','220','muschi de vita, ceapa, castraveti acri, unt, capere, worcester, tabasco, ketchup, coniac','../Imagini/preparate-din-vita-biftec-tartar.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('69','MUSCHI DE VITA IN SOS GORGONZOLA','42.00','250','muschi de vita, smantana, cascaval, gorgonzola, vin','../Imagini/preparate-din-vita-muschi-de-vita-in-sos-gorgonzola.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('70','RASOL DE VITA','26.00','200','ceapa, morcovi, telina, pulpa vita','../Imagini/preparate-din-vita-rasol-de-vita.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('71','MEDALION DE VITA CU SOS PICANT SI CARTOFI NATUR','38.00','300','muschi de vita, mustar, bulion, cartofi, sos worcester, usturoi, sos tabasco','../Imagini/preparate-din-vita-medalion-vita-cu-cartofi-natur.jpg');
 
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('10','67');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('10','68');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('10','69');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('10','70');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('10','71');


 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('11','PREPARATE DE OAIE','../Imagini/oaie.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('72','PASTRAMA LA TIGAIE CU MAMALIGA SI MUJDEI','30.00','400','pastrama, malai, usturoi, vin','../Imagini/pastrama-la-tigaie-cu-mamaliguta-si-mujdei.jpg');
 
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('11','72');


 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('12','DESERT','../Imagini/cake.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('73','INGHETATA ASORTATA','15','200','inghetata, frica, toping','../Imagini/desert-inghetata-asortata.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('74','MAR CU INGHETATA','11.50','200','mar, inghetata, vin rosu, scortisoara, nuca, frisca','../Imagini/desert-mar-cu-inghetata.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('75','CREMA DE ZAHAR ARS','12.50','250','crema de caramel','../Imagini/desert-crema-de-zahar-ars.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('76','INGHETATA CU PORTOCALE SI NUCI','17.00','300','inghetata, portocale, nuci, frisca, toping','../Imagini/desert-inghetata-cu-portocale-si-nuci.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('77','CLATITE CU INGHETATA SI FRISCA','17.00','250','toping, inghetata, frisca','../Imagini/desert-clatite-cu-inghetata-si-frisca.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('78','CLATITE CU FINETTI','11.00','300','toping, Finetti','../Imagini/desert-clatite-cu-finetti.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('79','PLACINTA CASEI CU BRANZA','10.00','250','faina, branza','../Imagini/desert-placinta-cu-branza.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('80','INGHETATA CU BANANE SI ALUNE','17.00 ','300','inghetata, banane, alune, frisca, topping','../Imagini/desert-inghetata-cu-banana.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('81','CLATITE CU GEM DE VISINE','11.00','300','toping, gem','../Imagini/desert-clatite-cu-visine.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('82','CLATITE CU NUCI SI SOS DE CIOCOLATA','11.50','300','nuci, ciocolata','../Imagini/desert-clatite-cu-nuci-si-sos-de-ciocolata.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('83','PAPANASI CU BRANZA DE VACI','15.00','300','branza de vaci, dulceata de visine, smantana','../Imagini/desert-papanasi.jpg');

 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','73');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','74');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','75');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','76');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','77');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','78');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','79');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','80');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','81');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','82');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('12','83');

 
 INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('13','CAFEA/CEAI','../Imagini/cafea.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('84','CAFFE FRAPPE','15.50','300','cafe instant, inghetata vanilie, lapte rece, zahar, gheata','../Imagini/frape.jpg');
  INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('85','CAFEA IN 3 CULORI','9.50','300','lapte, spuma de lapte, espresso','../Imagini/cafea-in-3-culori.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('86','ICE COFFE','8.00','300','lapte rece, espresso, gheata','../Imagini/ice-cofe.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('87','CAFFE LATTE','8.00','300','lapte cald si espresso','../Imagini/cafe-latte.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('88','CEAI (lamaie, fructe)','6.50','350','lamaie, fructe','../Imagini/ceai-2.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('89','CEAI (negru)','6.50','350','ceai (negru)','../Imagini/ceai.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('90','CIOCOLATA CALDA','6.50','350','lapte cald spumat si praf de ciocolata','../Imagini/ciocolata-calda.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('91','ESPRESSO MACCHIATO','7','350','espresso si spuma de lapte','../Imagini/cafea-machiato.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('92','CAPUCCINO','7.00','350','espresso, lapte, spuma de lapte','../Imagini/capucino.jpg');

 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','84');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','85');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','86');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','87');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','88');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','89');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','90');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','91');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('13','92');

   
   INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('14','BAUTURI RACORITOARE','../Imagini/suc.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('93','APA MINERALA BUCOVINA','5','330','apa minerala bucovina','../Imagini/2507181_full.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('94','APA PLATA BUCOVINA','5','330','apa plata','../Imagini/apa-plata.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('95','PRIGAT KIWI','6','250','prigat kiwi','../Imagini/prigat-kiwi.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('96','PRIGAT PORTOCALE','6','250','prigat portocale','../Imagini/prigat-nectar-portocale-0.25L.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('97','PRIGAT VISINE','6','250','prigat visine','../Imagini/5cfa4e00aa532cf45a571d771b57fde4.png');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('98','7-UP','5','250','7-up','../Imagini/0188-7up-sticla-02l-4-973x1395-e1495717996338.png');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('99','MIRINDA','5','250','mirinda','../Imagini/MIRINDA-025L1-e1495718057427.png');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('100','PEPSI','5','250','pepsi','../Imagini/pepsi250.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('101','LIMONADA','9','400','limonada','../Imagini/limonada.jpg');

 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','93');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','94');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','95');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','96');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','97');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','98');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','99');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','100');
 INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('14','101');


INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('15','ENERGIZANTE','../Imagini/energizant.jpg');
INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('102','REDBULL','13.50','250','energizant','../Imagini/redbull.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('103','BURN','40','250','energizant','../Imagini/burn.jpg');

  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('15','102');
   INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('15','103');


INSERT INTO `meniu` (`idMeniu`, `numeCategorie`,`caleImagineCategorie`) VALUES ('16','BAUTURI DIVERSE','../Imagini/bauturi.jpg');
INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('104','BUDUREASCA – ALBA','45','750','vin','../Imagini/crama-budureasca-feteasca-alba.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('105','VINUL CAVALERULUI – PINOT NOIR','40','750','vin','../Imagini/vinul-cavalarului-pinot-noir.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('106','BUDUREASCA – FETEASCA NEAGRA','45','750','vin','../Imagini/feteasca-neagra-screw-cap-budureasca-625.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('107','SAMPANIE ASTI MARTINI','100','700','sampanie','../Imagini/martini.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('108','TEQUILA','25','100','tequila','../Imagini/camino.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('109','AFINATA SABER PREMIUM','15','100','afinata','../Imagini/afinata-saber.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('110','PALINCA DE PRUNE','16.00','100','palinca','../Imagini/palinca-de-prune.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('111','JACK DANIEL’S','27','100','whisky','../Imagini/jack-daniels.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('112','STALINSKAYA','10','100','vodca','../Imagini/stalinskaya.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
  ('113','GARRONE ROSSO','6','100','vermut','../Imagini/garrone-rosso.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('114','CAROLANS','18.00','100','lichior','../Imagini/carolans.jpg');
   INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('115','HEINEKEN – DRAUGHT','8.50','400','bere','../Imagini/halba.jpg');
 INSERT INTO `produse` (`idProdus`,`numeProdus`,`pret`,`gramaj`,`ingrediente`,`caleImagineProdus`) VALUES
 ('116','CIUC PREMIUM – DRAUGHT','6.50','400','bere','../Imagini/halba.jpg');

  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','104');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','105');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','106');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','107');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','108');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','109');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','110');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','111');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','112');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','113');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','114');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','115');
  INSERT INTO `detaliiMeniu` (`idMeniu`, `idProdus`) VALUES ('16','116');