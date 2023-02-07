"""
sqlite3 sujet.sqlite
.read magasin_sqlite.sql
.quit
"""
select * from X where numprod in (select numprod from Y where Z)

----------

Afin d'accèder au bureau sur ordi uppa en utilisant ubuntu : 
/mnt/c/Documents and Settings/uppa/Desktop/



#1

a)
select nomFour FROM fournisseur WHERE ville='PARIS';
=> 	Dupont

b)
select numProd FROM produit WHERE origine='Paris' and poids>=0.3;
=> 	p1
	p6
	
c)
select numProd FROM produit WHERE origine='Paris' and poids>=0.3 ORDER BY poids DESC;
=> 	p6
	p1
	
d)
select numFour, numProd FROM fournisseur f, produit p WHERE f.ville=p.origine;
=> 	f1|p1 
	f1|p6 
	f1|p7
	
e)
select p1.numprod, p2.numprod FROM produit p1, produit p2 WHERE p1.origine=p2.origine and p1.numprod!=p2.numprod;
=> 	p1|p6
	p1|p7
	p3|p4
	p4|p3
	p6|p1
	p6|p7
	p7|p1
	p7|p6
	
f)
select nomprod FROM produit WHERE numprod='p1' or numprod='p2' or numprod='p3' or numprod='p4';
=> 	veste
	pantalon
	chemise
	veste longue

#2

a)
select nomfour FROM fournisseur,produit,stock WHERE produit.couleur='rouge' and (stock.numfour=fournisseur.numfour and stock.numprod=produit.numprod);
=> 	Dupont
	Courvite
	
b)
select nomfour FROM fournisseur,produit,stock 
WHERE produit.numprod='p2' and 
(stock.numfour=fournisseur.numfour and stock.numprod=produit.numprod);
=> 	Dupont
	Courvite
	Frip64
	Alpages
	
c)
select distinct numfour FROM stock 
WHERE numprod in (select numprod FROM stock WHERE numfour='f2');
=> 	f1
	f2
	f3
	f4

d)
select numprod FROM produit WHERE origine=(select origine FROM produit WHERE numprod='p1');
=> 	p1
	p6
	p7

#3

a)
}select nomfour FROM fournisseur WHERE EXISTS (select * 
from stock, fournisseur WHERE (stock.numfour=fournisseur.numfour)
 and (stock.numprod='p2'));

select f.nomFour from stock s, fournisseur f where s.numfour=f.numfour and s.numprod='p2';
=> 	Dupont
	Courvite
	Frip64
	Alpages

b)
select f.nomFour from stock s, fournisseur f where s.numfour=f.numfour and s.numprod!='p2';
=> 	Dupont
	Courvite
	Alpages

#4

a)
select numprod, sum(qte) FROM stock GROUP BY numprod ;
=> 	p1|800
	p2|1000
	p3|400
	p4|500
	p5|500
	p6|150
	p7|250