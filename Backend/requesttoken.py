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


url = "http://thingsboard.idlab.uantwerpen.be:8080/api/auth/login"
data = '{"username":"student@lopow-coaw-lab.uantwerpen.be", "password":"student"}'
headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
r = requests.post(url, data=data, headers=headers)
jwt_token = r.json()['token']
print "Bearer "+ jwt_token
token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdHVkZW50QGxvcG93LWNvYXctbGFiLnVhbnR3ZXJwZW4uYmUiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sInVzZXJJZCI6IjZjYzYzZTQwLWNhY2MtMTFlNy05ZjFiLTg1ZTZkZDEwYTJlOCIsImVuYWJsZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiJmNTliMDU4MC1iNTA5LTExZTctYWIxYS04NWU2ZGQxMGEyZTgiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIiwiaXNzIjoidGhpbmdzYm9hcmQuaW8iLCJpYXQiOjE1MTI1NTk3MTgsImV4cCI6MTUyMTU1OTcxOH0.LX6GFJjJynmC2egjLniHtihCwE69u-LdLKwKUuzZyDyA5_vlsIBMxJyfdeEdx1DjTR4ecw_r0hlFnqrUBFQpNg"
rpc_url = "http://thingsboard.idlab.uantwerpen.be:8080/api/plugins/rpc/twoway/b3acfa00-b803-11e7-bebc-85e6dd10a2e8"
rpc_headers = {'Content-type': 'application/json', 'Accept': '/', 'X-Authorization': token}
cmd = Command.create_with_read_file_action_system_file(File(0x00,8),InterfaceType.HOST)
rpc_data = {"method": "execute-alp-async", "params":  jsonpickle.encode(cmd), "timeout": 500}
print rpc_data
r = requests.post(rpc_url, data=json.dumps(rpc_data), headers=rpc_headers)
print r.status_code
print r.text