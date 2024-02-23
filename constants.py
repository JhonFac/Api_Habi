import json

TOKEN = "aGFiaTo="
ENDPOINT = json.dumps({"error": "Endpoint no encontrado"}).encode()
NOBODY = json.dumps({"error": "Sin body"}).encode()
GETRESPONSE = json.dumps({"message": "Hola"}).encode()
GETOKEN = json.dumps({"Token": TOKEN}).encode()