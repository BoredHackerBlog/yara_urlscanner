from flask import Flask, request
from worker import start_scan

app = Flask(__name__)

@app.route('/',methods=['GET'])
def index():
    return "Hello"

@app.route('/scan',methods=['POST'])
def scan():
    if request.form['url']:
        url = request.form['url'].strip()
        r = start_scan(url)
        return f"Task id: { r.id }"