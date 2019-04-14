from flask import Flask, render_template, Response
import json
import random
app = Flask(__name__)
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

Base = automap_base()
engine = create_engine("mysql+pymysql://flaskdev:flaskdb@localhost/flask")

Base.prepare(engine, reflect=True)
catpic = Base.classes.catpicture
session = Session(engine)

@app.route("/")
def hello():
	return render_template("index.html")

@app.route("/getpic")
def get_pic():
	results = session.query(catpic)
	size = results.count()
	row = results[(random.randint(1,size))-1]
	data = {'file' : '/static/' + row.pictureurl}
	js = json.dumps(data)
	resp = Response(js, status=200, mimetype="application/json")
	return resp

if __name__ == "__main__":
	app.run(debug=True,host='0.0.0.0')
