from flask import Flask, make_response, render_template, request, redirect, flash, session, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from werkzeug.security import check_password_hash
from db_tables import PurchasedItem, User, Cart, Address, Product, ProductRatings, CartItems
import os
import bcrypt
from  db_aux import add_product, change_product, rate_comment_product
import bleach
import hashlib
import requests as pyrequests
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

from google.oauth2 import id_token
from google.auth.transport import requests

app = Flask(__name__)
limiter = Limiter(app)
app.config['SECRET_KEY'] = 'x@7A^c1W#p4P!k9M6kL7i1L5bS3zD0'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///DOSG26_SEC.db'
db = SQLAlchemy(app)

# SESSION:
engine = create_engine('sqlite:///DOSG26_SEC.db')
Session = sessionmaker(bind=engine)
db_session = Session()

# Routes

# Route: Signup
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        # Get Data From Frontend
        data = request.json
        fname = bleach.clean(data['FName'], strip=True)
        lname = bleach.clean(data['LName'], strip=True)
        email = bleach.clean(data['Email'], strip=True)
        nick = bleach.clean(data['Email'], strip=True)
        password = bleach.clean(data['Password'], strip=True)
        nib = data['Nif']
        # Check if user already exists
        existing_user = db_session.query(User).filter_by(email=email).first()
        if existing_user:
            response = jsonify(False)
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response
        if not password_requirements(password):
            response = jsonify("Passoword does not match length requirements. Careful with consecutive spaces.")
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response
        if lookup_pwned_api_password(password):
            response = jsonify("Password Was Found in Multiple Security Breaches. Please choose another one.")
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response
        
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(rounds=16))
        user = User(fname=fname, lname=lname, email=email, nick=nick, passwd=hashed_password, nib=nib, role="User")
        db_session.add(user)
        db_session.commit()
        response = jsonify(True)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response


# Route: Login through Google
@app.route('/login_google', methods=['GET', 'POST'])

# Limit Route Calls: 5 requests per hour, 20 requests per day
@limiter.limit("5/hour")
@limiter.limit("20/day") 
def login_google():
    if request.method == 'POST':
        # Get Data from Frontend
        data = request.json # Token in Json format --> 'google_token': token
        google_token = data

        # Verify the token using Google's token verification endpoint
        id_info = verify_google_token(google_token)
        if not id_info: return jsonify(0) # Login Failed --> Token is Invalid

        # Extract user information from the token
        email = id_info['email']
        name = id_info['name']

        # Check if user exists
        user = db_session.query(User).filter_by(email=email).first()

        #Register in case user does not exist yet
        if not user:
            response = jsonify("There is no account with this email, use the one you registered")
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response

        response = jsonify(1)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response
        
# Route: Login
@app.route('/login', methods=['GET', 'POST'])

# Limit Route Calls: 5 requests per hour, 20 requests per day
@limiter.limit("5/hour")
@limiter.limit("20/day") 
def login():
    if request.method == 'POST':
        # Get Data From Frontend
        data = request.json
        email = bleach.clean(data['Email'], strip=True)
        password = bleach.clean(data['Password'], strip=True)
        encpass = password.encode('utf-8')

        # Check if user exists
        user = db_session.query(User).filter_by(email=email).first()

        # Check if password is correct    
        if user and bcrypt.checkpw(encpass, user.passwd):
            if lookup_pwned_api_password(password):
                return jsonify("Password Was Found in Multiple Security Breaches. Please change your password.")
            response = jsonify(1)
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response # 1 = Login Successful
        else:
            response = jsonify(0)
            response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
            response.headers['Pragma'] = 'no-cache'
            response.headers['Expires'] = '0'
            return response # 0 = Login Failed

