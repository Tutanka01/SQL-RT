import sqlite3 as sql
import json

con = sql.connect('TP3.sqlite')
cur = con.cursor()

cur.execute("select * from composant")
res = cur.fetchall()

dico = {"refcomp": 0,
        "nomcomp" : 0,
        "marque" : 0,
        "type" : 0}

for row in res:
    dico[row[0]] = row[1]
con.close()

print(dico)