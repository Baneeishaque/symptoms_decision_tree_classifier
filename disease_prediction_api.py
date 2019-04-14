import pickle

import numpy as np
import pandas as pd


def get_disease(sample):
    # load the model from disk
    loaded_model = pickle.load(open('models/Disease_Symptom_Knowledge_Database_pickle_model.sav', 'rb'))
    return loaded_model.predict(sample)[0]


if __name__ == '__main__':
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
    sample_x = [1 if i == feature_dict['headache'] else 0 for i in range(len(features))]
    print("Length of Sample : %s" % len(sample_x))
    sample_x6 = np.array(sample_x).reshape(1, len(sample_x))
    print(get_disease(sample_x6))
