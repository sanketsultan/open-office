from flask import Flask, render_template


# Create Flask's `app` object
app = Flask(__name__, template_folder="templates", static_folder="static")


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login")
def login():
    return render_template("index.html")

@app.route("/bookings")
def bookings():
    return render_template("index.html")


if __name__ == '__main__':
    app.run(debug=True)
