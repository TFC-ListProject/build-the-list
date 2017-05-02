import os
from flask import Flask, jsonify, make_response

env = os.getenv('ENV', 'development')

app = Flask(__name__)
app.config.from_object('config.{}Config'.format(env.capitalize()))

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

@app.route('/', methods=['GET'])
def index():
    return jsonify({'success': True})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
