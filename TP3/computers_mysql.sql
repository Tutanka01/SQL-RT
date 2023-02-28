#DROP TABLE composant;

CREATE TABLE composant
  (refcomp	VARCHAR(15)	NOT NULL,
   nomcomp	VARCHAR(30)	NOT NULL,
   marque	VARCHAR(15)	NULL,
   type		VARCHAR(5)	NULL,
   CONSTRAINT cle_comp PRIMARY KEY (refcomp)
  );

INSERT INTO composant VALUES('MS6260S','Matsonic MS6260','Matsonic','CM');
INSERT INTO composant VALUES('P5A','Asus P5A ATX','Asus','CM');
INSERT INTO composant VALUES('BH6','Abit BH6 ATX','Abit','CM');
INSERT INTO composant VALUES('BE6','Abit BE6 ATX UDMA66','Abit','CM');
INSERT INTO composant VALUES('SD11','FIC SD11 UDMA33/66 (Athlon)','FIC','CM');
INSERT INTO composant VALUES('P3-500','Pentium III - 500MHz','Intel','Proc');
INSERT INTO composant VALUES('P3-550','Pentium III - 550MHz','Intel','Proc');
INSERT INTO composant VALUES('P3-600','Pentium III - 600MHz','Intel','Proc');
INSERT INTO composant VALUES('C-433','Celeron 433MHz','Intel','Proc');
INSERT INTO composant VALUES('C-500','Celeron 500MHz','Intel','Proc');
INSERT INTO composant VALUES('K7-600','Athlon 600MHz','AMD','Proc');
INSERT INTO composant VALUES('K7-800','Athlon 800MHz','AMD','Proc');
INSERT INTO composant VALUES('EDO-16Mo','EDO SIMM 16Mo',NULL,'RAM');
INSERT INTO composant VALUES('SDRAM-64Mo','SDRAM 64Mo PC100',NULL,'RAM');
INSERT INTO composant VALUES('SDRAM-128Mo','SDRAM 128Mo PC100',NULL,'RAM');
INSERT INTO composant VALUES('i740','Intel 740 8Mo AGP','Intel','Video');
INSERT INTO composant VALUES('Fury32','ATI 128 Fury 32Mo AGP + TV','ATI','Video');
INSERT INTO composant VALUES('G400-32','Matrox G400 32Mo Dual','Matrox','Video');
INSERT INTO composant VALUES('G400-32max','Matrox G400 32Mo max','Matrox','Video');
INSERT INTO composant VALUES('S3Trio','S3 Trio 128 bits 4Mo AGP',NULL,'Video');
INSERT INTO composant VALUES('40X','CD-ROM 40X IDE',NULL,'CD');
INSERT INTO composant VALUES('50X','CD-ROM 50X Asus IDE','Asus','CD');
INSERT INTO composant VALUES('40XS','CD-ROM 40X Plextor SCSI','Plextor','CD');
INSERT INTO composant VALUES('SB16','16 bits 3D comp SB16 ISA',NULL,'Son');
INSERT INTO composant VALUES('SB128','Sound Blaster 128 PCI','Creative','Son');
INSERT INTO composant VALUES('SBLive','Sound Blaster Live Player','Creative','Son');
INSERT INTO composant VALUES('DD4.3','4,3Go Seagate UDMA33/66','Seagate','DD');
INSERT INTO composant VALUES('DD6.4','6,4Go Seagate UDMA33/66','Seagate','DD');
INSERT INTO composant VALUES('DD8,4','8,4Go Seagate UDMA33/66','Seagate','DD');
INSERT INTO composant VALUES('DD9.1UW2','9,1Go IBM UW2 10000trs','IBM','DD');
INSERT INTO composant VALUES('teco15','15" teco pitch 0.28','teco','Ecran');
INSERT INTO composant VALUES('teco17','17" teco pitch 0.28','teco','Ecran');
INSERT INTO composant VALUES('S703HT','17" IIYAMA S703HT 0.26','IIYAMA','Ecran');
INSERT INTO composant VALUES('A702HT','17" IIYAMA A702HT','IIYAMA','Ecran');



#DROP TABLE machine;

CREATE TABLE machine
  (numpc	VARCHAR(5)	NOT NULL,
   nompc	VARCHAR(15)	NOT NULL,
   dateachat	DATE		NULL,
   salle	VARCHAR(15)	NULL,
   CONSTRAINT cle_pc PRIMARY KEY (numpc)
  );

INSERT INTO machine VALUES('pc01','Serveur Etud','15/06/1999','atelier');
INSERT INTO machine VALUES('pc02','PC Admin','15/06/1999','atelier');
INSERT INTO machine VALUES('pc03','station 1','20/07/1999','showroom');
INSERT INTO machine VALUES('pc04','station 2','20/07/1999','showroom');
INSERT INTO machine VALUES('pc05','PC du chef','10/01/2000','bureau');
INSERT INTO machine VALUES('pc06','PC codeur','02/10/1998','grenier');



#DROP TABLE assemble;

