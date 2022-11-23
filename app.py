from flask import Flask, render_template
import os

# Create Flask's `app` object
app = Flask(__name__, template_folder="templates", static_folder="static")


@app.route("/")
def index():
    return render_template("index.html")

# @app.route("/login")
# def login():
#     return render_template("index.html")

# @app.route("/bookings")
# def bookings():
#     return render_template("index.html")


if __name__ == "__main__":
    # port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=5000)