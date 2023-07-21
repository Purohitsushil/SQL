## python3 -m pip install mysql-connector-python

import mysql.connector

# this is for connect to your database 
conn = mysql.connector.connect(
    user = 'root',
    password = '12345678',
    host = '127.0.0.1',
    database = 'class2',
    auth_plugin = 'mysql_native_password' 
)

# creating a cursor 
cur = conn.cursor()

# write the query which you need to excute
cur.execute('show databases')

# viewing the output
for i in cur:
    print(i)

cur = conn.cursor()

# create the table
cur.execute('create table product(pname varchar(20),ptype varchar(20));')

cur = conn.cursor()

cur.execute('show tables')

for i in cur:
    print(i)

# inserting the value into the table 
cur = conn.cursor()

cmd = 'insert into product(ptype,pname) values(%s,%s)'

# for single value
val = ('book','notebook')
# for muiltple values
val = [
    ('shoes','adidas'),
    ('shoes','puma')
]

for i in range(len(val)):
    cur.execute(cmd,val[i])

conn.commit()

cur = conn.cursor()

cur.execute("select * from product where ptype = 'shoes'")

for i in cur:
    print(i)


# delete a record from the table 
cur = conn.cursor()

cur.execute("delete from product where ptype = 'shoes'")

conn.commit()

cur = conn.cursor()

cur.execute("select * from product")

for i in cur:
    print(i)



