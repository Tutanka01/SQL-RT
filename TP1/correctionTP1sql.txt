---
geometry: margin=2cm
---

# Requêtes simples :

(a) noms des fournisseurs situés à Paris

```sql
SELECT nomfour 
    FROM fournisseur 
    WHERE ville="Paris";
```

(b) numéros des produits provenant de Paris et dont le poids est supérieur ou égal à 0.3

```sql
SELECT numProd 
    FROM Produit 
    WHERE origine="Paris" AND poids >= 0.3;
```

(c) idem précédent, mais triés par poids décroissant

```sql
SELECT numProd 
    FROM Produit 
    WHERE origine="Paris" AND poids >= 0.3 
    ORDER BY poids DESC;
```

(d) correspondance entre les numéros de fournisseurs et les numéros de produits de la même ville

```sql
SELECT numProd, numfour 
    FROM Produit 
    INNER JOIN fournisseur ON produit.origine = fournisseur.ville;
```
Resultat : 

numprod  numfour
-------  -------
p1       f1     
p6       f1     
p7       f1     

(e) correspondance entre les numéros de produits de la même ville

```sql
SELECT C1.numprod, C2.numprod 
    FROM Produit C1, Produit C2 
    WHERE C1.origine = C2.origine AND C1.numprod < C2.numprod;
```

(f) noms des produits dont le numéro est p1, p2, p3 ou p4

```sql
SELECT nomProd 
    FROM Produit 
    WHERE numProd="p1" OR numProd="p2" OR numProd="p3" OR numProd="p4";
```

# Sous-requêtes :

(a) noms des fournisseurs ayant livré des produits de couleur rouge

```sql
SELECT nomfour 
    FROM fournisseur 
    INNER JOIN Stock ON Stock.numFour = fournisseur.numFour 
    INNER JOIN Produit ON Produit.numProd = Stock.numProd 
    WHERE Produit.couleur="rouge";
```

(b) noms des fournisseurs ayant livré le produit p2

```sql
SELECT nomFour
    FROM Fournisseur, Stock, Produit
    WHERE Fournisseur.numFour = Stock.numFour AND 
        Stock.numProd = Produit.numProd AND 
        Produit.numProd = "p2";
```

(c) numéros des fournisseurs ayant livré au moins un article identique à ceux livrés par f2

```sql
SELECT DISTINCT Stock.numFour
    FROM Stock
    WHERE numFour != "f2" numProd IN (SELECT numProd
            FROM Stock
            WHERE numFour = "f2");
```

(d) numéros des produits originaires de la même ville que p1

```sql
SELECT C2.numProd
    FROM Produit C1, Produit C2
    WHERE C2.numProd != "p1" AND 
        C1.numProd = "p1" AND 
        C1.origine = C2.origine;
```

# 3. "Exists" et "not exists" :

(a) noms des fournisseurs ayant livré le produit p2

```sql
SELECT DISTINCT F.nomFour
    FROM Fournisseur F
    WHERE EXISTS (
        SELECT *
            FROM Stock S
            WHERE S.numProd = "p2" AND S.numFour = F.numFour
    );
```

(b) noms des fournisseurs n'ayant pas livré le produit p2

```sql
SELECT DISTINCT F.nomFour
    FROM Fournisseur F
    WHERE NOT EXISTS (
        SELECT *
        FROM Stock S
        WHERE S.numProd = "p2" AND S.numFour = F.numFour
    );
```

(c) noms des fournisseurs tels qu'il n'y ait pas de produit qu'ils n'aient pas livré (...)

```sql
SELECT DISTINCT F1.nomFour
    FROM Fournisseur F1
    WHERE NOT EXISTS (
        SELECT DISTINCT P1.numProd
            FROM Produit P1
            WHERE NOT EXISTS (
                SELECT S2.numFour
                    FROM Stock S2
                    WHERE S2.numProd = P1.numProd AND 
                        S2.numFour = F1.numFour
            )
    );
```

# "Group by" et "having" :

(a) total des quantités livrées pour chaque produit

```sql
SELECT numProd, SUM(qte)
    FROM Stock
    GROUP BY numProd;
```

(b) idem précédent, mais p1 non pris en compte

```sql
SELECT numProd, SUM(qte)
    FROM Stock
    WHERE numProd != "p1"
    GROUP BY numProd;
```

(c) numéros des fournisseurs ayant livré au moins deux produits

```sql
SELECT DISTINCT numFour
    FROM Stock
    GROUP BY numFour
    HAVING COUNT(numProd) >= 2;
```
# Requêtes en vrac

(a) numéros des produits livrés par plus d'un fournisseur (donner 3 solutions différentes)

```sql
SELECT DISTINCT S1.numprod
    FROM Stock S1, Stock S2
    WHERE S1.numfour < S2.numfour AND
        S1.numprod = S2.numprod;
```

