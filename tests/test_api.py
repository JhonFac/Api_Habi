import unittest
import threading
import requests
from http.server import HTTPServer
from app.api import APIServer

class TestAPIServer(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.server_address = ('localhost', 8000)
        cls.server = HTTPServer(cls.server_address, APIServer)
        cls.server_thread = threading.Thread(target=cls.server.serve_forever)
        cls.server_thread.daemon = True
        cls.server_thread.start()

    @classmethod
    def tearDownClass(cls):
        # Detenemos el servidor
        cls.server.shutdown()
        cls.server.server_close()

    def test_get_request_error(self):
        mock_response = {'error': 'Token no proporcionado'}
        response = requests.get('http://localhost:8000')
        response_json = response.json()
        self.assertEqual(response.status_code, 401)
        self.assertEqual(response_json, mock_response)


    def test_authorized_get_request(self):
        url = 'http://localhost:8000/'
        headers = {'Authorization': 'Bearer aGFiaTo='}  
        response = requests.get(url, headers=headers)
        response_json = response.json()
        print(response_json)
        self.assertEqual(response.status_code, 200)        

    def test_post_error(self):
        mock_response = {'error': 'Token invalido'}
        url = 'http://localhost:8000/'
        headers = {'Authorization': 'Bearer invalidToken'}  
        response = requests.post(url, headers=headers)
        response_json = response.json()
        print(response_json)
        self.assertEqual(response.status_code, 401)        
        self.assertEqual(response_json, mock_response)


    def test_post_success(self):
        url = 'http://localhost:8000/'
        headers = {'Authorization': 'Bearer aGFiaTo='}  
        response = requests.post(url, headers=headers)
        response_json = response.json()
        print(response_json)
        self.assertEqual(response.status_code, 200)        
