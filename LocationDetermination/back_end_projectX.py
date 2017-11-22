# The back-end of the project. It subscribes to an MQTT topic to which the GWs publish their data. The back-end filters
# the data from our node (what if we provide a topic per node on the MQTT server, that would certainly ease development).
# It then matches this data to the database. Once the closest match has been found we can check if this closest match is
# located within the allowed perimeter. If so no action must be taken. If not the node must be notified that it is
# outside of the allowed perimter and should be notified of this fact.

import paho.mqtt.client as mqtt
import json
import numpy
import time
import requests
from operator import itemgetter

node_id = "43373134003e0041"
gateways = {"f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8": "AP1", "43e01b20-b967-11e7-bebc-85e6dd10a2e8": "AP2", "b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8": "AP3", "c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8": "AP4"}
current_reading = [0]*4;#[link_budget_A, link_budget_B, link_budget_C]
fingerprint_gateway_indiches = {"AP1": 0, "AP2": 1, "AP3": 2, "AP4": 3}
amount_of_locations = 8
readings_by_location = [[] for i in range(amount_of_locations)]
k = 3

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code " + str(rc))
    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("/localisation/#")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    global counter
    msg_payload = str(msg.payload)# convert msg.payload to string for further use
    if json.loads(msg_payload)["node"] == node_id:# Only process messages from our own node
        # first determine the index of the "current_reading" variable
        print json.loads(msg_payload)
        fingerprint_gateway_index = fingerprint_gateway_indiches[gateways[json.loads(msg_payload)["gateway"]]]
        # once determined, store the link budget of the message in the appropriate location within "current_reading"
        link_budget = json.loads(msg_payload)["link_budget"]
        current_reading[fingerprint_gateway_index] = link_budget
        # need to implement a feature that makes sure either all fields are filled, or after a timeout expires the
        # current_reading is considered as complete

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

#defining some MQTT parameters
client = mqtt.Client(protocol=mqtt.MQTTv31)
client.on_connect = on_connect
client.on_message = on_message

#starting the MQTT connection
client.username_pw_set("student", "cv1Dq6GXL9cqsStSHKp5")
client.connect("backend.idlab.uantwerpen.be", 1883, 60)
client.loop_start()

read_training_data()
while (True):
    timeout = time.time() + 5
    while time.time() < timeout:
        if isFull(current_reading):
            break
        time.sleep(0.1)
    print (current_reading)
    print ("location is:"+str(calculate_location(current_reading)))
    url = "http://thingsboard.idlab.uantwerpen.be:8080/api/v1/Zw3jC2MF6Tl9uFtqwptY/attributes"
    data = {'xPos': calculate_location(current_reading)}
    headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
    r = requests.post(url, data=json.dumps(data), headers=headers)
    time.sleep(2)







