#!/usr/bin/env python

from __future__ import print_function
import argparse
import pprint
import time
import threading
import jsonpickle
import json
from d7a.alp.command import Command
from d7a.alp.interface import InterfaceType
from d7a.d7anp.addressee import Addressee, IdType
from tb_api_client.swagger_client import ApiClient,Configuration
from d7a.sp.configuration import Configuration as D7Config
import paho.mqtt.client as mqtt
import numpy
from operator import itemgetter

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    STRIKETHROUGH = '\0336'

def debug(message):
    debug = 1;
    if debug:
        print(bcolors.OKBLUE + "\n[DEBUG] "+message + bcolors.ENDC);

def execute_rpc_command(self, device_id, json_alp_cmd):
  cmd = {"method": "execute-alp-async", "params":  jsonpickle.encode(json_alp_cmd), "timeout": 500 }
  path_params = { 'deviceId': device_id }
  query_params = {}
  header_params = {}
  header_params['Accept'] = self.api_client.select_header_accept(['*/*'])
  header_params['Content-Type'] = self.api_client.select_header_content_type(['application/json'])

  # Authentication setting
  auth_settings = ['X-Authorization']
  return self.api_client.call_api('/api/plugins/rpc/oneway/{deviceId}', 'POST',
                                  path_params,
                                  query_params,
                                  header_params,
                                  body=cmd,
                                  post_params=[],
                                  files={},
                                  response_type='DeferredResultResponseEntity',
                                  auth_settings=auth_settings,
                                  async=False)
def setGPS(GPS):
    characters = [0x30, 0x31] # 0 = GPS off -> 0x30, 1 = GPS on -> 0x31
    cmd = Command.create_with_return_file_data_action(0x0A, [characters[GPS], 0X0D], InterfaceType.D7ASP, D7Config(
        addressee=Addressee(access_class=0x11, id_type=IdType.NOID)))
    execute_rpc_command("c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8", cmd)
    debug("GPS was set to "+GPS+" through RPC")

def enableGPS(self):
    setGPS(1)
def disableGPS(self):
    setGPS(0)

#   Configure the API-client for calls to Thingsboard
def initAPI(self):
    api_client_config = Configuration()
    api_client_config.host = "http://thingsboard.idlab.uantwerpen.be:8080"
    api_client_config.api_key['X-Authorization'] = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdHVkZW50QGxvcG93LWNvYXctbGFiLnVhbnR3ZXJwZW4uYmUiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sInVzZXJJZCI6IjZjYzYzZTQwLWNhY2MtMTFlNy05ZjFiLTg1ZTZkZDEwYTJlOCIsImVuYWJsZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiJmNTliMDU4MC1iNTA5LTExZTctYWIxYS04NWU2ZGQxMGEyZTgiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIiwiaXNzIjoidGhpbmdzYm9hcmQuaW8iLCJpYXQiOjE1MTI1NTk3MTgsImV4cCI6MTUyMTU1OTcxOH0.LX6GFJjJynmC2egjLniHtihCwE69u-LdLKwKUuzZyDyA5_vlsIBMxJyfdeEdx1DjTR4ecw_r0hlFnqrUBFQpNg"
    api_client_config.api_key_prefix['X-Authorization'] = 'Bearer'
    api_client = ApiClient(api_client_config);
    return api_client;

#   Route the incoming MQTT-messages to their appropriate handlers
def on_message(client, userdata, msg):
    # Only process messages from our own node
    msg_payload = str(msg.payload);
    debug("Received MQTT message from "+json.loads(msg_payload)["node"]+" on topic "+msg.topic)
    if json.loads(msg_payload)["node"] == node_id:
        if msg.topic == "/localisation":
            handleIncomingDash7(msg)
        elif msg.topic == "/loriot":
            handleIncomingLora(msg)

#   Handle incoming Dash7 message for indoor localisation. Basically stores link budget in an array
def handleIncomingDash7(message):
    msg_payload = str(message.payload)  # convert msg.payload to string for further use
    # first determine the index of the "current_reading" variable
    fingerprint_gateway_index = fingerprint_gateway_indiches[gateways[json.loads(msg_payload)["gateway"]]]
    # once determined, store the link budget of the message in the appropriate location within "current_reading"
    link_budget = json.loads(msg_payload)["link_budget"]
    current_reading[fingerprint_gateway_index] = link_budget
    # need to implement a feature that makes sure either all fields are filled, or after a timeout expires the
    # current_reading is considered as complete

