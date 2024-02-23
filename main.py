from http.server import HTTPServer

from app.api import APIServer
from app.connect_db import ConnetDB


def run_server(port=8000):
    ConnetDB()
    server_address = ('', port)
    httpd = HTTPServer(server_address, APIServer)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()
