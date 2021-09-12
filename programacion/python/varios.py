

# 20190809 - CálculoPi.py
def calcularPi(n=1000):
    x = 0
    for i in range(2, n):
        x = x + ((-1)**i * 4)/(2*i - 3)
    return x

# 20190822 - conexionSS.py
import pyodbc

server = '192.168.0.13'
database = 'dbalsi'

with pyodbc.connect('driver={ODBC Driver 17 for SQL Server};server={' + server + '};database={' + database + '};trusted_connection=yes;') as cn:
    cr = cn.cursor()
    cr.execute('select * from t_producto')
    #cr.execute("INSERT SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, SellStartDate) OUTPUT INSERTED.ProductID VALUES ('SQL Server Express New 20', 'SQLEXPRESS New 20', 0, 0, CURRENT_TIMESTAMP )")
    tb = cr.fetchall()
    for row in tb:
        print(row)
        print(row[3], '-', row[4])

del row, tb, cr


# 20190724 - sqlserver.py
import pyodbc

cn = pyodbc.connect("driver={SQL Server};server=192.168.0.13;database=DBAlSi;trusted_connection=yes") 

cursor = cn.cursor()

cmm = "select * from t_producto"

cursor.execute(cmm)

#cursor.commit()

#con.commit()

result_set = cursor.fetchall()

for result in result_set:
  print(result)
