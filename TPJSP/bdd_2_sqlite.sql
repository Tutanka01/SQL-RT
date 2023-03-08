BEGIN TRANSACTION;



DROP TABLE IF EXISTS etudiant;

CREATE TABLE etudiant
  (idEtud	INTEGER	PRIMARY KEY,
   nomEtud	TEXT		NOT NULL
  );

INSERT INTO etudiant VALUES(1,'Alice');
INSERT INTO etudiant VALUES(2,'Bob');
INSERT INTO etudiant VALUES(4,'Charlie');
INSERT INTO etudiant VALUES(5,'David');
INSERT INTO etudiant VALUES(6,'Elsa');
INSERT INTO etudiant VALUES(7,'Frank');
INSERT INTO etudiant VALUES(8,'Gary');
INSERT INTO etudiant VALUES(9,'Henry');
INSERT INTO etudiant VALUES(10,'Indiana');
INSERT INTO etudiant VALUES(11,'Joe');
INSERT INTO etudiant VALUES(12,'Kylie');
INSERT INTO etudiant VALUES(13,'Luke');
INSERT INTO etudiant VALUES(14,'Mike');



DROP TABLE IF EXISTS cours;

CREATE TABLE cours
  (idCours	INTEGER	PRIMARY KEY,
   nomCours	TEXT		NOT NULL
  );

INSERT INTO cours VALUES(1,'informatique');
INSERT INTO cours VALUES(2,'mathématiques');
INSERT INTO cours VALUES(3,'réseaux');
INSERT INTO cours VALUES(4,'anglais');



DROP TABLE IF EXISTS projet;

CREATE TABLE projet
  (idCours	INTEGER	NOT NULL,
   idEtud	INTEGER	NOT NULL,
   note	REAL,
   PRIMARY KEY (idCours,idEtud)
  );

INSERT INTO projet VALUES(1,2,15);
INSERT INTO projet VALUES(1,5,10);
INSERT INTO projet VALUES(1,12,8);
INSERT INTO projet VALUES(1,10,12);
INSERT INTO projet VALUES(2,10,16);
INSERT INTO projet VALUES(2,8,13);
INSERT INTO projet VALUES(2,13,null);
INSERT INTO projet VALUES(2,2,null);
INSERT INTO projet VALUES(2,14,null);
INSERT INTO projet VALUES(3,10,13);
INSERT INTO projet VALUES(3,2,9);
INSERT INTO projet VALUES(3,6,14);
INSERT INTO projet VALUES(3,4,7);
INSERT INTO projet VALUES(3,11,null);
INSERT INTO projet VALUES(4,10,11);
INSERT INTO projet VALUES(4,2,null);
INSERT INTO projet VALUES(4,14,6);
INSERT INTO projet VALUES(4,4,null);



COMMIT;

