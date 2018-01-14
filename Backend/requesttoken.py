import requests

from d7a.alp.command import Command
from d7a.alp.interface import InterfaceType
from d7a.alp.operands.interface_configuration import InterfaceConfiguration
from d7a.d7anp.addressee import Addressee, IdType
from d7a.system_files.dll_config import DllConfigFile
from d7a.system_files.file import File
from tb_api_client import swagger_client
from tb_api_client.swagger_client import ApiClient,Configuration
from d7a.sp.configuration import Configuration as D7Config

import jsonpickle
import json


# This script is designed to request a new API-token for our RPC calls, may the current one expire

url = "http://thingsboard.idlab.uantwerpen.be:8080/api/auth/login"
data = '{"username":"student@lopow-coaw-lab.uantwerpen.be", "password":"student"}'
headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
r = requests.post(url, data=data, headers=headers)
jwt_token = r.json()['token']
print "Bearer "+ jwt_token
