# coding: utf-8

"""
    Thingsboard REST API

    For instructions how to authorize requests please visit <a href='http://thingsboard.io/docs/reference/rest-api/'>REST API documentation page</a>.

    OpenAPI spec version: 2.0
    Contact: info@thingsboard.io
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


from pprint import pformat
from six import iteritems
import re


class Asset(object):
    """
    NOTE: This class is auto generated by the swagger code generator program.
    Do not edit the class manually.
    """


    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'additional_info': 'str',
        'created_time': 'int',
        'customer_id': 'CustomerId',
        'id': 'AssetId',
        'name': 'str',
        'tenant_id': 'TenantId',
        'type': 'str'
    }

    attribute_map = {
        'additional_info': 'additionalInfo',
        'created_time': 'createdTime',
        'customer_id': 'customerId',
        'id': 'id',
        'name': 'name',
        'tenant_id': 'tenantId',
        'type': 'type'
    }

    def __init__(self, additional_info=None, created_time=None, customer_id=None, id=None, name=None, tenant_id=None, type=None):
        """
        Asset - a model defined in Swagger
        """

        self._additional_info = None
        self._created_time = None
        self._customer_id = None
        self._id = None
        self._name = None
        self._tenant_id = None
        self._type = None
        self.discriminator = None

        if additional_info is not None:
          self.additional_info = additional_info
        if created_time is not None:
          self.created_time = created_time
        if customer_id is not None:
          self.customer_id = customer_id
        if id is not None:
          self.id = id
        if name is not None:
          self.name = name
        if tenant_id is not None:
          self.tenant_id = tenant_id
        if type is not None:
          self.type = type

    @property
    def additional_info(self):
        """
        Gets the additional_info of this Asset.

        :return: The additional_info of this Asset.
        :rtype: str
        """
        return self._additional_info

    @additional_info.setter
    def additional_info(self, additional_info):
        """
        Sets the additional_info of this Asset.

        :param additional_info: The additional_info of this Asset.
        :type: str
        """

        self._additional_info = additional_info

    @property
    def created_time(self):
        """
        Gets the created_time of this Asset.

        :return: The created_time of this Asset.
        :rtype: int
        """
        return self._created_time

    @created_time.setter
    def created_time(self, created_time):
        """
        Sets the created_time of this Asset.

        :param created_time: The created_time of this Asset.
        :type: int
        """

        self._created_time = created_time

    @property
    def customer_id(self):
        """
        Gets the customer_id of this Asset.

        :return: The customer_id of this Asset.
        :rtype: CustomerId
        """
        return self._customer_id

    @customer_id.setter
    def customer_id(self, customer_id):
        """
        Sets the customer_id of this Asset.

        :param customer_id: The customer_id of this Asset.
        :type: CustomerId
        """

        self._customer_id = customer_id

    @property
    def id(self):
        """
        Gets the id of this Asset.

        :return: The id of this Asset.
        :rtype: AssetId
        """
        return self._id

    @id.setter
    def id(self, id):
        """
        Sets the id of this Asset.

        :param id: The id of this Asset.
        :type: AssetId
        """

        self._id = id

    @property
    def name(self):
        """
        Gets the name of this Asset.

        :return: The name of this Asset.
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """
        Sets the name of this Asset.

        :param name: The name of this Asset.
        :type: str
        """

        self._name = name

    @property
    def tenant_id(self):
        """
        Gets the tenant_id of this Asset.

        :return: The tenant_id of this Asset.
        :rtype: TenantId
        """
        return self._tenant_id

    @tenant_id.setter
    def tenant_id(self, tenant_id):
        """
        Sets the tenant_id of this Asset.

        :param tenant_id: The tenant_id of this Asset.
        :type: TenantId
        """

        self._tenant_id = tenant_id

    @property
    def type(self):
        """
        Gets the type of this Asset.

        :return: The type of this Asset.
        :rtype: str
        """
        return self._type

    @type.setter
    def type(self, type):
        """
        Sets the type of this Asset.

        :param type: The type of this Asset.
        :type: str
        """

        self._type = type

    def to_dict(self):
        """
        Returns the model properties as a dict
        """
        result = {}

        for attr, _ in iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value

        return result

    def to_str(self):
        """
        Returns the string representation of the model
        """
        return pformat(self.to_dict())

    def __repr__(self):
        """
        For `print` and `pprint`
        """
        return self.to_str()

    def __eq__(self, other):
        """
        Returns true if both objects are equal
        """
        if not isinstance(other, Asset):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """
        Returns true if both objects are not equal
        """
        return not self == other
