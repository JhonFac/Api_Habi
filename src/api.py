from flask import Flask, jsonify, request
from flask_swagger_ui import get_swaggerui_blueprint

from connectBD import Connet
from controller import Controller

app = Flask(__name__)

### swagger specific ###
SWAGGER_URL = "/swagger"
API_URL = "/static/swagger.json"
SWAGGERUI_BLUEPRINT = get_swaggerui_blueprint(
    SWAGGER_URL, API_URL, config={"app_name": "Seans-Python-Flask-REST-Boilerplate"}
)
app.register_blueprint(SWAGGERUI_BLUEPRINT, url_prefix=SWAGGER_URL)
### end swagger specific ###


@app.get("/building")
def buildin():
    return (
        {
            "Error": "Request must be JSON",
            "Example": {"fields": ["id", "name", "active"], "filter": {"active": 1, "id": 6, "name": "diana"}},
        },
        415,
    )


@app.post("/like")
def likes():

    if request.is_json:
        resp = request.get_json()
        cur = Connet.AddLike(resp["user"], resp["buildig"])
        return jsonify(cur), 201
    return {
        "Error": "Request must be JSON",
        "Example": {"fields": ["id", "name", "active"], "filter": {"active": 1, "id": 6, "name": "diana"}},
    }, 415


@app.post("/building")
def building():
    if request.is_json:
        resp = request.get_json()
        if len(resp) != 0:
            if Controller.validateFilers(resp["filter"]):
                cur = Connet.query(resp["fields"], resp["filter"])
                return jsonify(cur), 201
            else:
                return {"message": "no field can be empty"}
    return {
        "Error": "Request must be JSON",
        "Example": {
            "fields": ["address", "city", "price", "description", "year"],
            "filter": {"price": 120000000, "year": 2000, "state": "pre_venta"},
        },
    }, 415


if __name__ == "__main__":

    app.debug = True
    app.run(port="5001")
