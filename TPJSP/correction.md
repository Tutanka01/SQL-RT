# Correction TPJSP

1: 
```sql
select DISTINCT e.nomEtud from etudiant e , projet p INNER JOIN projet on e.idetud=p.idetud where p.note IS not NULL;
```

```sql
2: SELECT nomEtud from etudiant where not EXISTS (select * from projet where etudiant.idetud = projet.idetud)
``` Peut etre c'est faux 

```sql
3: SELECT dateAbsence from absence WHERE idEtud in (SELECT idEtud FROM etudiant WHERE nomEtud = 'Elsa');
```
```sql
4: SELECT nomEtud FROM etudiant WHERE idEtud not in (SELECT idEtud FROM absence);
```

# Python

1: 

```python
import sqlite3
connection = sqlite3.connect(":memory:")
cur = connection.cursor()
sql = open("bdd_1_sqlite.sql").read()
cur.executescript(sql)

out = [x for x in cur.execute("SELECT etudiant.nomEtud, count(*) from etudiant, absence WHERE etudiant.idEtud = absence.idEtud group by absence.idEtud;")]

print("<HTML><body>")
print("<table style='border: 1px solid black;'>")
for element in out:
    print("<tr>")
    for in_tuple in element:
        if in_tuple == 1:
            print("<td style='border: 1px solid black; background-color:yellow;'>{}</td>".format(in_tuple))
        elif in_tuple == 0:
            print("<td style='border: 1px solid black; background-color:green;'>{}</td>".format(in_tuple))
        elif in_tuple == 2 or in_tuple == 3 or in_tuple == 4:
            print("<td style='border: 1px solid black; background-color:red;'>{}</td>".format(in_tuple))
        else:
            print("<td style='border: 1px solid black;'>{}</td>".format(in_tuple))
    print("</tr>")
print("</table>")
print("</body></HTML>")
```