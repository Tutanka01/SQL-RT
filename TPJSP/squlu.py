import sqlite3
connection = sqlite3.connect(":memory:")
cur = connection.cursor()
sql = open("bdd_4_sqlite.sql").read()
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