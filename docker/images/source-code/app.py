import os
from flask import Flask, request, render_template

app = Flask(__name__)

color = "red"

@app.route("/home/atjhamit/myfiles/github/container/docker/images/source-code")
def main():
    print(color)
    return render_template('hello.html', color=color)

@app.route("/home/atjhamit/myfiles/github/container/docker/images/source-code")
def index():
    return "hi"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000", debug=True)
