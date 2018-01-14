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
from tb_api_client.swagger_client import ApiClient, Configuration
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
    debug = 1
    if debug:
        print(bcolors.OKBLUE + "\n[DEBUG] " + message + bcolors.ENDC)


def execute_rpc_command(device_id, json_alp_cmd):
    #cmd = {"method": "execute-alp-async", "params": jsonpickle.encode(json_alp_cmd), "timeout": 500}
    cmd = {"method": "execute-alp-async", "params": jsonpickle.encode(json_alp_cmd), "timeout": 500}
    path_params = {'deviceId': device_id}
    query_params = {}
    header_params = {'Accept': api_client.select_header_accept(['*/*']),
                     'Content-Type': api_client.select_header_content_type(['application/json'])}
    # Authentication setting
    auth_settings = ['X-Authorization']
    return api_client.call_api('/api/plugins/rpc/oneway/{deviceId}', 'POST',
                               path_params,
                               query_params,
                               header_params,
                               body=cmd,
                               post_params=[],
                               files={},
                               response_type='DeferredResultResponseEntity',
                               auth_settings=auth_settings,
                               async=False)


def set_gps(GPS):
    characters = [0x80, 0x81]  # 0 = GPS off -> 0x30, 1 = GPS on -> 0x31
    cmd = Command.create_with_return_file_data_action(0x40, [0x0A, 0x32, characters[GPS], 0X0D], InterfaceType.D7ASP,
                                                      D7Config(
                                                          addressee=Addressee(access_class=0x11, id_type=IdType.NOID)))

    execute_rpc_command("43e01b20-b967-11e7-bebc-85e6dd10a2e8", cmd)
    debug("GPS was set to " + str(GPS) + " through RPC")
    push_to_tb({"gps": GPS})
    for i in range(0, 20):
        cmd = Command.create_with_return_file_data_action(0x40, [0x0A, 0x32, characters[GPS], 0X0D],
                                                          InterfaceType.D7ASP,
                                                          D7Config(
                                                              addressee=Addressee(access_class=0x11,
                                                                                  id_type=IdType.NOID)))
        execute_rpc_command("43e01b20-b967-11e7-bebc-85e6dd10a2e8", cmd)
        execute_rpc_command("f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8", cmd)
        execute_rpc_command("b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8", cmd)
        execute_rpc_command("427ab180-f79e-11e7-8c87-85e6dd10a2e8", cmd)
        time.sleep(0.5)


def enable_gps():
    set_gps(1)


def disable_gps():
    set_gps(0)


#   Configure the API-client for calls to Thingsboard
def init_api():
    api_client_config = Configuration()
    api_client_config.host = "http://thingsboard.idlab.uantwerpen.be:8080"
    api_client_config.api_key[
        'X-Authorization'] = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdHVkZW50QGxvcG93LWNvYXctbGFiLnVhbnR3ZXJwZW4uYmUiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sInVzZXJJZCI6IjZjYzYzZTQwLWNhY2MtMTFlNy05ZjFiLTg1ZTZkZDEwYTJlOCIsImVuYWJsZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiJmNTliMDU4MC1iNTA5LTExZTctYWIxYS04NWU2ZGQxMGEyZTgiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIiwiaXNzIjoidGhpbmdzYm9hcmQuaW8iLCJpYXQiOjE1MTU1MTAzOTEsImV4cCI6MTUyNDUxMDM5MX0.Nriym2JgmXVKB0VnkV58B9aiTm7SOwpJI3g52Nq_Lr7sHEhZIyMGUzYUV5fXBN8jOmxhi8B8igFeOzIf82nkOg"
    api_client_config.api_key_prefix['X-Authorization'] = 'Bearer'
    api_client = ApiClient(api_client_config)
    return api_client;


#   Route the incoming MQTT-messages to their appropriate handlers
def on_message(client, userdata, msg):
    # Only process messages from our own node
    msg_payload = str(msg.payload);
    if msg.topic == "/localisation/DASH7":
        if json.loads(msg_payload)["node"] == node_id:
            handle_incoming_dash7(msg)
    elif msg.topic == "/loriot/":
        debug("Incoming loriot")
        if json.loads(msg_payload)["EUI"] == "BE7A000000001B95":
            handle_incoming_lora(msg)


