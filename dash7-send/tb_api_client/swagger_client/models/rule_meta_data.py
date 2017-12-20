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


class RuleMetaData(object):
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
        'action': 'str',
        'additional_info': 'str',
        'created_time': 'int',
        'filters': 'str',
        'id': 'RuleId',
        'name': 'str',
        'plugin_token': 'str',
        'processor': 'str',
        'state': 'str',
        'tenant_id': 'TenantId',
        'weight': 'int'
    }

    attribute_map = {
        'action': 'action',
        'additional_info': 'additionalInfo',
        'created_time': 'createdTime',
        'filters': 'filters',
        'id': 'id',
        'name': 'name',
        'plugin_token': 'pluginToken',
        'processor': 'processor',
        'state': 'state',
        'tenant_id': 'tenantId',
        'weight': 'weight'
    }

    def __init__(self, action=None, additional_info=None, created_time=None, filters=None, id=None, name=None, plugin_token=None, processor=None, state=None, tenant_id=None, weight=None):
        """
        RuleMetaData - a model defined in Swagger
        """

        self._action = None
        self._additional_info = None
        self._created_time = None
        self._filters = None
        self._id = None
        self._name = None
        self._plugin_token = None
        self._processor = None
        self._state = None
        self._tenant_id = None
        self._weight = None
        self.discriminator = None

        if action is not None:
          self.action = action
        if additional_info is not None:
          self.additional_info = additional_info
        if created_time is not None:
          self.created_time = created_time
        if filters is not None:
          self.filters = filters
        if id is not None:
          self.id = id
        if name is not None:
          self.name = name
        if plugin_token is not None:
          self.plugin_token = plugin_token
        if processor is not None:
          self.processor = processor
        if state is not None:
          self.state = state
        if tenant_id is not None:
          self.tenant_id = tenant_id
        if weight is not None:
          self.weight = weight

    @property
    def action(self):
        """
        Gets the action of this RuleMetaData.

        :return: The action of this RuleMetaData.
        :rtype: str
        """
        return self._action

    @action.setter
    def action(self, action):
        """
        Sets the action of this RuleMetaData.

        :param action: The action of this RuleMetaData.
        :type: str
        """

        self._action = action

    @property
    def additional_info(self):
        """
        Gets the additional_info of this RuleMetaData.

        :return: The additional_info of this RuleMetaData.
        :rtype: str
        """
        return self._additional_info

    @additional_info.setter
    def additional_info(self, additional_info):
        """
        Sets the additional_info of this RuleMetaData.

        :param additional_info: The additional_info of this RuleMetaData.
        :type: str
        """

        self._additional_info = additional_info

    @property
    def created_time(self):
        """
        Gets the created_time of this RuleMetaData.

        :return: The created_time of this RuleMetaData.
        :rtype: int
        """
        return self._created_time

    @created_time.setter
    def created_time(self, created_time):
        """
        Sets the created_time of this RuleMetaData.

        :param created_time: The created_time of this RuleMetaData.
        :type: int
        """

        self._created_time = created_time

    @property
    def filters(self):
        """
        Gets the filters of this RuleMetaData.

        :return: The filters of this RuleMetaData.
        :rtype: str
        """
        return self._filters

    @filters.setter
    def filters(self, filters):
        """
        Sets the filters of this RuleMetaData.

        :param filters: The filters of this RuleMetaData.
        :type: str
        """

        self._filters = filters

    @property
    def id(self):
        """
        Gets the id of this RuleMetaData.

        :return: The id of this RuleMetaData.
        :rtype: RuleId
        """
        return self._id

    @id.setter
    def id(self, id):
        """
        Sets the id of this RuleMetaData.

        :param id: The id of this RuleMetaData.
        :type: RuleId
        """

        self._id = id

    @property
    def name(self):
        """
        Gets the name of this RuleMetaData.

        :return: The name of this RuleMetaData.
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """
        Sets the name of this RuleMetaData.

        :param name: The name of this RuleMetaData.
        :type: str
        """

        self._name = name

    @property
    def plugin_token(self):
        """
        Gets the plugin_token of this RuleMetaData.

        :return: The plugin_token of this RuleMetaData.
        :rtype: str
        """
        return self._plugin_token

    @plugin_token.setter
    def plugin_token(self, plugin_token):
        """
        Sets the plugin_token of this RuleMetaData.

        :param plugin_token: The plugin_token of this RuleMetaData.
        :type: str
        """

        self._plugin_token = plugin_token

    @property
    def processor(self):
        """
        Gets the processor of this RuleMetaData.

        :return: The processor of this RuleMetaData.
        :rtype: str
        """
        return self._processor

    @processor.setter
    def processor(self, processor):
        """
        Sets the processor of this RuleMetaData.

        :param processor: The processor of this RuleMetaData.
        :type: str
        """

        self._processor = processor

    @property
    def state(self):
        """
        Gets the state of this RuleMetaData.

        :return: The state of this RuleMetaData.
        :rtype: str
        """
        return self._state

    @state.setter
    def state(self, state):
        """
        Sets the state of this RuleMetaData.

        :param state: The state of this RuleMetaData.
        :type: str
        """
        allowed_values = ["ACTIVE", "SUSPENDED"]
        if state not in allowed_values:
            raise ValueError(
                "Invalid value for `state` ({0}), must be one of {1}"
                .format(state, allowed_values)
            )

        self._state = state

    @property
    def tenant_id(self):
        """
        Gets the tenant_id of this RuleMetaData.

        :return: The tenant_id of this RuleMetaData.
        :rtype: TenantId
        """
        return self._tenant_id

    @tenant_id.setter
    def tenant_id(self, tenant_id):
        """
        Sets the tenant_id of this RuleMetaData.

        :param tenant_id: The tenant_id of this RuleMetaData.
        :type: TenantId
        """

        self._tenant_id = tenant_id

    @property
    def weight(self):
        """
        Gets the weight of this RuleMetaData.

        :return: The weight of this RuleMetaData.
        :rtype: int
        """
        return self._weight

    @weight.setter
    def weight(self, weight):
        """
        Sets the weight of this RuleMetaData.

        :param weight: The weight of this RuleMetaData.
        :type: int
        """

        self._weight = weight

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
        if not isinstance(other, RuleMetaData):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """
        Returns true if both objects are not equal
        """
        return not self == other
