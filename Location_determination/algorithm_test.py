# The back-end of the project. It subscribes to an MQTT topic to which the GWs publish their data. The back-end filters
# the data from our node (what if we provide a topic per node on the MQTT server, that would certainly ease development).
# It then matches this data to the database. Once the closest match has been found we can check if this closest match is
# located within the allowed perimeter. If so no action must be taken. If not the node must be notified that it is
# outside of the allowed perimter and should be notified of this fact.

import json
import numpy
import time
from operator import itemgetter

node_id = "43373134003e0041"
gateways = {"f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8": "AP1", "43e01b20-b967-11e7-bebc-85e6dd10a2e8": "AP2",
            "b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8": "AP3", "c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8": "AP4"}
current_reading = [13, 65, 75 ];#[link_budget_A, link_budget_B, link_budget_C] vast ingestled voor thuis te kunnen testen.
fingerprint_gateway_indiches = {"AP1": 0, "AP2": 1, "AP3": 2, "AP4": 3}
amount_of_locations = 8
readings_by_location = [[] for i in range(amount_of_locations)]
k = 3

def isFull(current_reading):
    for rssi in current_reading:
        if rssi == 0:
            return 0
    return 1

# Calculates the closest locaiont given k and a current_reading
def calculate_location(current_reading):
    distance_tuple_list = []
    temp = [[] for i in range(amount_of_locations)]
    for i in range(0, amount_of_locations):
        for j in range (0, len(readings_by_location[i])):
            temp[i].append(numpy.linalg.norm(numpy.subtract(numpy.asarray(readings_by_location[i][j], dtype=int ), numpy.asarray(current_reading, dtype = int)), axis=0))
    print(temp)
    for i in range(0, len(temp)):
        for j in range(0, len(temp[i])):
            distance_tuple_list.append((i, temp[i][j]))
    # sorts based on the comparison metric column.
    distance_tuple_list.sort(key=itemgetter(1))
    print distance_tuple_list

    location_count = [0 for i in range(amount_of_locations)]
    for i in range(0, k):
        for j in range(0, len(location_count)):
            if distance_tuple_list[i][0] == j:
                location_count[j] += 1
    # by definition of kNN, the nearest location is the location with the highest location count.
    print location_count
    return location_count.index(max(location_count))

# reads the trainingdata. This is however unsorted and just contains all the measurements.
# The trainingdatabase is further processed in training_database_per_location wich contains a list of
# readings for every location. (the Location is the index, the readings are the list in the array)
def read_training_data():
    global training_database
    global readings_by_location
    training_database = json.load(open("data.json"))
    for j in range(0, amount_of_locations):
        for i in range(0, len(training_database)):
            if j == training_database[i]["location"]:
                readings_by_location[j].append([training_database[i]["gateway0"], training_database[i]["gateway1"], training_database[i]["gateway2"]])

#training data inlezen
read_training_data()
#testen met testlocatie
print ("location is:"+str(calculate_location(current_reading)))







