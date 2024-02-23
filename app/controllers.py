import json

from constants import ENDPOINT, TOKEN


def controller_token(authorization_header):
    status_code = 404
    text = ENDPOINT
    # print(authorization_header)
    if authorization_header is None:
        text=json.dumps({"error": "Token no proporcionado"}).encode()
        status_code=401
        return False, status_code, text
    # print(authorization_header)
    _, token = authorization_header.split(' ')
    if token != TOKEN:
        text=json.dumps({"error": "Token invalido"}).encode()
        status_code=401
        return False, status_code, text
    
    return True, status_code, text

