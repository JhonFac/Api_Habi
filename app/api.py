from http.server import BaseHTTPRequestHandler
from constants import GETOKEN, GETRESPONSE, NOBODY
from app.controllers import controller_token
from app.connect_db import ConnetDB
import socket

class APIServer(BaseHTTPRequestHandler):

    def _set_headers(self, status_code=200, content_type='application/json'):
        self.send_response(status_code)
        self.send_header('Content-type', content_type)
        self.end_headers()

    def do_GET(self):
        conexion_db = ConnetDB()
        #VALIDATE TOKEN
        val, status_code, text = controller_token(self.headers.get('Authorization'))

        if val and self.path == '/':
            status_code =200
            text = conexion_db.query()

        if val and self.path == '/token':
            status_code =200
            text = GETOKEN

        self._set_headers(status_code)
        self.wfile.write(text)

    def do_POST(self):
        #VALIDATE TOKEN
        val, status_code, text = controller_token(self.headers.get('Authorization'))

        if val and self.path == '/':
            # Return the same bodysuit that was received
            data = self.rfile.read(int(self.headers['Content-Length']))
            text = NOBODY if len(data) == 0 else data
            status_code = 200

        self._set_headers(status_code)
        self.wfile.write(text)
