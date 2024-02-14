#########################################################################################
#########################################################################################
# ----------------- SECURE DATABASE - AUX. FUNCITONS - SIO PROJECT Nº 1 --------------- #
#########################################################################################
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #
import os
import sqlite3
from db_tables import User, Product, ProductRatings, ProductComment

#
# ----- FUNCTION connect_db():
def connect_db():
    directory = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(directory, 'DOSG26.db')
    con = sqlite3.connect(db_path, check_same_thread=False)
    cur = con.cursor()
    return con, cur
#
# ----- FUNCTION new_user:
def new_user(session, fname, lname, email, nick, passwd, confirm):
    if passwd != confirm:
        error = "Passwords do not match."
        return False, error
    
    existing_user = session.query(User).filter_by(email=email, nick=nick).first()
    if existing_user:
        error = "Email or nickname is already in use."
        return False, error

    user = User(fname=fname, lname=lname, email=email, nick=nick, passwd=passwd)
    session.add(user)
    session.commit()
    return True, "Registration complete!"
#
# -----  FUNCTION login_user:
def login_user(session, email, passwd):
    user = session.query(user).filter_by(email=email).first()
    if user and user.passwd == passwd:
        login_msg = "Welcome!"
        return True, login_msg, user.id
    else:
        login_msg = "Error: Credentials do not match."
        return False, login_msg, None
#
# -----  FUNCTION rate_comment_product:
def rate_comment_product(session, product_id, user_id, rating, comment):
    try:
        rating = ProductRatings(product_id=product_id, user_id=user_id, rating=rating, comment=comment)
        comment = ProductComment(product_id=product_id, user_id=user_id, comment=comment)
        session.add(rating)
        session.add(comment)
        session.commit()
        msg = "Thank you for rating and commenting on our product!"
        return True, msg
    except Exception as e:
        error = f"Error: {str(e)}"
        return False, error
#
# -----  FUNCTION add_product:
def add_product(session, title, description, category, price, stock):
    try:
        new_product = Product(
            title=title,
            descrip=description,
            category=category,
            price=price,
            stock=stock,
            meadrating=None
        )

        session.add(new_product)
        session.commit()

        return "New product added!"

    except Exception as e:
        return f"Error: {str(e)}"
#
# -----  FUNCTION change_product:
def change_product(session, product_id, new_title, new_description, new_category, new_price, new_stock):
    try:
        product = session.query(Product).filter(Product.id == product_id).first()

        if product:
            product.title = new_title
            product.descrip = new_description
            product.category = new_category
            product.price = new_price
            product.stock = new_stock

            session.commit()

            return "Product updated!"
        else:
            return "Product not found."

    except Exception as e:
        return f"Error: {str(e)}"
    
