import os
import json
from flask import Flask, jsonify, make_response
from flask_sqlalchemy import SQLAlchemy

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

@application.route('/', methods=['GET'])
def index():
    sql = """
    SELECT
        c.first_name || ' ' || c.last_name
        , d.name
        , e.state
    FROM candidates c
        JOIN district_election_results der ON der.candidate_id = c.id
        JOIN districts d ON der.district_id = d.id
        JOIN elections e ON der.election_id = e.id
    WHERE
        e.year = 2016
    ORDER BY d.name
    LIMIT 10
    """
    def build_result(row):
        return dict(
            name=row[0],
            district=row[1],
            state=row[1],
        )

    result = list(map(build_result, db.engine.execute(sql).fetchall()))
    return jsonify(result)

if __name__ == '__main__':
    application.run(debug=True, host='0.0.0.0')
