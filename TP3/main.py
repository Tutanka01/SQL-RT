import sqlite3 as sql

con = sql.connect('TP3.sqlite')
cur = con.cursor()

cur.execute("select * from composant")
res = cur.fetchall()
print("<table border=1>")
print("<>" + "<th>Refcomp</th>" + "<th>NomComp</th>" + "<th>Marque</th>" + "<th>Type</th>" + "</tr>")

#print("<tr>" +"<td>"+ row[0]+"</td>"+"<td>"+row[1]+"</td>"+"<td>"+ row[3] +"</td>"+ "</tr>")

for i in range(0, len(res)):
    print("<tr>")
    for j in range(0, len(res[i])):
        print("<td>"+str(res[i][j])+"</td>")
    print("</tr>")
    
print("</table>")
print("fin")

con.close()