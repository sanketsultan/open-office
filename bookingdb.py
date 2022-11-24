import sqlite3

def insertrecords(customerData) :

    connection = sqlite3.connect('booking.db')
    
    cursor = connection.cursor()
    cursor.execute("""CREATE table IF NOT EXISTS booking_catelog(
        username text,
        date text,
        seats text
        )""")
    cursor.execute("INSERT INTO booking_catelog values (?, ?, ?)",(customerData.username, customerData.date, customerData.seats))
    connection.commit()
    cursor.execute("SELECT * FROM booking_catelog where username=:username",{'username':customerData.username})
    print(cursor.fetchall())
    connection.commit()
    connection.close()


def updaterecords(customerData) :
    connection = sqlite3.connect('booking.db')

    cursor = connection.cursor()
    updaterecords= """UPDATE  booking_catelog SET username=? AND date=? AND seats=? WHERE username=?"""
    cursor.execute(updaterecords,(customerData.username,customerData.date,customerData.seats,customerData.username))
    connection.commit()
    cursor.execute("SELECT * FROM booking_catelog where username=:username",{'username':customerData.username})
    print(cursor.fetchall())
    connection.commit()
    connection.close()
