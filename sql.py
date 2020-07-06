
import sqlite3 

cnt = sqlite3.connect("chinook.db")
cursor = cnt.execute(
    "SELECT firstname, lastname, email FROM customers;"
)
for i in cursor:
    print("Customer ID: ", i[0], i[1], i[2])
 
cnt.close()

