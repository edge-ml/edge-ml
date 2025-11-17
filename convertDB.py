import os
import json
from pymongo import MongoClient
from bson.objectid import ObjectId
import boto3
import h5py
import numpy as np
from io import BytesIO
from tqdm import tqdm
from traceback import format_exc
from bson.objectid import ObjectId

FOLDER_PATH = "/Users/king/Desktop/EdgeMLLiveDB"


DATABASE_NAME = "Test"
DATABASE_BACKEND = "backend_dev"
DATABASE_DATASET_STORE = "dataset_store"


TS_COLLECTION_NAME = "db_data"
PROJECTS_COLLECTION_NAME = "projects"
LABELTYPES_COLLECTION_NAME = "labelTypes"
LABELDEFINITIONS_COLLECTION_NAME = "labelDefinitions"
DATASETS_COLLECTION_NAME = "datasets"

LABELINGS_COLLECTION_NAME = "labelings"

DATASET_ATTRIBUTES = ["_id", "timeSeries", "projectId", "name", "metaData", "timeSeries", "labelings", "userId"]
PROJECT_ATTRIBUTES = ["_id", "admin", "name", "users", "enableDeviceApi", "__v"]
TIMESERIES_ATTRIBUTES = ["_id", "start", "end", "unit", "name"]


s3BucketName = "edgeml"
access_key = "Hij24?H22LL"
secret_key = "YIL2438iiX!"
endpoint_url = "https://s3.teco.edu:7443/"


client = MongoClient('mongodb://localhost:27017/')
db = client[DATABASE_NAME]
db_backend = client[DATABASE_BACKEND]
db_dataset_store = client[DATABASE_DATASET_STORE]


TS_DATA = db["db_data"]
DB_LABELDEFINITIONS_OLD = db[LABELDEFINITIONS_COLLECTION_NAME]
DB_LABELTYPES_OLD = db[LABELTYPES_COLLECTION_NAME]
DB_PROEJCTS_OLD = db[PROJECTS_COLLECTION_NAME]
DB_DATASETS_OLD = db[DATASETS_COLLECTION_NAME]
DB_TIMESERIES_OLD = db[TS_COLLECTION_NAME]


DB_PROJECTS = db_backend[PROJECTS_COLLECTION_NAME]
DB_LABELINGS = db_dataset_store[LABELINGS_COLLECTION_NAME]
DB_DATASETS = db_dataset_store[DATASETS_COLLECTION_NAME]


# s3 = boto3.client(service_name='s3', endpoint_url=endpoint_url, aws_access_key_id=access_key, aws_secret_access_key=secret_key)
# s3.create_bucket(Bucket=s3BucketName)

# def save_series(id, time_arr, data_arr):
#     id = str(id)
#     buffer = BytesIO()
#     with h5py.File(buffer, 'w') as f:
#         f.create_dataset('time', data=time_arr)
#         f.create_dataset('data', data=data_arr)
#     buffer.seek(0)
#     s3.put_object(Bucket=s3BucketName, Key=id, Body=buffer.getvalue())


# def save_ts_data(ts):
#     data = ts["data"]
#     id = str(ts["_id"])


#     response = s3.list_objects_v2(Bucket=s3BucketName, Prefix=id)
#     if 'Contents' in response:
#         return

#     time = np.array([int(x["timestamp"]) for x in data])
#     values = np.array([float(x["datapoint"]) for x in data])
#     save_series(id, time, values)


# # Save time-series data to s3
# with open(os.path.join(FOLDER_PATH, "aura_live.datasets.json"), "r") as f_datasets:
#         datasets = json.loads(f_datasets.read())
#         for dataset in tqdm(datasets):
#             for ts_id in dataset["timeSeries"]:
#                 id = ts_id["$oid"]
#                 ts = TS_DATA.find_one({"_id": ObjectId(id)})
#                 try:
#                     save_ts_data(ts)
#                 except Exception as e:
#                     print(format_exc())


# Generate projects-database
# def convertObjectIds(data):
#     for key, value in data.items():
#         if isinstance(value, dict) and "$oid" in value:
#             data[key] = ObjectId(value["$oid"])
#     return data

# with open(os.path.join(FOLDER_PATH, "aura_live.projects.json"), "r") as f_projects:
#     projects = json.loads(f_projects.read())
#     for project in projects:
#         filtered_project = {key: value for key, value in project.items() if key in PROJECT_ATTRIBUTES}
#         filtered_project = convertObjectIds(filtered_project)
#         DB_PROJECTS.insert_one(filtered_project)

# Create database for the dataset-store


# Labelings
nameMap = {}
labelDefinitions = DB_LABELDEFINITIONS_OLD.find()
for labelDefinition in labelDefinitions:
    labelTypes = DB_LABELTYPES_OLD.find({"_id": {"$in": labelDefinition["labels"]}})
    project = DB_PROEJCTS_OLD.find_one({"labelDefinitions": labelDefinition["_id"]})["_id"]
    labelDefinition["labels"] = list(labelTypes)
    labelDefinition["projectId"] = ObjectId(project)
    if labelDefinition["name"] in nameMap and nameMap[labelDefinition["name"]] == project:
        print("duplicate", labelDefinition["name"])
        continue
    nameMap[labelDefinition["name"]] = project
    DB_LABELINGS.insert_one(labelDefinition)
                
# Datasets
# datasets = DB_DATASETS_OLD.find()
# for dataset in datasets:
#     try:
#         timeSeries = list(DB_TIMESERIES_OLD.find({"_id": {"$in": dataset["timeSeries"]}}))
#         dataset = {key: value for key, value in dataset.items() if key in DATASET_ATTRIBUTES}
#         timeSeries = [{key: value for key, value in x.items() if key in TIMESERIES_ATTRIBUTES} for x in timeSeries]
#         dataset["timeSeries"] = timeSeries
#         print(dataset["_id"])
#         project = DB_PROEJCTS_OLD.find_one({"datasets": ObjectId(dataset["_id"])})["_id"]
#         dataset["projectId"] = project
#         DB_DATASETS.insert_one(dataset)
#     except:
#         print(format_exc())
