

from models import User, db
from app import app

# Drop and create all tables, while also emptying the tables
def seed_data():
    with app.app_context():
      if User.query.count() == 0:
         db.drop_all()
         db.create_all()
         User.quer.delete()


         user00Name = User(first_name='John', last_name='Doe', image_url='default.jpg')
         user01Name = User(first_name='Jane', last_name='Doe', image_url='default.jpg')

         db.session.add(user00Name)
         db.session.add(user01Name)

         db.session.commit()
         print("DB seeded with test columns")
      else:
         print("DB NOT seeded")

if __name__ == '__main__':
    seed_data()