from flask import Flask, jsonify

__author__ = "philipdelorenzo"

app = Flask(__name__)

@app.route("/")
def health():
    """This function evaluates all endpoints defined in config/urls.cfg."""
    return "This is a test of a working Flask application"