@app.route('/change_password', methods=['POST'])
def change_password():
    if request.method == 'POST':
        data = request.json
        email = bleach.clean(data[0], strip=True)
        if '%40' in email:
            email = email.replace('%40', '@')
        unpass = bleach.clean(data[1], strip=True)
        current_password = bleach.clean(data[1], strip=True).encode('utf-8')
        new_password = bleach.clean(data[2], strip=True)

        user = db_session.query(User).filter_by(email=email).first()

        if user:
            if bcrypt.checkpw(current_password, user.passwd):
                if not password_requirements(new_password):
                    return jsonify("Passoword does not match length requirements. Careful with consecutive spaces.")
                if lookup_pwned_api_password(unpass):
                    return jsonify("Password Was Found in Multiple Security Breaches. Please change your password.")
                hashed_password = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt(rounds=16))
                user.passwd = hashed_password
                db_session.commit()
                response = jsonify(1)
                response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
                response.headers['Pragma'] = 'no-cache'
                response.headers['Expires'] = '0'
                return response

        response = jsonify(0)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response   

@app.route('/mecart', methods=['POST'])
def mecart():

    # Extract necessary data from the request
    data = request.json
    email = bleach.clean(data, strip=True)
    if '%40' in email:
        email = email.replace('%40', '@')

    # Get User
    user = db_session.query(User).filter_by(email=email).first()
    if user:
        # Get User Cart
        user_cart = db_session.query(Cart).filter_by(user_id=user.user_id).first()

        # Get all products and create empty cart
        items = db_session.query(Product).all()
        cart_items = []
        for item in items:
            cart_items.append(0)

        # If user has a cart, get the items in it
        if user_cart:
            items_in_cart = db_session.query(CartItems).filter_by(cart_id=user_cart.cart_id).all()
            for item in items_in_cart:
                cart_items[item.product_id - 1] = item.quantity
        else:
            # If user has no cart, create a new one
            cart = Cart(user_id=user.user_id, total_cost=0, in_cart=b'\x00')
            db_session.add(cart)
            db_session.commit()
        
        response = jsonify(cart_items)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response
    

@app.route('/meaddr', methods=['POST'])
def meaddr():
    
    email = bleach.clean(request.form['email'], strip=True)

    if '%40' in email:
        email = email.replace('%40', '@')

    user = db_session.query(User).filter_by(email=email).first()

    if user:
        addresses = db_session.query(Address).filter_by(user_id=user.user_id).all()
        if addresses:
            address_list = []
            for addr in addresses:
                address_data = {
                    "user_id": addr.user_id,
                    "addr": addr.addr,
                    "door": addr.door,
                    "floor": addr.floor,
                    "country": addr.country,
                    "postal": addr.postal
                }
                address_list.append(address_data)
            return jsonify(address_list)
        else:
            return jsonify({"error": "User has no addresses."})
    else:
        return jsonify({"error": "User not found."})


@app.route('/updateCarts', methods=['POST'])
def upCart():
    
    data = request.json
    
    email = bleach.clean(data['email'], strip=True)
    cart_items = {key: bleach.clean(value, strip=True) for key, value in data['cart'].items()}
    total = bleach.clean(data['total'], strip=True)
   
    if '%40' in email:
        email = email.replace('%40', '@')

    user = db_session.query(User).filter_by(email=email).first()

    if user:
        db_session.query(Cart).filter_by(user_id=user.user_id).delete()
        new_cart = Cart(
            user_id=user.user_id,
            item0=cart_items.get('item0'),
            item1=cart_items.get('item1'),
            item2=cart_items.get('item2'),
            item3=cart_items.get('item3'),
            item4=cart_items.get('item4'),
            item5=cart_items.get('item5'),
            item6=cart_items.get('item6'),
            item7=cart_items.get('item7'),
            item8=cart_items.get('item8'),
            item9=cart_items.get('item9'),
            item10=cart_items.get('item10'),
            item11=cart_items.get('item11'),
            total=total
        )
        db_session.add(new_cart)
        db_session.commit()
        response = jsonify(1)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response


