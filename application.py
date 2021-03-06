from flask import Flask, jsonify, make_response, request, send_file, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from itertools import groupby
import json
import os

from application.prediction import Prediction
from application.state import State

env = os.getenv('ENV', 'development')
application = Flask(__name__)
application.config.from_object('application.config.{}Config'.format(env.capitalize()))

with open(application.config['DATABASE_FILE'], 'r') as f:
    connection = json.load(f)

application.config['SQLALCHEMY_DATABASE_URI'] = connection['connection']
db = SQLAlchemy(application)

@application.errorhandler(404)
def not_found(error):
    return make_response(jsonify({ 'error': 'Not found' }), 404)

@application.route('/')
def index():
    return send_file('index.html')

@application.route('/src/<path:path>')
def send_static_content(path):
    return send_from_directory('src', path)

# Rewrite these URLs to be served from same static content dir
@application.route('/bower_components/<path:path>')
def send_bower_content(path):
    return send_from_directory('src', path)

@application.route('/fake_data/<path:path>')
def send_fake_data(path):
    return send_from_directory('src', path)

@application.route('/predictions/<district_number>', methods=['POST'])
def predictions(district_number):
    prediction = Prediction(db).find(dict(
        district_number=district_number,
        dollars_spent=request.form.get('dollars_spent'),
        state=request.form.get('state'),
        turnout=request.form.get('turnout'),
    ))

    return jsonify(prediction)

@application.route('/states/<state>', methods=['GET'])
def states(state):
    districts = State(db).find_districts(dict(
        election_type=request.args.get('election_type'),
        state=state,
        year=request.args.get('year')
    ))

    return jsonify(districts)

if __name__ == '__main__':
    application.run(debug=True, host='0.0.0.0')
