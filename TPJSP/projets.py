import sqlite3 as sql
con = sql.connect("bdd2.sqlite")
cur = con.cursor()
res = [x for x in cur.execute("SELECT nometud, COUNT(*) FROM etudiant, projet WHERE etudiant.idetud = projet.idetud GROUP BY nometud HAVING COUNT(*)")]

html = "<HTML><body><table style='border: 1px solid black;'>"
for i in range(0, len(res)):
    html += "<tr>"
    if res[i][1] == 1:
        html += "<td>{}</td>".format(res[i][0])
        html += "<td style='border: 1px solid black; background-color:yellow;'>{}</td>".format(res[i][1])
    elif res[i][1] == 0:
        html += "<td>{}</td>".format(res[i][0])
        html += "<td style='border: 1px solid black; background-color:red;'>{}</td>".format(res[i][1])
    elif res[i][1] > 1:
        html += "<td>{}</td>".format(res[i][0])
        html += "<td style='border: 1px solid black; background-color:green;'>{}</td>".format(res[i][1])
    else:
        html += "<td style='border: 1px solid black;'>{}</td>".format(res[i][1])
    html += "</tr>"
html += "</table></body></HTML>"
print(html)
