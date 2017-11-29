import paho.mqtt.client as mqtt
import itertools
import sys
import time
import json
from datetime import datetime


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


gateways = ["f1f7e740-b8b0-11e7-bebc-85e6dd10a2e8","43e01b20-b967-11e7-bebc-85e6dd10a2e8","b6b48ad0-b95a-11e7-bebc-85e6dd10a2e8","c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8"];
nodes = [];

MESSAGE_INTERVAL_TIMEOUT = 500;

selectedNode = -1;
fingerprintsPerPoint = -1;
requestedLocations = -1;

client = mqtt.Client("ivan", clean_session=True, userdata=None, protocol=mqtt.MQTTv31)
client.username_pw_set("student", "cv1Dq6GXL9cqsStSHKp5")
analyze_timeout = 10
last_timestamp = 0;
filling_rssi_list = [];
full_rssi_list = [];

def fingerprinting_message(client, userdata, rawMessage):
    global last_timestamp;
    global full_rssi_list;
    global filling_rssi_list;
    message = decodeRawMessage(rawMessage);
    if message["node"] == selectedNode: ## If the message is sent by our node...
        gateway_index = gateways.index(message["gateway"]);
        if filling_rssi_list[gateway_index] == 0:
            filling_rssi_list[gateway_index] = int(message["link_budget"]);

def decodeRawMessage(message):
    return json.loads(str(message.payload.decode('utf-8')))

def analyze_message(client, userdata, message):
    global analyze_timeout;
    j = json.loads(str(message.payload.decode("utf-8")))
    if j["node"] not in nodes:
        nodes.append(j["node"]);
        analyze_timeout = 10;
    if j["gateway"] not in gateways:
        gateways.append(j["gateway"]);
        analyze_timeout = 10;
    if analyze_timeout > 0:
        analyze_timeout -= 1;


def waitForNetworkAnalyze():
    global analyze_timeout;
    for c in itertools.cycle(['|', '/', '-', '\\']):
        if analyze_timeout <= 0:
            break
        sys.stdout.write('\r' + bcolors.OKBLUE + 'Scanning MQTT-network for nodes and gateways. (Walking around with node may be needed) ' + c)
        sys.stdout.flush()
        time.sleep(0.1);
    sys.stdout.write('\rDone!\n')
    print bcolors.OKBLUE + "Detected "+ str(len(gateways)) + " gateways: " + bcolors.ENDC;
    for gateway in gateways:
        print bcolors.OKGREEN + "   * "+gateway;
    print bcolors.OKBLUE + "Detected "+ str(len(nodes)) + " node(s): " + bcolors.ENDC;
    for node in nodes:
        print bcolors.OKGREEN + "   * "+node;
    print '\n';


def selectNode():
    global selectedNode;
    while selectedNode == -1:
        print bcolors.OKBLUE + "\nPlease select the node you wish to use for training: " + bcolors.ENDC;
        for idx, node in enumerate(nodes):
            print bcolors.OKGREEN + "    " + str(idx) + ". " + node + bcolors.ENDC
        nodeID = raw_input("\n"+bcolors.OKBLUE + "Node ID: "+bcolors.ENDC);
        try:
            selectedNode = nodes[int(nodeID)]
        except ValueError:
            print(bcolors.FAIL + "Please enter a valid node-ID..." + bcolors.ENDC)
        except IndexError:
            print(bcolors.FAIL + "Please enter an existing node-ID..." + bcolors.ENDC)

def selectFingerprintsPP():
    global fingerprintsPerPoint;
    while fingerprintsPerPoint == -1:
        amountStr = raw_input("\n"+bcolors.OKBLUE + "How many fingerprints have to be taken per location: "+bcolors.ENDC);
        try:
            amount = int(amountStr)
        except ValueError:
            print(bcolors.FAIL + "Please enter a number" + bcolors.ENDC)
            continue
        if amount > 0:
            fingerprintsPerPoint = amount
        else:
            print(bcolors.FAIL + "Please enter a number above 0" + bcolors.ENDC)