#   Handle incoming LoraWAN message, read in GPS data and push to ThingsBoard. If we're in a safe location, disable GPS
def handleIncomingLora(message):
    locationdata = str(message.payload).split(";")
    data = {'lat': [locationdata[0]], 'long': locationdata[1]}
    pushToThingsBoard(data)
    if is_safe:
        disableGPS()

#   Post attributes to our ThingsBoard device. Data must be a json array
def pushToThingsBoard(data):
    query_params = {}
    header_params = {}
    path_params = {'deviceId': TB_device, }
    header_params['Accept'] = api_client.select_header_accept(['*/*'])
    header_params['Content-Type'] = api_client.select_header_content_type(['application/json'])
    auth_settings = ['X-Authorization']
    api_client.call_api('/api/v1/{deviceId}/attributes', 'POST',
                        path_params,
                        query_params,
                        header_params,
                        body=json.dumps(data),
                        post_params=[],
                        files={},
                        response_type='DeferredResultResponseEntity',
                        auth_settings=auth_settings,
                        async=True)

def enableGPS():
    cmd = Command.create_with_return_file_data_action(0x0A, [0x30, 0x31, 0X0D], InterfaceType.D7ASP, D7Config(
        addressee=Addressee(access_class=0x11, id_type=IdType.NOID)))


#   Init the MQTT-client
def initMQTT():
    client = mqtt.Client(protocol=mqtt.MQTTv31)
    client.username_pw_set("student", "cv1Dq6GXL9cqsStSHKp5")
    client.connect("backend.idlab.uantwerpen.be", 1883, 60)
    client.subscribe("/localisation/#")
    client.subscribe("/loriot/#")
    client.on_message = on_message

#   All the Dash7 localisation stuff
def startDash7Localisation(self):
    global current_reading
    global fingerprint_gateway_indiches
    global gateways
    fingerprint_gateway_indiches = {"AP1": 0, "AP2": 1, "AP3": 2, "AP4": 3}
    gateways = {"f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8": "AP1", "43e01b20-b967-11e7-bebc-85e6dd10a2e8": "AP2",
                "b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8": "AP3", "c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8": "AP4"}
    amount_of_locations = 93
    k = 3
    readings_by_location = [[] for i in range(amount_of_locations)]
    current_reading = [0] * 4;  # [link_budget_A, link_budget_B, link_budget_C, link_budget_D]

    #   Checks if our array is fully filled with RSSI data
    def isFull(current_reading):
        for rssi in current_reading:
            if rssi == 0:
                return 0
        return 1

    #   Calculates the location using kNN
    def calculate_location(current_reading):
        distance_tuple_list = []
        temp = [[] for i in range(amount_of_locations)]
        for i in range(0, amount_of_locations):
            for j in range(0, len(readings_by_location[i])):
                temp[i].append(numpy.linalg.norm(numpy.subtract(numpy.asarray(readings_by_location[i][j], dtype=int),
                                                                numpy.asarray(current_reading, dtype=int)), axis=0))
        for i in range(0, len(temp)):
            for j in range(0, len(temp[i])):
                distance_tuple_list.append((i, temp[i][j]))
        # sorts based on the comparison metric column.
        distance_tuple_list.sort(key=itemgetter(1))

        location_count = [0 for i in range(amount_of_locations)]
        for i in range(0, k):
            for j in range(0, len(location_count)):
                if distance_tuple_list[i][0] == j:
                    location_count[j] += 1
        # by definition of kNN, the nearest location is the location with the highest location count.
        return location_count.index(max(location_count))

    #   Infinite loop
    while 1:
        timeout = time.time() + 5
        current_reading = [0] * 4
        while time.time() < timeout:
            if isFull(current_reading):
                break
            time.sleep(0.1)
        print(current_reading)
        zerocount = 0
        for i in len(current_reading):
            if current_reading[i] == 0:
                zerocount += 1
        if zerocount > 1:
            print("More than 1 reading is 0, disregard reading")
        else:
            location = calculate_location(current_reading)
            if dangerous_locations.__contains__(location):
                enableGPS()
                is_safe = 0
            else:
                is_safe = 1
            data = {'xPos': location, 'budgetA': current_reading[0],
                    'budgetB': current_reading[1], 'budgetC': current_reading[2], 'budgetD': current_reading[3], }
            pushToThingsBoard(data);


# ThingsBoard device where to push location data to.
TB_device = "9a0b5ab0-cf78-11e7-88dc-85e6dd10a2e8"
is_safe = 1;
# Node ID whom we can trust MQTT-messages from
node_id = "43373134003e0041"
dangerous_locations = [1,2,3,4];
threading.Thread(name='dash7Localisation', target=startDash7Localisation()).start()
api_client = initAPI()
initMQTT()






