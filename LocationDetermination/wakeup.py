import requests
import json
url = "http://thingsboard.idlab.uantwerpen.be:8080/api/v1/66050360-b8b7-11e7-bebc-85e6dd10a2e8/attributes"
data = {'budgetA': 1, 'budgetB':1,
        'budgetC': 1, 'budgetD': 1}
headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
r = requests.post(url, data=json.dumps(data), headers=headers);