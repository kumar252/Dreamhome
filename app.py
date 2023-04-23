from flask import Flask, render_template, request, redirect, url_for, session,flash
from flask_mysqldb import MySQL
from mysql.connector import connect
import mysql.connector
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Configure MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'realestate'
app.config['MYSQL_PASSWORD'] = 'realestate'
app.config['MYSQL_DB'] = 'realestate'

# Initialize MySQL
mysql = MySQL(app)

#mydb = mysql.connector.connect(
#    host="localhost",
#    user="root",
#   password="",
#    database="users"
#)


# Define routes
@app.route("/home")
def home():
    if "user" in session:
        return render_template("home.html", user=session["user"])
    else:
        return redirect("/login")


@app.route("/rentals")
def rentals():
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("select * from rentals")
        data = cursor.fetchall()
        return render_template("rentals.html", data=data)
    

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/adminpage")
def adminpage():
    # connect to the database
    #cnx = mysql.connector.connect(
    #    host='localhost',
    #    user='root',
    #   password='',
    #    database='realestate'
    #)

    # execute a query to retrieve the table data
    conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
    cursor = conn.cursor()
    cursor.execute("select * from mailinglist")
    rows = cursor.fetchall() 
    cursor.execute("select clientid,username,emailid from client")
    rows1 = cursor.fetchall()
    cursor.execute("select * from viewing")
    rows2 = cursor.fetchall()
    cursor.execute("select * from rentals")
    rows3 = cursor.fetchall()
    # render the template with the table data
    return render_template('adminpage.html', rows=rows, rows1=rows1, rows2=rows2, rows3=rows3)

    

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM client WHERE username=%s AND password=%s", (username, password))
        user = cursor.fetchone()
        if user:
            session["user"] = user
            return redirect("/home")
        else:
            flash('Invalid credentials. Please try again.', 'error')
            return render_template("login.html", error="Invalid username or password")
    else:
        return render_template("login.html")
    

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM adminuser WHERE username=%s AND password=%s", (username, password))
        user = cursor.fetchone()
        if user:
            session["user"] = user
            return redirect("/adminpage")
        else:
            flash('Invalid credentials. Please try again.', 'error')
            return render_template("admin.html", error="Invalid username or password")
    else:
        return render_template("admin.html")    
    
# Register route
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        # Get form data
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("INSERT INTO client (username, password, emailid ) VALUES (%s, %s, %s)", (username, password, email))
        conn.commit()
        cursor.close()
        # Insert new user into database
       # mycursor = mydb.cursor()
       # sql = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
       # val = (username, email, password)
       # mycursor.execute(sql, val)
       # mydb.commit()
        flash('Submission successful!', 'success')
        return redirect("/login")

    return render_template('register.html')
   


@app.route('/view', methods=['GET', 'POST'])
def view():
    if "user" in session:
       user = session.get("user")
       if request.method == 'POST':
        # Get form data
        clientid = user[0]
        propertyno = request.form['propertyno']
        viewdate =  request.form['viewdate']
        viewhour = request.form['viewhour']
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("INSERT INTO viewing (clientid, Propertyno, viewdate, viewhour ) VALUES (%s, %s, %s, %s)", (clientid, propertyno, viewdate, viewhour ))
        conn.commit()
        cursor.close()
        # Insert new user into database
       # mycursor = mydb.cursor()
       # sql = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
       # val = (username, email, password)
       # mycursor.execute(sql, val)
       # mydb.commit()

        return redirect("/home")

       return render_template('view.html', user=session["user"])
    else:
        return redirect("/login")


@app.route('/addtomail', methods=['GET', 'POST'])
def addtomail():
    if "user" in session:
       user = session.get("user")
       if request.method == 'POST':
        # Get form data
        clientid = user[0]
        firstname = request.form['firstname']
        lastname =  request.form['lastname']
        telno = request.form['telno']
        street = request.form['street']
        city = request.form['city']
        postcode = request.form['postcode']
        email = user[3]
        region = request.form['region']
        pretype = request.form['pretype']
        maxrent = request.form['maxrent']
        conn = connect(host="localhost", user="root", password="Sunilus@22", database="realestate")
        cursor = conn.cursor()
        cursor.execute("INSERT INTO mailinglist (clientid, firstname, lastname, telno, street, city, postcode, email, region, pretype, maxrent ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (clientid, firstname, lastname, telno, street, city, postcode, email, region, pretype, maxrent ))
        conn.commit()
        cursor.close()
        # Insert new user into database
       # mycursor = mydb.cursor()
       # sql = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
       # val = (username, email, password)
       # mycursor.execute(sql, val)
       # mydb.commit()

        return redirect("/home")

       return render_template('addtomail.html', user=session["user"])
    else:
        return redirect("/login")





@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect("/")

# Run the application
if __name__ == '__main__':
    app.run(debug=True)
