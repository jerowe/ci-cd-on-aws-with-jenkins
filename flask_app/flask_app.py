from flask import Flask
from flask import jsonify, request
from flask_cors import CORS, cross_origin
import json

app = Flask(__name__)
CORS(app, allow_headers=['Content-Type', 'Access-Control-Allow-Origin',
                         'Access-Control-Allow-Headers', 'Access-Control-Allow-Methods'])


@app.after_request
def apply_caching(response):
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Credentials"] = "true"
    response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,OPTIONS,POST,PUT"
    response.headers["Access-Control-Allow-Headers"] = \
        "Access-Control-Allow-Headers,  Access-Control-Allow-Origin, Origin,Accept, " + \
        "X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers"
    return response


# These are just some health/server is up checks

@app.route('/', methods=['GET'])
def enter():
    return jsonify({'status': 'ok'})


@app.route('/health', methods=['POST'])
def health():
    try:
        data = json.loads(request.data.decode('utf-8'))
        return jsonify(data)
    except Exception as e:
        return jsonify({'status': 'ok'})
