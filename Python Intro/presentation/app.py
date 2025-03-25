from flask import Flask, render_template, url_for, send_from_directory

app = Flask(__name__, static_url_path='')

## App Routes

@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory('js', path)

@app.route('/css/<path:path>')
def send_css(path):
    return send_from_directory('css', path)

@app.route('/dist/<path:path>')
def send_dist(path):
    return send_from_directory('dist', path)

@app.route('/img/<path:path>')
def send_img(path):
    return send_from_directory('img', path)

@app.route('/lib/<path:path>')
def send_lib(path):
    return send_from_directory('lib', path)

@app.route('/plugin/<path:path>')
def send_plugin(path):
    return send_from_directory('plugin', path)

@app.route('/slides/<path:path>')
def send_slides(path):
    return send_from_directory('slides', path)

@app.route('/template/<path:path>')
def send_template(path):
    return send_from_directory('template', path)


# Home root route
@app.route("/")
def index():
    return render_template("index.html", title = 'Presentation')

# Programme Entry Point
if (__name__=="__main__"):
    app.run(debug=True, port=50000)