CREATE TABLE assemble
  (numpc	VARCHAR(5)	NOT NULL,
   refcomp	VARCHAR(15)	NOT NULL,
   qte		NUMERIC(4)	NOT NULL,
   CONSTRAINT cle_ass PRIMARY KEY (numpc,refcomp)
  );

INSERT INTO assemble VALUES('pc01','BE6',1);
INSERT INTO assemble VALUES('pc01','P3-500',1);
INSERT INTO assemble VALUES('pc01','SDRAM-128Mo',1);
INSERT INTO assemble VALUES('pc01','S3Trio',1);
INSERT INTO assemble VALUES('pc01','40X',1);
INSERT INTO assemble VALUES('pc01','teco15',1);
INSERT INTO assemble VALUES('pc01','DD9.1UW2',2);
INSERT INTO assemble VALUES('pc02','P5A',1);
INSERT INTO assemble VALUES('pc02','C-500',1);
INSERT INTO assemble VALUES('pc02','SDRAM-64Mo',1);
INSERT INTO assemble VALUES('pc02','i740',1);
INSERT INTO assemble VALUES('pc02','teco17',1);
INSERT INTO assemble VALUES('pc02','DD6.4',1);
INSERT INTO assemble VALUES('pc03','BH6',1);
INSERT INTO assemble VALUES('pc03','P3-600',1);
INSERT INTO assemble VALUES('pc03','SDRAM-128Mo',1);
INSERT INTO assemble VALUES('pc03','Fury32',1);
INSERT INTO assemble VALUES('pc03','50X',1);
INSERT INTO assemble VALUES('pc03','S703HT',1);
INSERT INTO assemble VALUES('pc03','DD6.4',1);
INSERT INTO assemble VALUES('pc03','SB16',1);
INSERT INTO assemble VALUES('pc04','BH6',1);
INSERT INTO assemble VALUES('pc04','P3-600',1);
INSERT INTO assemble VALUES('pc04','SDRAM-128Mo',1);
INSERT INTO assemble VALUES('pc04','Fury32',1);
INSERT INTO assemble VALUES('pc04','50X',1);
INSERT INTO assemble VALUES('pc04','S703HT',1);
INSERT INTO assemble VALUES('pc04','DD6.4',1);
INSERT INTO assemble VALUES('pc04','SB16',1);
INSERT INTO assemble VALUES('pc05','SD11',1);
INSERT INTO assemble VALUES('pc05','K7-800',1);
INSERT INTO assemble VALUES('pc05','SDRAM-64Mo',2);
INSERT INTO assemble VALUES('pc05','G400-32max',1);
INSERT INTO assemble VALUES('pc05','40XS',1);
INSERT INTO assemble VALUES('pc05','A702HT',1);
INSERT INTO assemble VALUES('pc05','DD9.1UW2',1);
INSERT INTO assemble VALUES('pc05','SBLive',1);
INSERT INTO assemble VALUES('pc06','MS6260S',1);
INSERT INTO assemble VALUES('pc06','C-433',1);
INSERT INTO assemble VALUES('pc06','EDO-16Mo',1);
INSERT INTO assemble VALUES('pc06','S3Trio',1);
INSERT INTO assemble VALUES('pc06','teco15',1);
INSERT INTO assemble VALUES('pc06','DD4.3',1);



#DROP TABLE cartevideo;

CREATE TABLE cartevideo
  (refcomp	VARCHAR(15)	NOT NULL,
   ramvideo	NUMERIC(3)	NOT NULL
  );

INSERT INTO cartevideo VALUES('i740',8);
INSERT INTO cartevideo VALUES('Fury32',32);
INSERT INTO cartevideo VALUES('G400-32',32);
INSERT INTO cartevideo VALUES('G400-32max',32);
INSERT INTO cartevideo VALUES('S3Trio',4);



#DROP TABLE processeur;

CREATE TABLE processeur
  (refcomp	VARCHAR(15)	NOT NULL,
   vitesse	NUMERIC(4)	NOT NULL,
   TroisDNow	VARCHAR(3)	NULL
  );

INSERT INTO processeur VALUES('P3-500',500,'non');
INSERT INTO processeur VALUES('P3-550',550,'non');
INSERT INTO processeur VALUES('P3-600',600,'non');
INSERT INTO processeur VALUES('C-433',433,'non');
INSERT INTO processeur VALUES('C-500',500,'non');
INSERT INTO processeur VALUES('K7-600',600,'oui');
INSERT INTO processeur VALUES('K7-800',800,'oui');



#DROP TABLE disquedur;

CREATE TABLE disquedur
  (refcomp	VARCHAR(15)	NOT NULL,
   capacite	NUMERIC(5,2)	NOT NULL,
   interface	VARCHAR(4)	NULL,
   vitesse	NUMERIC(5)	NULL
  );

INSERT INTO disquedur VALUES('DD4.3',4.3,'IDE',5000);
INSERT INTO disquedur VALUES('DD6.4',6.4,'IDE',7200);
INSERT INTO disquedur VALUES('DD8,4',8.4,'IDE',7200);
INSERT INTO disquedur VALUES('DD9.1UW2',9.1,'SCSI',10000);

COMMIT;
