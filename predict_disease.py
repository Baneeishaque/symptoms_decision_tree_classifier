import numpy as np
import pandas as pd

import disease_prediction_api

columns = ['Source', 'Target', 'Weight']
data = pd.read_csv("data/dataset_clean.csv", names=columns, encoding="ISO-8859-1")
data_frame = pd.DataFrame(data)
target_data_frame = pd.get_dummies(data_frame.Target)
source_data_frame = data_frame['Source']
disease_symptoms_data_frame = pd.concat([source_data_frame, target_data_frame], axis=1)
disease_symptoms_data_frame.drop_duplicates(keep='first', inplace=True)
columns = disease_symptoms_data_frame.columns
columns = columns[1:]
features = columns
feature_dict = {}
for i, f in enumerate(features):
    feature_dict[f] = i

dummy_sample_x = [0 for i in range(len(features))]
dummy_sample_x = np.matrix(dummy_sample_x)

for symptom in range(4):
    input_symptom = input("input symptom from above values ONLY >>> ")
    sample = [1 if i == int(feature_dict[input_symptom]) else 0 for i in range(len(features))]
    sample_x = np.matrix(np.array(sample).reshape(1, len(sample)))
    dummy_sample_x = dummy_sample_x + sample_x

print(disease_prediction_api.get_disease(dummy_sample_x))
