# coding: utf-8

"""
    Thingsboard REST API

    For instructions how to authorize requests please visit <a href='http://thingsboard.io/docs/reference/rest-api/'>REST API documentation page</a>.

    OpenAPI spec version: 2.0
    Contact: info@thingsboard.io
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


from __future__ import absolute_import

import os
import sys
import unittest

import swagger_client
from swagger_client.rest import ApiException
from swagger_client.apis.device_api_controller_api import DeviceApiControllerApi


class TestDeviceApiControllerApi(unittest.TestCase):
    """ DeviceApiControllerApi unit test stubs """

    def setUp(self):
        self.api = swagger_client.apis.device_api_controller_api.DeviceApiControllerApi()

    def tearDown(self):
        pass

    def test_get_device_attributes_using_get(self):
        """
        Test case for get_device_attributes_using_get

        getDeviceAttributes
        """
        pass

    def test_post_device_attributes_using_post(self):
        """
        Test case for post_device_attributes_using_post

        postDeviceAttributes
        """
        pass

    def test_post_rpc_request_using_post(self):
        """
        Test case for post_rpc_request_using_post

        postRpcRequest
        """
        pass

    def test_post_telemetry_using_post(self):
        """
        Test case for post_telemetry_using_post

        postTelemetry
        """
        pass

    def test_reply_to_command_using_post(self):
        """
        Test case for reply_to_command_using_post

        replyToCommand
        """
        pass

    def test_subscribe_to_attributes_using_get(self):
        """
        Test case for subscribe_to_attributes_using_get

        subscribeToAttributes
        """
        pass

    def test_subscribe_to_commands_using_get(self):
        """
        Test case for subscribe_to_commands_using_get

        subscribeToCommands
        """
        pass


if __name__ == '__main__':
    unittest.main()
