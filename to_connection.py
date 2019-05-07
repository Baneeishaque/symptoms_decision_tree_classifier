import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="1234",
  database="shc"
)
mycursor = mydb.cursor()
mycursor2 = mydb.cursor()

# mycursor.execute("SELECT * FROM doctor_diseases")

# myresult = mycursor.fetchall()

# for x in myresult:
  # print(x)
  
# mycursor.execute("SELECT doctor_id,disease_id FROM doctor_diseases")

# myresult = mycursor.fetchall()

# for x in myresult:
  # print(x)

mycursor.execute("SELECT doctor_id,disease_id FROM doctor_diseases")

myresult = mycursor.fetchall()
  
for row in myresult:
    # print('Doctor Id = ', row[0], )
    # print('Disease Id = ', row[1])
    mycursor2.execute("SELECT disease_name FROM disease WHERE disease_id=%s" % row[1])
    myresult2 = mycursor2.fetchone()
    # print(myresult2)
    # print(myresult2[0])
    sql = "INSERT INTO doctor_disease (doctor_id,disease) VALUES (%s,'%s')" % (row[0],myresult2[0])
    print (sql)
    mycursor2.execute(sql)
    mydb.commit()
    print(mycursor2.rowcount, "record inserted.")
mycursor.close()

# print("Disease %s" % disease)
# print("Replaced Disease %s" % disease.replace("'", r"\'"))
# sql = "INSERT INTO disease (disease_name) VALUES ('%s')" % disease.replace("'", r"\'")
# val = (disease)
# mycursor.execute(sql, val)
# mycursor.execute(sql)
# mydb.commit()
# print(mycursor.rowcount, "record inserted.")