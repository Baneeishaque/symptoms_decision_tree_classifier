import csv
import mysql.connector

from collections import defaultdict

def return_list(local_disease_data):
    local_disease_list = []
    disease_array = local_disease_data.replace('^','_').split('_')
    counter = 1
    for item in disease_array:
        if counter%2==0:
            local_disease_list.append(item)
        counter = counter + 1
        
    return local_disease_list

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="1234",
  database="shc"
)
mycursor = mydb.cursor()

with open('data/dataset_uncleaned_unicode.csv') as csvfile:
    reader = csv.reader(csvfile)
    disease_data=""
    # disease_weight = 0
    disease_list = []
    
    # symptom_list=[]
    # disease_weight_dict = {}
    # disease_symptoms_dict=defaultdict(list)

    for row in reader:

        if row[0]!="\xc2\xa0" and row[0]!="":
            # print ("Row 0 : %s" % row[0])
            disease_data = str.encode(row[0]).decode('utf-8')
            
            disease_list = return_list(disease_data)
            # disease_weight = str.encode(row[1]).decode('utf-8')

        # if row[2]!="\xc2\xa0" and row[2]!="":
            # print("Row 2 : %s" % row[2])
            # symptom_list = return_list(str.encode(row[2]).decode('utf-8'))

            for disease in disease_list:
                print("Disease %s" % disease)
                print("Replaced Disease %s" % disease.replace("'", r"\'"))
                sql = "INSERT INTO disease (disease_name) VALUES ('%s')" % disease.replace("'", r"\'")
                # val = (disease)
                # mycursor.execute(sql, val)
                mycursor.execute(sql)
                mydb.commit()
                print(mycursor.rowcount, "record inserted.")
                # for symptom in symptom_list:
                    # disease_symptoms_dict[disease].append(symptom)
                # disease_weight_dict[disease] = disease_weight

# print ("Disease & Symptoms %s" % disease_symptoms_dict)
# print ("Disease & Weight %s" % disease_weight_dict)
