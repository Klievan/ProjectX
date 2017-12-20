#!/usr/bin/env python

from __future__ import print_function
import argparse
import pprint
import time

import jsonpickle
import json
from d7a.alp.command import Command
from d7a.alp.interface import InterfaceType
from d7a.d7anp.addressee import Addressee, IdType
from tb_api_client.swagger_client import ApiClient,Configuration
from d7a.sp.configuration import Configuration as D7Config
import paho.mqtt.client as mqtt





def execute_rpc_command(self, device_id, json_alp_cmd):
  # TODO the device_api_controller_api.post_rpc_request_using_post() proxy does not seem to work unfortunately
  # we will do it by a manual POST to /api/plugins/rpc/oneway/ , which is the route specified
  # in the documentation
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

def broadcastStatus(self):
  cmd = Command.create_with_return_file_data_action(0x0A,[0x30,0x31, 0X0D],InterfaceType.D7ASP, D7Config(addressee=Addressee(access_class=0x11, id_type=IdType.NOID)))
  execute_rpc_command("c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8", cmd)

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
    if msg.topic == "/localisation":
        handleIncomingDash7(handleIncomingDash7(msg))
    elif msg.topic == "/loriot":
        handleIncomingLora(msg)

#   Handle incoming Dash7 message for indoor localisation
def handleIncomingDash7(message):
    print("test");

#   Handle incoming LoraWAN message, read in GPS data and push to ThingsBoard.
def handleIncomingLora(message):
    locationdata = str(message.payload).split(";")
    query_params = {}
    header_params = {}
    path_params = { 'deviceId': TB_device, }
    header_params['Accept'] = api_client.select_header_accept(['*/*'])
    header_params['Content-Type'] = api_client.select_header_content_type(['application/json'])
    data = {'lat': [locationdata[0]], 'long': locationdata[1]}
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


#   Init the MQTT-client
def initMQTT(self):
    client = mqtt.Client(protocol=mqtt.MQTTv31)
    client.username_pw_set("student", "cv1Dq6GXL9cqsStSHKp5")
    client.connect("backend.idlab.uantwerpen.be", 1883, 60)
    client.subscribe("/localisation/#")
    client.subscribe("/loriot/#")
    client.on_message = on_message

# ThingsBoard device where to push location data to.
TB_device = "9a0b5ab0-cf78-11e7-88dc-85e6dd10a2e8"
api_client = initAPI()
initMQTT()




enableGPS = 0;





