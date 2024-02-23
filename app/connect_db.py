import json
import os

import MySQLdb
from dotenv import load_dotenv


class ConnetDB():

    # variables and connection to databases
    def __init__(self) -> None:
        print('Connecting to database...')
        load_dotenv()
        self.conexion = MySQLdb.connect(
            host=os.getenv("DB_HOST"),
            port=int(os.getenv("DB_PORT")),
            user=os.getenv("DB_USER"),
            passwd=os.getenv("DB_PASSWORD"),
            db=os.getenv("DB_DATABASE"),
        )
        self.conexion.cursor()
        print('Connected')

    def query(self):
        try:
            cursor = self.conexion.cursor()
            cursor.execute("SELECT * FROM property")
            data = cursor.fetchall()
            property_headers = ["id", "direccion", "ciudad", "precio", "descripcion", "anio_construccion"]
            json_properties = [dict(zip(property_headers, property)) for property in data]
            return bytes(json.dumps(json_properties, indent=4), 'utf-8')
        

        except MySQLdb.Error as error:
            print("Error al ejecutar la consulta:", error)
