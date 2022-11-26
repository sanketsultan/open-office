from flask import Flask, render_template
import json
import bookingdb

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


class CustomerData:
    def __init__(self, username, date, seats):
        self.username = username
        self.date = date
        self.seats = seats


@app.route('/bookings/insert/<bookingInfo>', methods=['POST'])
def bookingsInfoInsert(bookingInfo):
    bookingInfoDetails = json.loads(bookingInfo)
  
    for entry in bookingInfoDetails:
        username = 'Ravindra'
        date    = str(entry['date'])
        seats   = str(entry['seats'])

    customerData = CustomerData(username,date,seats)
    bookingdb.insertrecords(customerData)
    return('/')


@app.route('/bookings/update/<bookingInfo>', methods=['PUT'])
def bookingsInfoUpdate(bookingInfo):
    bookingInfoDetails = json.loads(bookingInfo)

    for entry in bookingInfoDetails:
        username = 'Ravindra'
        date  =  str(entry['date'])
        seats =  str(entry['seats'])
    print(seats)
    customerData = CustomerData(username,date,seats)

    bookingdb.updaterecords(customerData)
    return('/')



if __name__ == "__main__":
    # port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=5000)