import requests, logging, json
import urllib
import configparser as ConfigParser
config = ConfigParser.RawConfigParser(allow_no_value=True)
config.read('/Users/hugoselbie/looker_stuff/code_sample/py/autogen_testing/settings/settings.ini')

class lookerAPIClient:
    def __init__(self 
            ,host       = config.get('api','host') 
            ,client_id  = config.get('api','client_id')
            ,secret     = config.get('api','secret')
            ,port       = config.get('api','port')
            ,version    = config.get('api','version')
            ):
        self.client_id  = client_id
        self.secret     = secret
        self.host           = host
        self.version        = version
        self.uri_stub       = '/api/{0}/'.format(self.version)
        self.uri_full       = ''.join([host, ':', port, self.uri_stub])
        self.login()

    def login(self):
        response = requests.post(self.uri_full + 'login', params={'client_id': self.client_id, 'client_secret': self.secret}, verify=True)
        self.access_token = response.json()['access_token']
        self.auth_headers = {
                'Authorization' : 'token ' + self.access_token,
                }

    def get(self, call=''):
        response = requests.get(self.uri_full + call, headers=self.auth_headers, verify=True)
        return response

    def post(self, call='', json_payload=None):
        response = requests.post(self.uri_full + call, headers=self.auth_headers, json=json_payload, verify=True)
    # print(reponse.request.url)
        return response

    def run_sql(self, query, connection):
        response = {}
        response['connection_id'] = connection
        response['sql'] = query
        # r = self.post('sql_queries', json_payload=response)
        r = requests.post(self.uri_full +'sql_queries', headers = self.auth_headers, json=response)
        slug = r.json()['slug']
        response = requests.post(self.uri_full +'/sql_queries'+'/'+slug+'/'+'run'+'/'+'json', headers=self.auth_headers, verify=True)
        return response.json()

    def run_sql_runner(self, query_slug):
        response = requests.post(self.uri_full +'/sql_queries'+'/'+query_slug+'/'+'run'+'/'+'json', headers=self.auth_headers, verify=True)
        return response