import unittest
from unittest.mock import patch
from app.controllers import controller_token

class TestControllerToken(unittest.TestCase):
    def test_controller_token_no_authorization_header(self):
        authorization_header = None
        result = controller_token(authorization_header)
        expected_status_code = 401
        expected_text = b'{"error": "Token no proporcionado"}'
        self.assertEqual(result, (False, expected_status_code, expected_text))

    def test_controller_token_invalid_token(self):
        authorization_header = 'Bearer invalid_token'
        result = controller_token(authorization_header)
        expected_status_code = 401
        expected_text = b'{"error": "Token invalido"}'
        self.assertEqual(result, (False, expected_status_code, expected_text))

    def test_controller_token_valid_token(self):
        authorization_header = 'Bearer aGFiaTo='
        result = controller_token(authorization_header)
        expected_status_code = 404
        expected_text = b'{"error": "Endpoint no encontrado"}'
        self.assertEqual(result, (True, expected_status_code, expected_text))