# Flask is Python microframework for creating web applications (APIs or sites!)
# Run this app from the command line using 
#   Python '.\6. Flask example.py'

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/About')
def about():
    return 'About Me!'
   
@app.route('/Help')
def help():
    return 'Help page!'

# programme entry point
if (__name__=="__main__"):
    app.run(debug=True)