"""Blogly application."""

from flask import Flask, request, redirect, render_template
from models import db, connect_db, User

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres@localhost/blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

connect_db(app)

from flask_debugtoolbar import DebugToolbarExtension
app.config['SECRET_KEY'] = "SECRET!"
debug = DebugToolbarExtension(app)

@app.route('/')
def redirect_to_list():

   return redirect('/users')

@app.route('/users')
def list_users():
   """List users and show add form."""
   users = User.query.all()
   return render_template("users.html", users=users)

# @app.route("/users/<int:user_id>")
# def user_detail(user_id):
#     user = User.query.get_or_404(user_id)
#     return render_template("user_detail.html, user=user")

# @app.route('/users/new')
# def new_user_form():
#       """Present a form for new user."""
#       return render_template("new_user.html")

# @app.route('/users/new', methods=['GET', 'POST'])
# def create_user():
#    """Create a new user."""
   
#    if request.method == "POST":
#       # action = request.form.get("action")
      
#       # if action == "edit":
#       #    db.session.commit()
#       #    return redirect('/users')

#       fName = request.form.get('first_name')
#       lName = request.form.get('last_name')
#       image = request.form.get('profile_pic')
      
#       new_user = User(first_name=fName, last_name=lName, image_url=image)
#       db.session.add(new_user)
#       db.session.commit()
#       return redirect('/users')
   
#    render_template("new_user.html")