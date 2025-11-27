from flask import Flask, jsonify
import os
import redis

r = redis.Redis(host=os.getenv('REDIS_HOST','redis'), port=6379, decode_responses=True)
app = Flask(__name__)

@app.route('/api')
def index():
    r.incr('hits')
    return jsonify({'message': 'Hello from API', 'hits': int(r.get('hits') or 0)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
