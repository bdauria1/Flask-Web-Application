# Code is derived from author Ben Lawson <balawson@bu.edu>
# Edited originally by: Craig Einstein <einstein@bu.edu>
# Furthur edited by: Brooke Potvin <bpotvin@bu.edu> and Brandon Dauria <bdauria@bu.edu>
####################################################################################################
# Some code adapted from
# CodeHandBook at http://codehandbook.org/python-web-application-development-using-flask-and-mysql/
# and MaxCountryMan at https://github.com/maxcountryman/flask-login/
# and Flask Offical Tutorial at  http://flask.pocoo.org/docs/0.10/patterns/fileuploads/
# see links for further understanding
#####################################################################################################

import flask
from flask import Flask, Response, request, render_template, redirect, url_for

# for image uploading
import os, base64

app = Flask(__name__)
app.secret_key = 'brooke and brandon'  



# home page - will let the user either log in or create an account
@app.route("/", methods=['GET'])
def welcome():
    return render_template("welcome.html")


# login page - on success move to hello, on failure more to unauth
# ######## FILL IN HERE WHEN DOING SQL ####### 
# will need to follow similar method of different get vs post methods as signup
@app.route("/login")
def login():
    return render_template("login.html")

# sign up page - on success move to hello, on failure show error
@app.route("/signup", methods=['GET'])
def signup():
    return render_template("signup.html", supress=True)
@app.route("/signup", methods=['POST'])
def signup_user():
    # see if email is unique/valid to sign up
    try:
        email=request.form.get('email')
        password=request.form.get('password')
    except:
        print("couldn't fine all tokens")
        return flask.redirect(flask.url_for('signup'))
        ######## FILL IN HERE WHEN DOING SQL #######
    

# unauthorized page - only used for a failed login
@app.route("/unauth", methods=['GET'])
def unauth():
    return render_template("unauth.html")


# main profile homepage for logged in users
@app.route("/hello", methods=['GET'])
def hello():
    return render_template("hello.html")


# allowing photo types to be uploaded
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS


# uploading a new photo to a users account
@app.route("/upload", methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        ######## FILL IN HERE WHEN DOING SQL #######
        print('t')
    else:    
        return render_template("upload.html")


if __name__ == "__main__":
	#this is invoked when in the shell  you run
	#$ python app.py
	app.run(port=8000, debug=True)