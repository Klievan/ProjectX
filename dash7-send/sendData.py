#!/usr/bin/env python

from __future__ import print_function
import argparse
import pprint

import jsonpickle

from d7a.alp.command import Command
from d7a.alp.interface import InterfaceType
from d7a.alp.operands.interface_configuration import InterfaceConfiguration
from d7a.d7anp.addressee import Addressee, IdType
from d7a.system_files.dll_config import DllConfigFile
from tb_api_client import swagger_client
from tb_api_client.swagger_client import ApiClient,Configuration
from d7a.sp.configuration import Configuration as D7Config



class GatewayCommandExample:
  def __init__(self):
    argparser = argparse.ArgumentParser()
    argparser.add_argument("-u", "--url", help="URL of the thingsboard server", default="http://thingsboard.idlab.uantwerpen.be:8080")


    self.config = argparser.parse_args()

    api_client_config = Configuration()
    api_client_config.host = self.config.url
    api_client_config.api_key['X-Authorization'] = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdHVkZW50QGxvcG93LWNvYXctbGFiLnVhbnR3ZXJwZW4uYmUiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sInVzZXJJZCI6IjZjYzYzZTQwLWNhY2MtMTFlNy05ZjFiLTg1ZTZkZDEwYTJlOCIsImVuYWJsZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiJmNTliMDU4MC1iNTA5LTExZTctYWIxYS04NWU2ZGQxMGEyZTgiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIiwiaXNzIjoidGhpbmdzYm9hcmQuaW8iLCJpYXQiOjE1MTI1NTk3MTgsImV4cCI6MTUyMTU1OTcxOH0.LX6GFJjJynmC2egjLniHtihCwE69u-LdLKwKUuzZyDyA5_vlsIBMxJyfdeEdx1DjTR4ecw_r0hlFnqrUBFQpNg"
    api_client_config.api_key_prefix['X-Authorization'] = 'Bearer'
    self.api_client = ApiClient(api_client_config)

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

  def run(self):
    cmd = Command.create_with_return_file_data_action(0x40,[0x40],InterfaceType.D7ASP, D7Config(addressee=Addressee(access_class=0x11, id_type=IdType.UID, id=0x43373134003e0041)))
    self.execute_rpc_command("c2c4ebd0-b95a-11e7-bebc-85e6dd10a2e8", cmd)


if __name__ == "__main__":
  GatewayCommandExample().run()
