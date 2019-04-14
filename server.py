import json

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


api.add_resource(DiseasePrediction, '/disease_prediction/<symptoms>')

if __name__ == '__main__':
    app.run()
    # print (DiseasePrediction.get("headache"))
    # print (DiseasePrediction.get("s1"))
    # print (DiseasePrediction.get("s1,s2"))
    # print (DiseasePrediction.get("pain,mass of body structure,lesion,cushingoid facies,cushingoid habitus,"
    #                              "emphysematous change"))
