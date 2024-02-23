from http.server import BaseHTTPRequestHandler

from app.controllers import controller_token
from constants import GETOKEN, GETRESPONSE, NOBODY


class APIServer(BaseHTTPRequestHandler):
    def _set_headers(self, status_code=200, content_type='application/json'):
        self.send_response(status_code)
        self.send_header('Content-type', content_type)
        self.end_headers()

    def do_GET(self):
        #VALIDAR TOKEN
        val, status_code, text = controller_token(self.headers.get('Authorization'))
        if val and self.path == '/':
            status_code =200
            text = GETRESPONSE

        if val and self.path == '/token':
            status_code =200
            text = GETOKEN

        self._set_headers(status_code)
        self.wfile.write(text)

    def do_POST(self):
        #VALIDAR TOKEN
        val, status_code, text = controller_token(self.headers.get('Authorization'))
        if val and self.path == '/':
            # Retornarna el mismo body que se recibió
            data = self.rfile.read(int(self.headers['Content-Length']))
            text = NOBODY if len(data) == 0 else data
            status_code = 200
        self._set_headers(status_code)
        self.wfile.write(text)