# Handle incoming Dash7 message for indoor localisation. Basically stores link budget in an array
def handle_incoming_dash7(message):
    msg_payload = str(message.payload)  # convert msg.payload to string for further use
    # first determine the index of the "current_reading" variable
    fingerprint_gateway_index = fingerprint_gateway_indiches[gateways[json.loads(msg_payload)["gateway"]]]
    # once determined, store the link budget of the message in the appropriate location within "current_reading"
    link_budget = json.loads(msg_payload)["link_budget"]
    current_reading[fingerprint_gateway_index] = link_budget
    # need to implement a feature that makes sure either all fields are filled, or after a timeout expires the
    # current_reading is considered as complete


#   Handle incoming LoraWAN message, read in GPS data and push to ThingsBoard. If we're in a safe location, disable GPS
def handle_incoming_lora(message):
    debug("Handling LoRa")
    jsondata = json.loads(str(message.payload))["data"].decode('hex')
    locationdata = str(jsondata).split("|")
    latdegreesminutes = locationdata[0].split(";")#dd;mm;.mmmm dd
    lat = float(latdegreesminutes[0])+float(float(latdegreesminutes[1])/60)
    longdegreesminutes = locationdata[1].split(";")  # dd;mm;.mmmm dd
    long = float(longdegreesminutes[0]) + float(float(longdegreesminutes[1]) / 60)
    hdop = float(locationdata[2]);
    data = {'lat': lat, 'long': long, 'accuracy': hdop}
    push_to_tb(data)
    if is_safe:
        disable_gps()
        debug("User is in safe area. Disabling GPS...")


# Post attributes to our ThingsBoard device. Data must be a json array
def push_to_tb(data):
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
                        body=data,
                        post_params=[],
                        files={},
                        response_type='DeferredResultResponseEntity',
                        auth_settings=auth_settings,
                        async=True)
    debug("Pushed attributes to TB: " + str(data))


#   Init the MQTT-client
def init_mqtt():
    client = mqtt.Client(protocol=mqtt.MQTTv31)
    client.username_pw_set("student", "cv1Dq6GXL9cqsStSHKp5")
    client.connect("backend.idlab.uantwerpen.be", 1883, 60)
    client.subscribe("/localisation/#")
    client.subscribe("/loriot/#")
    client.on_message = on_message
    client.loop_forever()
    debug("MQTT has been initialized")


#   All the Dash7 localisation stuff
def start_dash7_localisation():
    debug("Starting Dash7 localisation")
    global current_reading
    global fingerprint_gateway_indiches
    global gateways
    fingerprint_gateway_indiches = {"AP1": 0, "AP2": 1, "AP3": 2, "AP4": 3}
    gateways = {"f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8": "AP1", "43e01b20-b967-11e7-bebc-85e6dd10a2e8": "AP2",
                "b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8": "AP3", "427ab180-f79e-11e7-8c87-85e6dd10a2e8": "AP4"}
    amount_of_locations = 93
    k = 3
    readings_by_location = [[] for i in range(amount_of_locations)]
    training_database = json.load(open("data.json"))
    for j in range(0, amount_of_locations):
        for i in range(0, len(training_database)):
            if j == training_database[i]["location"]:
                readings_by_location[j].append([training_database[i]["gateway0"], training_database[i]["gateway1"],
                                                training_database[i]["gateway2"], training_database[i]["gateway3"]])

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
        timeout = time.time() + 15
        current_reading = [0] * 4
        while time.time() < timeout:
            if isFull(current_reading):
                break
            time.sleep(0.1)
        print(current_reading)
        zerocount = 0
        for i in range(0, len(current_reading)):
            if current_reading[i] == 0:
                zerocount += 1
        if zerocount > 1:
            print("More than 1 reading is 0, disregard reading")
        else:
            location = calculate_location(current_reading)
            if dangerous_locations.__contains__(location):
                debug("User is in dangerous area. Enabling GPS...")
                enable_gps()
                is_safe = 0
            else:
                if is_safe == 0:
                    set_gps(0)
                    debug("Safe again, disabling GPS")
                is_safe = 1
            data = {'xPos': location, 'budgetA': current_reading[0],
                    'budgetB': current_reading[1], 'budgetC': current_reading[2], 'budgetD': current_reading[3], }
            push_to_tb(data);
        time.sleep(2)


# ThingsBoard device where to push location data to.
TB_device = "Zw3jC2MF6Tl9uFtqwptY"
is_safe = 1;
# Node ID whom we can trust MQTT-messages from
node_id = "4337313400340031"
dangerous_locations = [0,1,2,3,4,5,6,7, 73, 74, 75, 76 ,77, 78 ,79 , 80, 81, 82, 83, 84, 85, 86 ,87 ,88, 89, 90, 91, 92, 93];
api_client = init_api()

threading.Thread(name='dash7Localisation', target=start_dash7_localisation).start()
init_mqtt()
time.sleep(1)
