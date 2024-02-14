#########################################################################################
#########################################################################################
# ----------------- SECURE DATABASE - TABLE INSERTS - SIO PROJECT Nº 1 ---------------- #
#   IMPORTANT: In an ideal app_sec, this document should be hidden, as it contains 
# sensible information regarding user credentials and activities. 
#########################################################################################
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #
from datetime import date
import bcrypt
from db_tables import User, Purchase, PurchasedItem, Product


def insert_data(session):
    
    user_data = [
        {"fname": 'Gonçalo', "lname": 'Costa', "email": 'goncosta@gmail.com', "nick": 'Costa', "passwd": 'PizzaSemFrutas!8246', "nib": None, "role": "Admin" },
        {"fname": 'Humberto', "lname": 'Oliveira', "email": 'humbertoliveira@gmail.com', "nick": 'Oliveira', "passwd": 'PizzaTemAnanás?9173', "nib": None, "role": "Admin"},
        {"fname": 'João', "lname": 'Vieira', "email": 'joaopvieira@ua.pt', "nick": 'JPNV', "passwd": 'password50458', "nib": 1, "role": "Customer"},
        {"fname": 'Miguel', "lname": 'Silva', "email": 'miguel.silva@gmail.com', "nick": 'MiguelSilva', "passwd": 'Querty1234', "nib": 2, "role": "Customer"},
        {"fname": 'Ana', "lname": 'Ferreira', "email": 'anaferreira96@gmail.com', "nick": 'Ferrero', "passwd": 'AsDf1996', "nib": 3, "role": "Customer"},
        {"fname": 'Raul', "lname": 'Ribeiro', "email": 'raul_rib15@gmail.com', "nick": 'Guillette', "passwd": 'TheBestAM@nCanGET8163=!', "nib": 4, "role": "Customer"},
        {"fname": 'André', "lname": 'Pereira', "email": 'pereirandre84@ua.pt', "nick": 'Pereirinha', "passwd": 'FuiA0J#rd1md@C3l3ste1973', "nib": 5, "role": "Customer"},
    ]
    
    purchases_data = [
        {"user_id": 1, "purch_date": date(2023, 11, 1)},
        {"user_id": 2, "purch_date": date(2023, 12, 14)},
        {"user_id": 3, "purch_date": date(2023, 11, 23)},
    ]

    purchased_items_data = [
        {"purch_id": 1, "product_id": 1, "quantity": 2},
        {"purch_id": 1, "product_id": 2, "quantity": 1},
        {"purch_id": 2, "product_id": 3, "quantity": 3},
        {"purch_id": 3, "product_id": 3, "quantity": 1},
        {"purch_id": 3, "product_id": 2, "quantity": 2},
    ]

    products_data = [
        {"title": 'Blue Hoodie - DETI', "descrip": 'Stay cozy and stylish in this DETI blue hoodie.', "price": 24.90},
        {"title": 'BluE Coffee Mug - DETI', "descrip": 'Start your day studying algorithms with a touch of DETI in your mug (pun intended).', "price": 9.90},
        {"title": 'Black DETI T-Shirt', "descrip": 'A classic black T-shirt for those hot days at the University.', "price": 14.90}
    ]

    try:
        for data in user_data:
        # Hash the password before inserting
            hashed_password = bcrypt.hashpw(data["passwd"].encode('utf-8'), bcrypt.gensalt(rounds=2**5)) # bcrypt é o algoritmo de hash que vamos usar! gensalt gera o salt de 2^5 rounds (seguro)
            data["passwd"] = hashed_password
            new_user = User(**data)
            session.add(new_user)

        for data in purchases_data:
            new_purchases = Purchase(**data)
            session.add(new_purchases)

        for data in purchased_items_data:
            new_purchased_items = PurchasedItem(**data)
            session.add(new_purchased_items)

        for data in products_data:
            new_products = Product(**data)
            session.add(new_products)

        session.commit()

    # Rollback de BD se der error
    except Exception as e:
        session.rollback()
        raise e

