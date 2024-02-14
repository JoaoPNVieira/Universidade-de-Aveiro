from flask import Flask, render_template, request, redirect, flash, session, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from werkzeug.security import check_password_hash
from db_tables import PurchasedItem, User, Cart, Address, Product, ProductRatings
import os
import bcrypt
from  db_aux import add_product, change_product, rate_comment_product 
import bleach # Sanitize users input
#!: CWE 307-1 (vai ser preciso pip install Flask-Limiter)
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

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

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        fname = bleach.clean(request.form['fname'], strip=True)
        lname = bleach.clean(request.form['lname'], strip=True)
        email = bleach.clean(request.form['email'], strip=True)
        nick = bleach.clean(request.form['nick'], strip=True)
        password = bleach.clean(request.form['password'], strip=True)
        confirm = bleach.clean(request.form['confirm'], strip=True)
        nib = bleach.clean(request.form['nib'], strip=True)

        if password != confirm:
            flash("Passwords do not match.", 'error')
        else:
            existing_user = db_session.query(User).filter_by(email=email).first()
            if existing_user:
                flash("Email or nickname is already in use.", 'error')
            else:
                # Hash de passwords!!! :)
                hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
                user = User(fname=fname, lname=lname, email=email, nick=nick, passwd=hashed_password, nib=nib, role="Customer")
                db_session.add(user)
                db_session.commit()
                flash("Registration complete!", 'SUCESS')
                return redirect('/login')

    return render_template('signup.html')


@app.route('/login', methods=['GET', 'POST'])
@limiter.limit("5/hour")
@limiter.limit("20/day") 
def login():
    if request.method == 'POST':
        email = bleach.clean(request.form['email'], strip=True)
        password = bleach.clean(request.form['password'], strip=True)

        user = db_session.query(User).filter_by(email=email).first()
        
        if user and check_password_hash(user.passwd, password):
            session['user_id'] = user.user_id
            user.failed_login_attempts = 0
            flash("You have logged in successfully!", 'SUCESS')
            return redirect('/dashboard')
        else:
            db_session.commit()
            flash("Login failed. Please check your credentials again!", 'ERROR')


    return render_template('login.html')

@app.route('/change_password', methods=['POST'])
def change_password():
    if 'user_id' in session:
        user_id = session['user_id']
        if request.method == 'POST':
            current_password = bleach.clean(request.form['current_password'], strip=True)
            new_password = bleach.clean(request.form['new_password'], strip=True)

            user = db_session.query(User).filter_by(user_id=user_id).first()

            if not (user and check_password_hash(user.passwd, current_password)):
                flash("Current password is incorrect!", 'error')
                return redirect('/dashboard')

            hashed_password = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt())
            user.passwd = hashed_password
            db_session.commit()

            flash("Password changed successfully!", 'success')
            return redirect('/dashboard')
    else:
        flash("You need to login first! ", 'error')
        return redirect('/login')


@app.route('/dashboard')
def dashboard():
    if 'user_id' in session:
        user_id = session['user_id']
        user = db_session.query(User).filter_by(user_id=user_id).first()

        return render_template('dashboard.html', user=user)
    else:
        flash("You need to login first! ", 'ERROR')
        return redirect('/login')
    

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    flash("You have logged out.", 'SUCESS')
    return redirect('/login')


@app.route('/mecart', methods=['POST'])
def mecart():

    # Extract necessary data from the request
    email = bleach.clean(request.form['email'], strip=True)
    if '%40' in email:
        email = email.replace('%40', '@')

    user = db_session.query(User).filter_by(email=email).first()

    if user:
        user_cart = db_session.query(Cart).filter_by(user_id=user.user_id).first()

        if user_cart:
            cart_data = {
                "cart_id": user_cart.cart_id,
                "total_cost": user_cart.total_cost,
                "in_cart": user_cart.in_cart
            }
            return jsonify(cart_data)
        else:
            return jsonify({"error": "User has no cart."})
    else:
        return jsonify({"error": "User not found."})
    

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
        return jsonify(1)
    else:
        return jsonify({"error": "User not found."})


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

        return jsonify(1)
    else:
        return jsonify({"error": "User not found."})

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
            'meadrating': float(product.meadrating) 
        }
        products_list.append(product_dict)
    return jsonify(products_list)

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

@app.route('/search_product', methods=['POST'])
def search_product():
    if request.method == 'POST':
        search_query = bleach.clean(request.form.get('query'), strip=True)
        query = text("SELECT * FROM products WHERE descrip LIKE :search_query")

        products = db_session.execute(query, {"search_query": f"%{search_query}%"})
        return render_template('search_results.html', products=products)

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
            if role == "Customer":
                return "Customer", jsonify({'message': f"The user with email {email} is a Customer."})
            elif role == "Admin":
                return "Admin", jsonify({'message': f"The user with email {email} is an Admin."})
            else:
                return jsonify({'message': f"The user with email {email} does not have a recognized role."})
        else:
            return jsonify({'message': f"No user found with email {email}."})
    else:
        return jsonify({'error': 'Invalid request method.'})

if __name__ == "__main__":
    app.run(debug=True)

