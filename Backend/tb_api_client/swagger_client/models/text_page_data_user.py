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


class TextPageDataUser(object):
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
        'data': 'list[User]',
        'has_next': 'bool',
        'next_page_link': 'TextPageLink'
    }

    attribute_map = {
        'data': 'data',
        'has_next': 'hasNext',
        'next_page_link': 'nextPageLink'
    }

    def __init__(self, data=None, has_next=None, next_page_link=None):
        """
        TextPageDataUser - a model defined in Swagger
        """

        self._data = None
        self._has_next = None
        self._next_page_link = None
        self.discriminator = None

        if data is not None:
          self.data = data
        if has_next is not None:
          self.has_next = has_next
        if next_page_link is not None:
          self.next_page_link = next_page_link

    @property
    def data(self):
        """
        Gets the data of this TextPageDataUser.

        :return: The data of this TextPageDataUser.
        :rtype: list[User]
        """
        return self._data

    @data.setter
    def data(self, data):
        """
        Sets the data of this TextPageDataUser.

        :param data: The data of this TextPageDataUser.
        :type: list[User]
        """

        self._data = data

    @property
    def has_next(self):
        """
        Gets the has_next of this TextPageDataUser.

        :return: The has_next of this TextPageDataUser.
        :rtype: bool
        """
        return self._has_next

    @has_next.setter
    def has_next(self, has_next):
        """
        Sets the has_next of this TextPageDataUser.

        :param has_next: The has_next of this TextPageDataUser.
        :type: bool
        """

        self._has_next = has_next

    @property
    def next_page_link(self):
        """
        Gets the next_page_link of this TextPageDataUser.

        :return: The next_page_link of this TextPageDataUser.
        :rtype: TextPageLink
        """
        return self._next_page_link

    @next_page_link.setter
    def next_page_link(self, next_page_link):
        """
        Sets the next_page_link of this TextPageDataUser.

        :param next_page_link: The next_page_link of this TextPageDataUser.
        :type: TextPageLink
        """

        self._next_page_link = next_page_link

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
        if not isinstance(other, TextPageDataUser):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """
        Returns true if both objects are not equal
        """
        return not self == other
