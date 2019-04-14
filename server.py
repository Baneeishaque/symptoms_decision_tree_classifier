import json

import numpy as np
from flask import Flask
from flask_restful import Resource, Api

import disease_prediction_api

app = Flask(__name__)
api = Api(app)


class DiseasePrediction(Resource):
    @staticmethod
    def get(single_symptom):
        # return disease

        # columns = ['Source', 'Target', 'Weight']
        # data = pd.read_csv("data/dataset_clean.csv", names=columns, encoding="ISO-8859-1")
        # data_frame = pd.DataFrame(data)
        # target_data_frame = pd.get_dummies(data_frame.Target)
        # source_data_frame = data_frame['Source']
        # disease_symptoms_data_frame = pd.concat([source_data_frame, target_data_frame], axis=1)
        # disease_symptoms_data_frame.drop_duplicates(keep='first', inplace=True)
        # columns = disease_symptoms_data_frame.columns
        # columns = columns[1:]
        # features = columns
        # feature_dict = {}
        # for i, f in enumerate(features):
        #     feature_dict[f] = i

        with open('data/features.json') as json_file:
            feature_dict = json.load(json_file)

        sample = [1 if i == int(feature_dict[single_symptom]) else 0 for i in range(len(feature_dict))]
        sample_x = np.matrix(np.array(sample).reshape(1, len(sample)))
        return disease_prediction_api.get_disease(sample_x)


api.add_resource(DiseasePrediction, '/disease_prediction/<single_symptom>')

if __name__ == '__main__':
    app.run()
    # print (DiseasePrediction.get("headache"))
