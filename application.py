from flask import Flask, jsonify, make_response, request
from flask_sqlalchemy import SQLAlchemy
from itertools import groupby
import json
import os

from application.prediction import Prediction

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

@application.route('/predictions/<district_number>', methods=['POST'])
def predictions(district_number):
    form_data = dict(
        district_number=district_number,
        dollars_spent=request.form.get('dollars_spent', None),
        election_type=request.form.get('election_type'),
        is_encumbent=request.form.get('is_encumbent', None),
        state = request.form.get('state'),
        turnout=request.form.get('turnout', None),
    )

    prediction = Prediction(db).find(form_data)

    return jsonify(prediction)

if __name__ == '__main__':
    application.run(debug=True, host='0.0.0.0')
