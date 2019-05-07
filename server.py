import json

import mysql.connector
import numpy as np
from flask import Flask
from flask_restful import Resource, Api

import disease_prediction_api

app = Flask(__name__)
api = Api(app)


class DiseasePrediction(Resource):

    @staticmethod
    def get(symptoms):
        # return disease
        symptoms_array = symptoms.split(',')

        with open('data/features.json') as json_file:
            feature_dict = json.load(json_file)

        dummy_sample = [0 for i in range(len(feature_dict))]
        dummy_sample_x = np.matrix(dummy_sample)

        for symptom in symptoms_array:
            sample = [1 if i == int(feature_dict[symptom]) else 0 for i in range(len(feature_dict))]
            sample_x = np.matrix(np.array(sample).reshape(1, len(sample)))
            dummy_sample_x = dummy_sample_x + sample_x

        return disease_prediction_api.get_disease(dummy_sample_x)


class GetDoctor(Resource):
        
    @staticmethod
    def get(disease):
        mydb = mysql.connector.connect(
          host="localhost",
          user="root",
          passwd="1234",
          database="shc"
        )
        mycursor = mydb.cursor()
        mycursor.execute("SELECT doctor.doctor_id,doctor_name,doctor_address,doctor_designation,doctor_working_hospital,doctor_available_time,doctor_certificate_id,doctor_working_clinic,doctor_consultation_fee FROM doctor,doctor_disease WHERE doctor_disease.doctor_id=doctor.doctor_id AND disease='%s'" % disease)
        
        row_headers=[x[0] for x in mycursor.description] #this will extract row headers
        
        myresult = mycursor.fetchall()        
        
        json_data=[]
        
        for result in myresult:
            json_data.append(dict(zip(row_headers,result)))
        
        return json.dumps(json_data)


class GetSlot(Resource):
        
    @staticmethod
    def get(doctor_id):
        mydb = mysql.connector.connect(
          host="localhost",
          user="root",
          passwd="1234",
          database="shc"
        )
        mycursor = mydb.cursor()
        mycursor.execute("SELECT appoinment_slot_time FROM appoinment_slot WHERE doctor_id='%s'" % doctor_id)
        
        row_headers=[x[0] for x in mycursor.description] #this will extract row headers
        
        myresult = mycursor.fetchall()        
        
        json_data=[]
        
        for result in myresult:
            json_data.append(dict(zip(row_headers,result)))
        
        return json.dumps(json_data)        

class AddSlot(Resource):
        
    @staticmethod
    def get(name, address, contact_number, disease, doctor, slot, transaction_id, doctor_id, slot_id, current_date):
        mydb = mysql.connector.connect(
          host="localhost",
          user="root",
          passwd="1234",
          database="shc"
        )
        mycursor = mydb.cursor()
        sql="INSERT INTO `appoinments`(`name`,`address`,`contact_number`,`disease`,`doctor`,`slot`,`transaction_id`,`doctor_id`,`slot_id`,`current_date`)VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" % (name,address,contact_number,disease,doctor,slot,transaction_id,doctor_id,slot_id,current_date)
        # return sql
        mycursor.execute(sql)
        mydb.commit()
        
        return "ok"    


api.add_resource(DiseasePrediction, '/disease_prediction/<symptoms>')
api.add_resource(GetDoctor, '/get_doctor/<disease>')
api.add_resource(GetSlot, '/get_slot/<doctor_id>')
api.add_resource(AddSlot, '/add_slot/<name>/<address>/<contact_number>/<disease>/<doctor>/<slot>/<transaction_id>/<doctor_id>/<slot_id>/<current_date>')

if __name__ == '__main__':
    app.run(host='0.0.0.0')
    # print (DiseasePrediction.get("headache"))
    # print (DiseasePrediction.get("s1"))
    # print (DiseasePrediction.get("s1,s2"))
    # print (DiseasePrediction.get("pain,mass of body structure,lesion,cushingoid facies,cushingoid habitus,"
    #                              "emphysematous change"))
