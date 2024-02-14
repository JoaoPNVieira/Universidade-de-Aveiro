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
    
    """
    user_data = [
        {"fname": 'Gonçalo', "lname": 'Costa', "email": 'goncosta@gmail.com', "nick": 'Costa', "passwd": 'PizzaSemFrutas!8246', "nib": None, "role": "Admin" },
        {"fname": 'Humberto', "lname": 'Oliveira', "email": 'humbertoliveira@gmail.com', "nick": 'Oliveira', "passwd": 'PizzaTemAnanás?9173', "nib": None, "role": "Admin"},
        {"fname": 'João', "lname": 'Vieira', "email": 'joaopvieira@ua.pt', "nick": 'JPNV', "passwd": 'password50458', "nib": 1, "role": "User"},
        {"fname": 'Miguel', "lname": 'Silva', "email": 'miguel.silva@gmail.com', "nick": 'MiguelSilva', "passwd": 'Querty1234', "nib": 2, "role": "User"},
        {"fname": 'Ana', "lname": 'Ferreira', "email": 'anaferreira96@gmail.com', "nick": 'Ferrero', "passwd": 'AsDf1996', "nib": 3, "role": "User"},
        {"fname": 'Raul', "lname": 'Ribeiro', "email": 'raul_rib15@gmail.com', "nick": 'Guillette', "passwd": 'TheBestAM@nCanGET8163=!', "nib": 4, "role": "User"},
        {"fname": 'André', "lname": 'Pereira', "email": 'pereirandre84@ua.pt', "nick": 'Pereirinha', "passwd": 'FuiA0J#rd1md@C3l3ste1973', "nib": 5, "role": "User"},
    ]
    
    
    purchases_data = [
        {"user_id": 1, "purch_date": date(2023, 11, 1)},
        {"user_id": 2, "purch_date": date(2023, 12, 14)},
        {"user_id": 3, "purch_date": date(2023, 11, 23)},
    ]

    purchased_items_data = [
        {"purch_id": 1, "product_id": 1, "quantity": 2, "items": None, "total_cost": None},
        {"purch_id": 1, "product_id": 2, "quantity": 1, "items": None, "total_cost": None},
        {"purch_id": 2, "product_id": 3, "quantity": 3, "items": None, "total_cost": None},
        {"purch_id": 3, "product_id": 3, "quantity": 1, "items": None, "total_cost": None},
        {"purch_id": 3, "product_id": 2, "quantity": 2, "items": None, "total_cost": None},
    ]
    """

    products_data = [
        {"title": 'Hoodie Detitalismo', "descrip": 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', "price": 49.90, "category": 'Clothes', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Hoodie/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'DETI HeadPhones', "descrip": 'For all the hours of hard work our enginners endure we created this amazing wireless headphones. For music, gaming or hours of reunions they give ou the best accoustic inside while keeping every other noise outside.', "price": 65.00, "category": 'Accessories', "stock": 100, "meadrating": 4.0, "imagePath": "Images/HeadPhones/"},
        {"title": 'Marble MousePad', "descrip": 'Do you want to increase your poductivity while keeping your setup super clean? This mousepad alows exactly that giving you a confortable and durable surface for everyday use.', "price": 14.90, "category": 'Home', "stock": 75, "meadrating": 4.2, "imagePath": "Images/MousePad/"},
        {"title": 'Java Trucker Cap', "descrip": 'You may not leave your chair a lot but if you do, you must be protected. This stylish cap can protect and your eyes from every bit os excess light, also blocking UVA and UVB.', "price": 9.90, "category": 'Clothes', "stock": 75, "meadrating": 4.2, "imagePath": "Images/Cap/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"},
        {"title": 'Java Thermal Cup', "descrip": 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', "price": 5.50, "category": 'Home', "stock": 50, "meadrating": 4.5, "imagePath": "Images/Cup/"}
        
    ]
    
    try:
        """
        for data in user_data:
            hashed_password = bcrypt.hashpw(data["passwd"].encode('utf-8'), bcrypt.gensalt(rounds=16)) 
            data["passwd"] = hashed_password
            new_user = User(**data)
            session.add(new_user)
    
        for data in purchases_data:
            new_purchases = Purchase(**data)
            session.add(new_purchases)

        for data in purchased_items_data:
            new_purchased_items = PurchasedItem(**data)
            session.add(new_purchased_items)

        """

        for data in products_data:
            new_products = Product(**data)
            session.add(new_products)

        session.commit()

    # Rollback de BD se der error
    except Exception as e:
        session.rollback()
        raise e