```sql
SELECT numprod
    FROM Stock
    GROUP BY numprod
    HAVING COUNT(numprod) > 1;
```

```sql

```

(b) numéros des fournisseurs ayant livré au moins tous les produits livrés par f2

```sql
SELECT DISTINCT F1.nomFour
    FROM Fournisseur F1
    WHERE F1.numfour != "f2" AND NOT EXISTS (
        SELECT DISTINCT P1.numProd
            FROM Stock P1
            WHERE P1.numfour = "f2" AND NOT EXISTS (
                SELECT S2.numFour
                    FROM Stock S2
                    WHERE S2.numProd = P1.numProd AND 
                        S2.numFour = F1.numFour
            )
    );
```

(c) numéros, nom et poids de tous les produits pour lesquels il existe au moins un produit plus léger dans la liste

```sql
SELECT numprod, nomprod, MAX(poids)
    FROM Produit;
```

(d) numéros, nom et poids de tous les produits pour lesquels il existe au moins un produit plus léger dans la liste

```sql
SELECT numprod, nomprod, poids
    FROM Produit
    WHERE poids > (SELECT MIN(poids) FROM Produit);
```

(e) numéros des fournisseurs dont la remise est strictement inférieure à la remise maximale

```sql
SELECT numfour
    FROM Fournisseur
    WHERE remise < (SELECT MAX(remise) FROM Fournisseur);
```

(f) numéros des produits (ainsi que leur poids et leur origine) dont le poids est supérieur ou égal au poids moyen des produits originaires de la même ville

```sql
SELECT P1.numprod, P1.poids, P1.origine
    FROM Produit P1
    WHERE poids >= (
        SELECT AVG(P2.poids) 
            FROM Produit P2 
            WHERE P2.origine = P1.origine
    );
```

(g) total des quantités livrées pour chaque produit

```sql
SELECT numprod, SUM(qte)
    FROM Stock
    GROUP BY numprod;
```

(h) numéros des produits ayant été livrés au moins une fois (donner 3 solutions différentes)

```sql
SELECT DISTINCT numprod
    FROM Stock;
```

```sql
SELECT Produit.numprod
    FROM Produit
    WHERE EXISTS (
        SELECT *
            FROM Stock
            WHERE Stock.numprod = Produit.numprod
    );
```

```sql
SELECT DISTINCT Produit.numprod
    FROM Produit
    INNER JOIN Stock ON Produit.numprod = Stock.numprod;
```

(i) pour tous les produits rouges ou bleus dont la quantité totale livrée est supérieure à 350 (en excluant du total les commandes dont la quantité est inférieure à 200), donner le numéro du produit, le poids en pounds (sachant qu'une livre vaut 450 grammes), la couleur et la plus grande quantité livrée pour ce produit

```sql
SELECT P.numprod, ROUND(P.poids*(1/0.45), 2), MAX(S.qte)
    FROM Produit P, Stock S
    WHERE (P.couleur = "bleu" OR P.couleur = "rouge") AND
        P.numprod = S.numprod AND 
        S.qte > 200
    GROUP BY P.numprod
    HAVING SUM(S.qte) > 350;
```

(j) liste des couples de nom de fournisseurs installés dans la même ville et ayant livré au moins un produit identique

```sql
SELECT F1.nomfour, F2.nomfour
    FROM Fournisseur F1, Fournisseur F2
    WHERE F1.nomfour < F2.nomfour AND 
        F1.ville = F2.ville AND 
        EXISTS (
            SELECT *
                FROM Stock S1, Stock S2
                WHERE S1.numfour = F1.numfour AND 
                    S2.numfour = F2.numfour AND 
                    S1.numprod = S2.numprod
        );
```

(k) commande SQL permettant de rajouter une colonne PU (prix unitaire) dans la table Produit

```sql
ALTER TABLE Produit ADD COLUMN PU INTEGER ;
```

(l) valeur marchande du stock pour chacun des fournisseurs (avec leur nom)

```sql
SELECT nomfour, SUM(qte*PU)
    FROM Fournisseur, Stock, Produit
    WHERE Stock.numfour = Fournisseur.numfour AND
    Stock.numprod = Produit.numprod
    GROUP BY Fournisseur.numfour;

```

(m) dans la table Produit, convertir le poids des articles en livres (pounds)

```sql
SELECT numprod, nomprod, couleur, ROUND(poids*(1/0.45), 2), origine, PU
    FROM produit;
```

(n) supprimer tous les founisseurs n'ayant pas livré le moindre produit

```sql
DELETE FROM Fournisseur
    WHERE NOT EXISTS (
        SELECT *
            FROM Stock
            WHERE Stock.numfour = Fournisseur.numfour
    );
```
