-- SQL pour les tables Fournisseur, Produit et Stock

BEGIN TRANSACTION;



DROP TABLE IF EXISTS fournisseur;

CREATE TABLE fournisseur
  (numfour	TEXT	PRIMARY KEY,
   nomfour	TEXT	NOT NULL,
   remise	INTEGER	NULL,
   ville	TEXT	NULL
  );

INSERT INTO fournisseur VALUES('f1','Dupont',0,'Paris');
INSERT INTO fournisseur VALUES('f2','Courvite',10,'Marseille');
INSERT INTO fournisseur VALUES('f3','Frip64',5,'Pau');
INSERT INTO fournisseur VALUES('f4','Alpages',3,'Grenoble');
INSERT INTO fournisseur VALUES('f5','Stanislas',0,'Nancy');



DROP TABLE IF EXISTS produit;

CREATE TABLE produit
  (numprod	TEXT	PRIMARY KEY,
   nomprod	TEXT	NOT NULL,
   couleur	TEXT	NULL,
   poids	REAL	NULL,
   origine	TEXT	NULL
  );

INSERT INTO produit VALUES('p1','veste','bleu',0.3,'Paris');
INSERT INTO produit VALUES('p2','pantalon','noir',0.4,'Lyon');
INSERT INTO produit VALUES('p3','chemise','blanc',0.2,'Londres');
INSERT INTO produit VALUES('p4','veste longue','brun',0.6,'Londres');
INSERT INTO produit VALUES('p5','jean','bleu',0.5,'Bordeaux');
INSERT INTO produit VALUES('p6','manteau','rouge',1.2,'Paris');
INSERT INTO produit VALUES('p7','chemise','vert',0.2,'Paris');



DROP TABLE IF EXISTS stock;

CREATE TABLE stock
  (numfour	TEXT	NOT NULL,
   numprod	TEXT	NOT NULL,
   qte		INTEGER	NOT NULL,
   PRIMARY KEY (numfour,numprod)
  );

INSERT INTO stock VALUES('f1','p1',300);
INSERT INTO stock VALUES('f1','p2',200);
INSERT INTO stock VALUES('f3','p2',200);
INSERT INTO stock VALUES('f2','p1',300);
INSERT INTO stock VALUES('f4','p2',200);
INSERT INTO stock VALUES('f1','p4',200);
INSERT INTO stock VALUES('f1','p3',400);
INSERT INTO stock VALUES('f2','p2',400);
INSERT INTO stock VALUES('f4','p4',300);
INSERT INTO stock VALUES('f4','p5',400);
INSERT INTO stock VALUES('f1','p6',100);
INSERT INTO stock VALUES('f1','p5',100);
INSERT INTO stock VALUES('f2','p7',150);
INSERT INTO stock VALUES('f4','p7',100);
INSERT INTO stock VALUES('f2','p6',50);
INSERT INTO stock VALUES('f4','p1',200);



COMMIT;

