"""Blogly application."""

from flask import Flask, request, redirect, render_template
from models import db, connect_db, User

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres@localhost/blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

connect_db(app)
with app.app_context():
    db.create_all()

from flask_debugtoolbar import DebugToolbarExtension


app.config['DEBUG'] = True
app.config['SECRET_KEY'] = "SECRET!"
app.config['DEBUG_TB_ENABLED'] = True
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False

debug = DebugToolbarExtension(app)

@app.route('/')
def redirect_to_list():

   return redirect('/users')

@app.route('/users')
def list_users():
   """List users and show add form."""
   users = User.query.all()

   return render_template("users.html", users=users)

@app.route('/users/new')
def NewUser_form():

   return render_template("newUser_form.html")

@app.route('/users/new', methods=['POST'])
def NewUser_Add():
   """Create a new user."""

   fName = request.form['first_name']
   lName = request.form['last_name']
   image = request.form.get('profile_pic', 'default_pic.jpg')
   
   new_user = User(first_name=fName, last_name=lName, image_url=image)
   db.session.add(new_user)
   db.session.commit()
   return redirect('/users')

@app.route("/users/<int:user_id>")
def User_profile(user_id):
   """Show Users info."""
   user = User.query.get_or_404(user_id)

   return render_template("detail.html", user=user)

@app.route("/users/<int:user_id>/edit")
def User_profileEdit(user_id):
   """ Edit User Profile. """
   user = User.query.get_or_404(user_id)

   return render_template("profileEdit.html", user=user)

@app.route("/users/<int:user_id>/edit", methods=['POST'])
def ProfileEdit_commit(user_id):
   """Update user."""
   user = User.query.get(user_id)

   if user:
      user.first_name = request.form['first_name']
      user.last_name = request.form['last_name']
      user.image_url = request.form.get('profile_pic', 'default_pic.jpg')
      db.session.commit()
   else:
      return "User not found", 404
   
   return redirect('/users')

@app.route("/users/<int:user_id>/delete")
def User_delete(user_id):
   """Delete User."""
    
   user = User.query.get_or_404(user_id)
   db.session.delete(user)
   db.session.commit()

   return redirect('/users')