@app.route('/postAddress', methods=['POST'])
def pstAddr():

    data = request.json

    email = bleach.clean(data['email'], strip=True)
    address = {key: bleach.clean(value, strip=True) for key, value in data['address'].items()}

    if '%40' in email:
        email = email.replace('%40', '@')

    user = db_session.query(User).filter_by(email=user).first()

    if user:
        new_address = Address(
            user_id  = user.user_id, 
            addr     = address.get('Address'), 
            door     = address.get('Door'), 
            floor    = address.get('Floor'), 
            country  = address.get('Country'), 
            postal   = address.get('Postal')
        )
        db_session.add(new_address)
        db_session.commit()

        response = jsonify(1)
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response

# Endcart: chamada quando o user finaliza a compra, apaga o carrinho atual e adiciona ao pasbuy, 
# que são basicamente todas as encomendas já feitas e finalizadas
@app.route('/endCarts', methods=['POST'])
def end_carts():
    if 'user_id' in session:
        user_id = session['user_id']

        # Verificar se o user tem um cart
        user = db_session.query(User).filter_by(user_id=user_id).first()
        if not user:
            return jsonify({'error': 'User not found.'})

        user_cart = db_session.query(Cart).filter_by(user_id=user_id).first()
        if not user_cart:
            return jsonify({'error': 'User has no active cart.'})

        if not user_cart.items:
            return jsonify({'error': 'Cannot complete purchase with an empty cart.'})

        try:
            historical_order = PurchasedItem(
                user_id=user_id,
                items=user_cart.items,
                total_cost=user_cart.total_cost
            )
            db_session.add(historical_order)

            # Eliminar o cart
            db_session.delete(user_cart)
            db_session.commit()

            return jsonify({'message': 'Purchase completed!'}, 200) # 200 = "Ok"

        except Exception as e:
            return jsonify({'error': f'Error: {str(e)}'}, 400) # 400 = "BadRequest"

    return jsonify({'error': 'Please log in first!'}, 400)

@app.route('/Ratings')
def get_ratings():
    ratings_data = db_session.query(ProductRatings).all()
    ratings_list = []
    for rating in ratings_data:
        rating_dict = {
            'rating_id': rating.rating_id,
            'product_id': rating.product_id,
            'user_id': rating.user_id,
            'rating': rating.rating,
            'comment': rating.comment,
            'timestamp': rating.timestamp
        }
        ratings_list.append(rating_dict)
    return jsonify(ratings_list)


@app.route('/Items')
def get_items():
    products_data = db_session.query(Product).all()
    products_list = []
    for product in products_data:
        product_dict = {
            'id': product.id,
            'title': product.title,
            'descrip': product.descrip,
            'category': product.category,
            'price': product.price,
            'stock': product.stock,
            'meadrating': float(product.meadrating), 
            'imagePath': product.imagePath
        }
        products_list.append(product_dict)
    response = jsonify(products_list)
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response

# ROTA: ADD PRODUCT (ADMIN ONLY)
@app.route('/add_product', methods=['POST'])
def add_product_route():
    if 'user_id' in session:
        user_id = session['user_id']
        user = db_session.query(User).filter_by(user_id=user_id).first()
        if user.role == "Admin":
            if request.method == 'POST':
                title = bleach.clean(request.form.get('new_title'), strip=True)
                description = bleach.clean(request.form.get('new_description'), strip=True)
                category = bleach.clean(request.form.get('new_category'), strip=True)
                price = bleach.clean(request.form.get('new_price'), strip=True)
                stock = bleach.clean(request.form.get('new_stock'), strip=True)

                success, message = add_product(db_session, title, description, category, price, stock)
                if success:
                    return jsonify({'message': message})
                else:
                    return jsonify({'error': message})
            else:
                return jsonify({'error': 'Invalid request method.'})
        else:
            return jsonify({'error': 'Only Admins can access this method.'})
    else:
        return jsonify({'error': 'Please log in first!'})

