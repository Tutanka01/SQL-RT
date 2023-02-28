import sqlite3 as sql
import json

con = sql.connect('TP3.sqlite')
cur = con.cursor()

cur.execute("select * from composant")
res = cur.fetchall()

for row in res:
    print(row)

con.close()