def selectLocationAmount():
    global requestedLocations;
    while requestedLocations == -1:
        amountStr = raw_input("\n"+bcolors.OKBLUE + "How many locations are to be fingerprinted: "+bcolors.ENDC);
        try:
            amount = int(amountStr)
        except ValueError:
            print(bcolors.FAIL + "Please enter a number" + bcolors.ENDC)
            continue
        if amount > 0:
            requestedLocations = amount
        else:
            print(bcolors.FAIL + "Please enter a number above 0" + bcolors.ENDC)

def isFull(fingerList):
    for rssi in fingerList:
        if rssi == 0:
            return 0
    return 1


data = []
fingerprintid = 0;
def takeFingerprint():
    global fingerprintid
    global filling_rssi_list
    for index, gateway in enumerate(gateways):
        filling_rssi_list[index] = 0;
    timeout = time.time() + 10
    while time.time() < timeout:
        sys.stdout.write('\r' + bcolors.OKBLUE)
        for rssi in filling_rssi_list:
            sys.stdout.write("|  " + str(rssi).ljust(3))
        sys.stdout.write("|");
        sys.stdout.flush()
        if isFull(filling_rssi_list):
            break;
        else:
            time.sleep(0.01);

    fingerprint = {"id": fingerprintid,
                   "location": currentLocation,
                   }
    hasnull = 0;
    for idx,rssi in enumerate(filling_rssi_list):
        fingerprint.update({"gateway"+str(idx) : rssi})
        if rssi == 0:
            hasnull = 1

    if hasnull == 0:
        fingerprintid += 1;
        data.append(fingerprint);
    else:
        print(bcolors.FAIL +" - Discarded" + bcolors.ENDC)
        takeFingerprint()
    sys.stdout.write(bcolors.OKBLUE+"\n");
    











print "Connecting to MQTT-broker..." + bcolors.ENDC;
client = mqtt.Client("ivan", clean_session=True, userdata=None, protocol=mqtt.MQTTv31)
client.connect("backend.idlab.uantwerpen.be")
print "Subscribing to /localisation/#..." + bcolors.ENDC;
client.subscribe("/localisation/#")
client.on_message=analyze_message
client.loop_start();
waitForNetworkAnalyze();
if len(nodes) == 0 and len(gateways) == 0:
    print bcolors.FAIL + "Error: No nodes or gateways have been detected. Is the MQTT-server online?"+ bcolors.ENDC;
    quit();
elif len(nodes) == 0:
    print bcolors.FAIL + "Error: No nodes have been detected. Is the node powered on?"+ bcolors.ENDC;
    quit();
if len(gateways) == 0:
    print bcolors.FAIL + "Error: No gateways have been detected. Are the gateways online?"+ bcolors.ENDC;
    quit();
for g in gateways: ## Fill RSSI fingerprinting list with 0's
    filling_rssi_list.append(0);
selectNode()
selectFingerprintsPP()
selectLocationAmount()
client.on_message=fingerprinting_message
print bcolors.BOLD+bcolors.OKGREEN + "\nReady to start fingerprinting! Press enter to start..." + bcolors.ENDC;
raw_input('');

currentLocation = 0;

for x in range(0, requestedLocations):
    print bcolors.BOLD+bcolors.OKGREEN + "\nFingerprinting location "+str(1+currentLocation) + "/" + str(requestedLocations) + bcolors.ENDC;
    for x in range(0, fingerprintsPerPoint):
        takeFingerprint()
        with open('data.json', 'w') as outfile:
            json.dump(data, outfile)
    currentLocation += 1
    if currentLocation < requestedLocations:
        print bcolors.BOLD + bcolors.OKGREEN + "\nDone! Press enter to take next fingerprint..." + bcolors.ENDC;
        raw_input('')
    else:
        break
with open('data.json', 'w') as outfile:
    json.dump(data, outfile)
print bcolors.BOLD + bcolors.OKGREEN + "\nDone! Data written to data.json" + bcolors.ENDC;