# ROTA: CHANGE PRODUCT (ADMIN ONLY)
@app.route('/change_product/<int:product_id>', methods=['POST'])
def change_product_route(product_id):
    if 'user_id' in session:
        user_id = session['user_id']
        user = db_session.query(User).filter_by(user_id=user_id).first()
        if user.role == "Admin":
            if request.method == 'POST':
                new_title = bleach.clean(request.form.get('new_title'), strip=True)
                new_description = bleach.clean(request.form.get('new_description'), strip=True)
                new_category = bleach.clean(request.form.get('new_category'), strip=True)
                new_price = bleach.clean(request.form.get('new_price'), strip=True)
                new_stock = bleach.clean(request.form.get('new_stock'), strip=True)

                success, message = change_product(db_session, product_id, new_title, new_description, new_category, new_price, new_stock)
                if success:
                    return jsonify({'message': message})
                else:
                    return jsonify({'error': message})
            else:
                return jsonify({'error': 'Invalid request method.'})
        else:
            return jsonify({'error': 'Only Admins can access this method.'})
    else:
        return jsonify({'error': 'Please log in first!'})


@app.route('/rate_comment_product', methods=['POST'])
def rate_comment_product_route():
    if 'user_id' in session:
        user_id = session['user_id']
        if request.method == 'POST':
            data = request.json
            product_id = bleach.clean(data.get('product_id'), strip=True)
            rating = bleach.clean(data.get('rating'), strip=True)
            comment = bleach.clean(data.get('comment'), strip=True)
            if not (product_id and rating and comment):
                return jsonify({'error': 'Insert product_id, rating and comment'})
            success, message = rate_comment_product(product_id, user_id, rating, comment)
            if success:
                return jsonify({'message': message})
            else:
                return jsonify({'error': message})
    else:
        return jsonify({'error': 'Please log in first!'})

@app.route('/check_role', methods=['POST'])
def check_role():
    if request.method == 'POST':
        email = bleach.clean(request.form['email'], strip=True)

        user = db_session.query(User).filter_by(email=email).first()

        if user:
            role = user.role
            if role == "User":
                return "User", jsonify({'message': f"The user with email {email} is a User."})
            elif role == "Admin":
                return "Admin", jsonify({'message': f"The user with email {email} is an Admin."})
            else:
                return jsonify({'message': f"The user with email {email} does not have a recognized role."})
        else:
            return jsonify({'message': f"No user found with email {email}."})
    else:
        return jsonify({'error': 'Invalid request method.'})


#########################################################################################
# ----------------------------------- AUX Funtions ------------------------------------ #
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #

# Add a new route for Google OAuth callback
def verify_google_token(google_token):
    CLIENT_ID = "933478365143-rff11v0iq4vls8ouobltdou7b7mlbdfb.apps.googleusercontent.com" 
    try:

        # Verify the token using Google's token verification endpoint
        id_info = id_token.verify_oauth2_token(google_token, requests.Request(), CLIENT_ID)
        
        return id_info

    except ValueError as e:
        # Token is invalid
        #f'Invalid token: {str(e)}'
        return False

def password_requirements(password):
    password = " ".join(password.split())
    if len(password) < 12 or len(password) > 128:
        return False
    return True
    
def lookup_pwned_api_password(pwd):
    sha1pwd = hashlib.sha1(pwd.encode('utf-8')).hexdigest().upper()
    head, tail = sha1pwd[:5], sha1pwd[5:]
    url = 'https://api.pwnedpasswords.com/range/' + head
    res = pyrequests.get(url)
    if res.ok:
        hashes = (line.split(':') for line in res.text.splitlines())
        count = next((int(count) for t, count in hashes if t == tail), 0)
        if count:
            return True
        else:
            return False
    else: 
        return False
    

if __name__ == "__main__":
    app.run(debug=False)

