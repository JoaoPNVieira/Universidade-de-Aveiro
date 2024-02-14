#########################################################################################
#########################################################################################
# ----------------- INSECURE DATA BASE FOR SIO PROJECT Nº 1 --------------------------- #
#########################################################################################
#########################################################################################
#
#
#
from datetime import datetime
import hashlib
import re
#import bcrypt
from flask import Flask, jsonify, render_template, request, redirect, g
import sqlite3
import os

##########################################################################################
# ----------------- INITIALIZE DATABASE CONECTION AND CURSOR -------------------------- #
# -----                                                                           ----- #
def __init_db__():
    con, cur = connect_db()
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
#########################################################################################
#########################################################################################
# ----------------- BEGIN: TABLES & INSERTS OF DATABASE ------------------------------- #
#
#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: ADMIN ------------------------------------------------------ #
# -----                                                                           ----- #
    cur.execute("""DROP TABLE IF EXISTS admins""")
    cur.execute(
         """CREATE TABLE admins (
        admin_id    INTEGER                         PRIMARY KEY     ,
        fname       VARCHAR(32)     NOT NULL                        ,
        lname       VARCHAR(32)     NOT NULL                        ,
        email       VARCHAR(64)     NOT NULL        UNIQUE          ,
        nick        VARCHAR(32)     NOT NULL        UNIQUE          ,
        passwd      VARCHAR(64)     NOT NULL                        ,
        role        VARCHAR(16)     NOT NULL                        ); 
        """
    )
#
# ----------------- INSERTS: ADMIN
    cur.execute("INSERT INTO admins (fname, lname, email, nick, passwd, role) VALUES (?, ?, ?, ?, ?, ?)",('Gonçalo', 'Costa', 'goncosta@gmail.com', 'Costa', hash_password('PizzaSemFrutas!8246'), 'Admin'))

    cur.execute("INSERT INTO admins (fname, lname, email, nick, passwd, role) VALUES (?, ?, ?, ?, ?, ?)",('Humberto', 'Oliveira', 'humbertoliveira@gmail.com', 'Oliveira', hash_password('PizzaTemAnanás?9173'), 'Admin'))

# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PRODUCTS --------------------------------------------------- #
# -----  
    #cur.execute("""DROP TABLE IF EXISTS ITEMS""")
    cur.execute(
        """CREATE TABLE IF NOT EXISTS ITEMS (
        ID          INTEGER                         PRIMARY KEY ,
        NAME        VARCHAR(32)     NOT NULL                    ,
        DESCRIPTION VARCHAR(12800)                                ,
        CATEGORY    VARCHAR(16)     NOT NULL                    ,
        IMAGES      VARCHAR(32)     NOT NULL                    ,
        PRICE       DECIMAL         NOT NULL                    ,
        STOCK       INTEGER         NOT NULL                    );
        """
    ) 
#    
# ----------------- INSERTS:
    #cur.execute("INSERT INTO ITEMS (ID, NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES (0,'Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Java Thermal Cup', 'This thermal cup was made with recycled coffee beans from DETIs machine. It can withstand both high and freezing tempratures, while saving your hands from potential burns. However, Be Careful With Your Tongue.', 'Home', 'Images/Cup/' , 5.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('DETI HeadPhones', 'For all the hours of hard work our enginners endure we created this amazing wireless headphones. For music, gaming or hours of reunions they give ou the best accoustic inside while keeping every other noise outside.', 'Accessories', 'Images/HeadPhones/' , 65.00, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Marble MousePad', 'Do you want to increase your poductivity while keeping your setup super clean? This mousepad alows exactly that giving you a confortable and durable surface for everyday use.', 'Home', 'Images/MousePad/' , 12.35, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Java Trucker Cap', 'You may not leave your chair a lot but if you do, you must be protected. This stylish cap can protect and your eyes from every bit os excess light, also blocking UVA and UVB.', 'Clothes', 'Images/Cap/' , 10.00, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
    #cur.execute("INSERT INTO ITEMS (NAME, DESCRIPTION, CATEGORY, IMAGES, PRICE, STOCK) VALUES ('Hoodie Detitalismo', 'This 100 cotton hoodie was made by extrmely advanced robots created by DETI students, the best engineers in the world. This hoodie is made to last and to give you confort everyday.', 'Clothes', 'Images/Hoodie/' , 49.50, 50)")
#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CUSTOMERS -------------------------------------------------- #
# -----                                                                           ----- #
    cur.execute(
        """CREATE TABLE IF NOT EXISTS USERS (
        ID          INTEGER                         PRIMARY KEY     ,
        FNAME       VARCHAR(32)     NOT NULL                        ,
        LNAME       VARCHAR(32)     NOT NULL                        ,
        EMAIL       VARCHAR(64)     NOT NULL        UNIQUE          ,
        PASSWORD    VARCHAR(32)     NOT NULL                        ,
        PHONE       INTEGER         NOT NULL                        ,
        NIF         DECIMAL                                         ,
        ROLE        VARCHAR(16)     NOT NULL                        );
        """
    )

# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: ADDRESSES -------------------------------------------------- #
# -----                                                                           ----- #
    cur.execute(
        """CREATE TABLE IF NOT EXISTS ADDRESS (
        ID          INTEGER                         PRIMARY KEY                     ,
        USERID      INTEGER                         REFERENCES USERS(ID)            ,
        ADDR        VARCHAR(128)    NOT NULL                                        ,
        DOOR        VARCHAR(8)      NOT NULL                                        ,
        FLOOR       VARCHAR(8)                                                      ,
        COUNTRY     VARCHAR(32)     NOT NULL                                        ,
        POSTAL      VARCHAR(16)                                                     ); 
        """
    )

#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CARTS ------------------------------------------------------ #
# -----                                                                           ----- #                                     
    cur.execute(                                                                        
        """CREATE TABLE IF NOT EXISTS CART (
        ID          INTEGER                         PRIMARY KEY                     ,
        USERID      INTEGER                         REFERENCES  USERS(ID)           ,
        ITEM0       INTEGER                                                         ,
        ITEM1       INTEGER                                                         ,
        ITEM2       INTEGER                                                         ,
        ITEM3       INTEGER                                                         ,
        ITEM4       INTEGER                                                         ,
        ITEM5       INTEGER                                                         ,
        ITEM6       INTEGER                                                         ,
        ITEM7       INTEGER                                                         ,
        ITEM8       INTEGER                                                         ,
        ITEM9       INTEGER                                                         ,
        ITEM10      INTEGER                                                         ,
        ITEM11      INTEGER                                                         ,
        TOTAL       DECIMAL         NOT NULL                                        );
        """
    )
#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: WISHLIST ------------------------------------------------- #
# -----                                                                           ----- #
    cur.execute("""DROP TABLE IF EXISTS cart_items""")                                        
    cur.execute(                                                                        
        """CREATE TABLE IF NOT EXISTS WISHLIST (
        ID          INTEGER                         PRIMARY KEY                     ,
        USERID      INTEGER                         REFERENCES  USERS(ID)           ,
        ITEM0       INTEGER                                                         ,
        ITEM1       INTEGER                                                         ,
        ITEM2       INTEGER                                                         ,
        ITEM3       INTEGER                                                         ,
        ITEM4       INTEGER                                                         ,
        ITEM5       INTEGER                                                         ,
        ITEM6       INTEGER                                                         ,
        ITEM7       INTEGER                                                         ,
        ITEM8       INTEGER                                                         ,
        ITEM9       INTEGER                                                         ,
        ITEM10      INTEGER                                                         ,
        ITEM11      INTEGER                                                         );
        """
    )

#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PURCHASES -------------------------------------------------- #
# -----  
    cur.execute(
        """CREATE TABLE IF NOT EXISTS PASTBUYS (
        ID          INTEGER                         PRIMARY KEY                     ,
        USERID      INTEGER                         REFERENCES  USERS(ID)           ,
        ITEM0       INTEGER                                                         ,
        ITEM1       INTEGER                                                         ,
        ITEM2       INTEGER                                                         ,
        ITEM3       INTEGER                                                         ,
        ITEM4       INTEGER                                                         ,
        ITEM5       INTEGER                                                         ,
        ITEM6       INTEGER                                                         ,
        ITEM7       INTEGER                                                         ,
        ITEM8       INTEGER                                                         ,
        ITEM9       INTEGER                                                         ,
        ITEM10      INTEGER                                                         ,
        ITEM11      INTEGER                                                         ,
        TOTAL       DECIMAL         NOT NULL                                        );
        """
    )
#
# ----------------- INSERTS: PURCHASES
    #cur.execute("INSERT INTO purchases (user_id, purch_date) VALUES (1, '2023-11-01')")
    #cur.execute("INSERT INTO purchases (user_id, purch_date) VALUES (2, '2023-12-14')")
    #cur.execute("INSERT INTO purchases (user_id, purch_date) VALUES (3, '2023-11-23')")

#
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PRODUCTS COMMENTS & RATING --------------------------------- #
# ----- 
    cur.execute("""DROP TABLE IF EXISTS product_comments""")
    cur.execute(
        """CREATE TABLE IF NOT EXISTS RATINGS (
        ID          INTEGER                         PRIMARY KEY                     ,
        USERID      INTEGER                         REFERENCES USERS(ID)            ,
        PRODUCTID   INTEGER                         REFERENCES ITEMS(ID)            ,
        RATING      INTEGER         NOT NULL                                        ,
        REVIEW      TEXT                                                            ,
        TIME   TIMESTAMP                                                       );
        """
    )
    #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PAYMENTS --------------------------------------------------- #
# -----                                                                           ----- #
    cur.execute("""DROP TABLE IF EXISTS payments""")
    cur.execute(
        """CREATE TABLE payments (
        cart_id     INTEGER                         REFERENCES  cart(cart_id)   ,
        mbway       VARCHAR(256)    NOT NULL                                    ,
        ref_mb      VARCHAR(256)    NOT NULL                                    ,
        paypal      VARCHAR(256)    NOT NULL                                    );
        """
    )
#
#
# ------------------ END: TABLES & INSERTS OF DATABASE -------------------------------- #
#########################################################################################
#########################################################################################
#
    con.commit()
    con.close()
#
#########################################################################################
#########################################################################################
# ----------------- BEGIN: AUX. FUNCITONS FOR DATABASE -------------------------------- #
# -----                                                                           ----- #
#
# ----- FUNCTION connect_db():
#
def connect_db():
        directory = os.path.dirname(os.path.abspath(__file__))
        db_path = os.path.join(directory, 'DOSG26.db')
        con = sqlite3.connect(db_path, check_same_thread=False)
        cur = con.cursor()
        return con, cur 

# VULNERABILIDADE SUBTIL: Permite que um atacante se registe multiplas veses usando Upper e Lower cases (letras maiusculas e minusculas)
def new_customer(email, password):
    con, cur = connect_db()
    cur.execute(f"SELECT email FROM users WHERE email = '{email}'")
    existing_email = cur.fetchone()

    # Verificação não é case-sensitive:
    if existing_email:
        con.close()
        return "Email address already registered."

    # Se o email não existir, faz registo sem verificar case-sensitive 
    cur.execute(f"INSERT INTO users (email, password) VALUES ('{email}', '{password}')")
    con.commit()
    con.close()
    return "Registration successful."

# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
# CWE-319: Cleartext Transmission of Sensitive Information -> Transmissão de dados sensíveis de forma não codificada (credencias dos utilizadores) 
# Função para verificar se o email já existe na base de dados. True -> Existe | False -> Não existe
def check_email(email):
    con, cur = connect_db()
    query_email = f"SELECT EXISTS(SELECT 1 FROM customers WHERE email = ?);"
    cur.execute(query_email, (email,))
    email_exists = cur.fetchone()[0]
    con.close()
    return bool(email_exists)


# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
# CWE-319: Cleartext Transmission of Sensitive Information -> Transmissão de dados sensíveis de forma não codificada (credencias dos utilizadores)
# Função para verificar se o nicl já existe na base de dados. True -> Existe | False -> Não existe 

def check_nick(nick):
    con, cur = connect_db()
    query_nick = f"SELECT EXISTS(SELECT 1 FROM customers WHERE nick = ?);"
    cur.execute(query_nick, (nick,))
    nick_exists = cur.fetchone()[0]
    con.close()
    return nick_exists


# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
# Função usada para classificar e comentar os produtos
def rate_comment_product(product_id, user_id, rating, comment):

    con, cur = connect_db()
    try:
        timestamp = datetime.datetime.now().strftime("%c") # Ex: Wed Nov 01 16:03:43 2023
        cur.execute(
            f"""INSERT INTO product_ratings (
                product_id, user_id, rating, comment, timestamp) VALUES ({product_id}, {user_id}, {rating}, '{comment}', '{timestamp}')"""
        )

        cur.execute(
            f"""INSERT INTO product_comments (
                product_id, user_id, comment, timestamp) VALUES ({product_id}, {user_id}, '{comment}', '{timestamp}')"""
        )

        con.commit()
        con.close()
        msg = "Thank your for rating and commenting our product!"
        return True, msg
    
    except Exception as e:
        error = f"Error: {str(e)}"
        return False, error


# CWE-521: Weak Password Requirements
# CWE-326: Inadequate Encryption Strength
def hash_password(password):
    sha1_hash = hashlib.sha1(password.encode('utf-8')).hexdigest()
    return sha1_hash



# ADD PRODUCT (ADMINS)
# CWE-284: Improper Access Control
# CWE-20:  Improper Input Validation
# CWE-79:  Improper Neutralization of Input During Web Page Generation
# CWE-89:  Improper Neutralization of Special Elements used in an SQL Command
# CWE-311: Missing Encryption of Sensitive Data
# CWE-319: Cleartext Transmission of Sensitive Information
def add_product(title, description, category, price, stock):
    try:
        con, cur = connect_db()
        query = f""" 
        INSERT INTO products (title, descrip, category, price, stock)
        VALUES ('{title}', '{description}', '{category}', '{price}', '{stock}')
        """
        cur.execute(query)

        con.commit()
        con.close()

        return "New product added!"
    except Exception as e:
        return f"Error: {str(e)}"

# CHANGE PRODUCT (ADMINS)
# CWE-284: Improper Access Control
# CWE-209: Information Exposure Through an Error Message
# CWE-20:  Improper Input Validation
# CWE-79:  Improper Neutralization of Input During Web Page Generation
# CWE-89:  Improper Neutralization of Special Elements used in an SQL Command
# CWE-311: Missing Encryption of Sensitive Data
# CWE-319: Cleartext Transmission of Sensitive Information
def change_product(product_id, new_title, new_description, new_category, new_price, new_stock):
    try:
        con, cur = connect_db()

        query = f""" 
        UPDATE products
        SET title = '{new_title}', descrip = '{new_description}', category = '{new_category}', price = '{new_price}', stock = '{new_stock}'
        WHERE product_id = '{product_id}' 
        """
        cur.execute(query)

        con.commit()
        con.close()

        return "Product updated!"
    except Exception as e:
        return f"Error: {str(e)}"

        


#
#########################################################################################
#########################################################################################
# ----------------- CREATE APP, ROUTES ------------------------------------------------ #
# -----                                                                           ----- #
# ----- GLOBAL VARIABLES

user_session = {} # VULNERABILITY: Session Hijacking


app = Flask(__name__)
__init_db__()

# ----- API ROUTES 

# As credenciais do utilizar vão ser guardadas utilizando um statefull protocol, server side 
# As creddencias do utilizar deviam ser guardadas utilizando um stateless protocol, client side

# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
# CWE-319: Cleartext Transmission of Sensitive Information -> Transmissão de dados sensíveis de forma não codificada (credencias dos utilizadores)
# CWE-257: Storing Passwords in a Recoverable Format -> Armazenar passwords sem que estas estejam codificadas, deve ser usado alguma forma de encrpitação
@app.route('/register', methods=['POST'])
def register():

    con, cur = connect_db()
    data = request.json  # Extrair os dados JSON da solicitação

    # Extrair os valores do dicionário de dados
    fname = data.get('FName')
    lname = data.get('LName')
    email = data.get("Email")
    passwd = data.get("Password")
    phone = data.get("Phone")
    nif = data.get("Nif")

    # Verificar Campos
    cur.execute("SELECT EMAIL FROM USERS")
    emailList = cur.fetchall()
    for i in emailList:
        if email == i[0]:
            return jsonify(False)

    # Adicionar cliente ao banco de dados
    cur.execute("INSERT INTO USERS (FNAME, LNAME, EMAIL, PASSWORD, PHONE, NIF, ROLE) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', 'Customer')".format(fname, lname, email, passwd, phone, nif))
    cur.execute("SELECT ID FROM USERS WHERE EMAIL = '{}'".format(email))
    user_id = cur.fetchone()[0]
    cur.execute("INSERT INTO CART (USERID, ITEM0, ITEM1, ITEM2, ITEM3, ITEM4, ITEM5, ITEM6, ITEM7, ITEM8, ITEM9, ITEM10, ITEM11, TOTAL) VALUES ('{}', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')".format(user_id))
    cur.execute("INSERT INTO WISHLIST (USERID, ITEM0, ITEM1, ITEM2, ITEM3, ITEM4, ITEM5, ITEM6, ITEM7, ITEM8, ITEM9, ITEM10, ITEM11) VALUES ('{}', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')".format(user_id))
    con.commit()
    cur.close()
    con.close()

    return jsonify(True)


# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
@app.route('/login', methods=['POST'])
def login():
    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    #################################################################################### 
    # --------[ VULNERABILIDADE: CWE-89: SQL Injection - USERNAME E PASSWORD ]-------- #
    # 
    email = data.get('Email')
    passwd = data.get('Password')

    # No código acima, username e password são inseridos DIRECTAMENTE numa declaração SQL.
    # Um atacante pode fazer o seguinte input:
    #   Username: ' OR '1'='1
    #   Password: ' OR '1'='1
    # 
    # Assim, poderia manipular a declaração SQL directa da seguinte forma: 
    #   SELECT * FROM users WHERE username = '' OR 1=1 --' AND password = '...'
    # 
    #   EXPLICAÇÃO: Os -- no fim da declaração a cima, são usadas para comentar o resto da QUERY, fazendo assim que se ignore a password correcta do utilizador (completamente) 
    #               Assim, retorna todas as linhas onde a condição 1=1 é verdadeira (sempre). Assim o atacante consegue fazer um bypass e obter acesso não autorizado 
    #               (Politica infringida da organização).
    #          
    #   FUTURA CORRECÇÃO: Usar QUERIES parameterizadas (preparadas), que garantam que os inputs de utilizadores são tratados como DADOS e não como SQL Code. 
    #                     Usar ainda HASHs. NESTE MOMENTO: Passwords estão armazenadas sem serem cifradas!!!                 
    #   
    #   NOTA: Passwords devem ser cifradas se forem armazenadas (usar uma hash e uma "salt pass" - similar mas inverso a um password Horcrux, mas do ponto de vista da DB)
    #         Hashs e Salts devem ser armazenadas na DB.                 

   
    query = f"SELECT PASSWORD FROM USERS WHERE EMAIL = '{email}' AND PASSWORD = '{passwd}'"

    cur.execute(query)
    
    user_data = cur.fetchone()
    cur.close()
    con.close()

    if user_data:
        return jsonify(1)
    else:
        return jsonify(0)

# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
# CWE-319: Cleartext Transmission of Sensitive Information
@app.route('/change_password', methods=['POST'])
def change_password():
    con, cur = connect_db()
    data = request.json  

    email = data[0]
    new_password = data[1]

    if '%40' in email:
        email = email.replace('%40', '@')


    cur.execute("SELECT EMAIL FROM USERS")
    emailList = cur.fetchall()
    for i in emailList:
        if email == i[0]:
            cur.execute(f"SELECT PASSWORD FROM USERS WHERE EMAIL = '{email}'")
            cur.execute(f"UPDATE USERS SET PASSWORD = '{new_password}' WHERE EMAIL = '{email}'")
            con.commit()
            cur.close()
            con.close()
            return jsonify(1)
        else:
            return jsonify(2)
    cur.close()
    con.close()
    return jsonify(0)


@app.route('/mecart', methods=['POST'])
def mecart():

    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    # Extract necessary data from the request
    email = data
    if '%40' in email:
        email = email.replace('%40', '@')


    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{email}'") 
    user_id = cur.fetchone()[0]
    cur.execute(f"SELECT * FROM CART WHERE USERID = {user_id}")
    user_cart = cur.fetchall()

    cur.close()
    con.close()

    return jsonify(user_cart[0][2:])

@app.route('/meaddr', methods=['POST'])
def meaddr():

    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    # Extract necessary data from the request
    email = data
    if '%40' in email:
        email = email.replace('%40', '@')


    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{email}'") 
    user_id = cur.fetchone()[0]
    cur.execute(f"SELECT * FROM ADDRESS WHERE USERID = {user_id}")
    addrs = cur.fetchall()

    cur.close()
    con.close()

    return jsonify(addrs)


@app.route('/updateCarts', methods=['POST'])
def upCart():

    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    # Extract necessary data from the request
    user = data[0]
    if '%40' in user:
        user = user.replace('%40', '@')

    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{user}'") 
    user_id = cur.fetchone()[0]

    cur.execute(f"DELETE FROM CART WHERE USERID = {user_id}")
    cur.execute(f"INSERT INTO CART (USERID, ITEM0, ITEM1, ITEM2, ITEM3, ITEM4, ITEM5, ITEM6, ITEM7, ITEM8, ITEM9, ITEM10, ITEM11, TOTAL) VALUES ({user_id}, {data[1][0]}, {data[1][1]}, {data[1][2]}, {data[1][3]}, {data[1][4]}, {data[1][5]}, {data[1][6]}, {data[1][7]}, {data[1][8]}, {data[1][9]}, {data[1][10]}, {data[1][11]}, {data[2]})")

    con.commit()
    cur.close()
    con.close()
    return jsonify(1)

@app.route('/postAddress', methods=['POST'])
def pstAddr():

    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request
    print(data)

    # Extract necessary data from the request
    user = data.get('User')
    if '%40' in user:
        user = user.replace('%40', '@')

    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{user}'") 
    user_id = cur.fetchone()[0]
    
    cur.execute(f"INSERT INTO ADDRESS (USERID, ADDR, DOOR, FLOOR, COUNTRY, POSTAL) VALUES ({user_id}, '{data.get('Address')}', {data.get('Door')}, {data.get('Floor')}, '{data.get('Country')}', '{data.get('Postal')}')")

    con.commit()
    cur.close()
    con.close()
    return jsonify(1)


@app.route('/endCarts', methods=['POST'])
def endCart():

    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    # Extract necessary data from the request
    user = data[0]
    if '%40' in user:
        user = user.replace('%40', '@')

    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{user}'") 
    user_id = cur.fetchone()[0]
    cur.execute(f"SELECT TOTAL FROM CART WHERE USERID = {user_id}")
    data[2] = cur.fetchone()[0]

    cur.execute(f"DELETE FROM CART WHERE USERID = {user_id}")
    cur.execute(f"INSERT INTO CART (USERID, ITEM0, ITEM1, ITEM2, ITEM3, ITEM4, ITEM5, ITEM6, ITEM7, ITEM8, ITEM9, ITEM10, ITEM11, TOTAL) VALUES ({user_id}, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)")
    cur.execute(f"INSERT INTO PASTBUYS (USERID, ITEM0, ITEM1, ITEM2, ITEM3, ITEM4, ITEM5, ITEM6, ITEM7, ITEM8, ITEM9, ITEM10, ITEM11, TOTAL) VALUES ({user_id}, {data[1][0]}, {data[1][1]}, {data[1][2]}, {data[1][3]}, {data[1][4]}, {data[1][5]}, {data[1][6]}, {data[1][7]}, {data[1][8]}, {data[1][9]}, {data[1][10]}, {data[1][11]}, {data[2]})")

    con.commit()
    cur.close()
    con.close()
    return jsonify(1)


@app.route('/Ratings')
def get_ratings():

    con, cur = connect_db()
    cur.execute("SELECT * FROM RATINGS")
    data = cur.fetchall()
    cur.close()
    con.close()
    return jsonify(data)

# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores 
@app.route('/Items')
def get_items():
    con, cur = connect_db()
    cur.execute("SELECT * FROM ITEMS")
    data = cur.fetchall()
    cur.close()
    con.close()
    return jsonify(data)
    
@app.route('/rate_comment_product', methods=['POST'])
def rate_comment_product_route():
    con, cur = connect_db()
    data = request.json  # Extract the JSON data from the request

    # Extract necessary data from the request
    product_id = data.get('Product')
    user = data.get('User')
    rating = data.get('Rating')
    comment = data.get('Comment')
    if '%40' in user:
        user = user.replace('%40', '@')

    cur.execute(f"SELECT ID FROM USERS WHERE EMAIL = '{user}'")
    user_id = cur.fetchone()[0]

    cur.execute(f"INSERT INTO RATINGS (USERID, PRODUCTID, RATING, REVIEW) VALUES ({user_id}, {product_id}, {rating}, '{comment}')")
    con.commit()
    cur.close()
    con.close()

    return jsonify(data)
        

# CWE-89: SQL Injection -> Não há verificação do input dos utilizadores F
@app.route('/search_product', methods=['POST'])
def search_product():
    if request.method == 'POST':
        search_query = request.form.get('query')
        con, cur = connect_db()

        query = f"SELECT * FROM products WHERE descrip LIKE '%{search_query}%';"
    
        cur.execute(query)
        products = cur.fetchall()
        con.close()

    return render_template('search_results.html', products=products)


if __name__ == "__main__":
    app.run(debug=True)

# ROTA: ADD PRODUCT (ADMIN)
# CWE-284: Improper Access Control
# CWE-20:  Improper Input Validation
# CWE-209  Information Exposure Through an Error Message
# CWE-89:  Improper Neutralization of Special Elements used in an SQL Command
@app.route('/add_product', methods=['POST'])
def add_product_route():
    if request.method == 'POST':
        title = request.form.get('title')
        description = request.form.get('description')
        category = request.form.get('category')
        price = request.form.get('price')
        stock = request.form.get('stock')

        result = add_product(title, description, category, price, stock)
        return result

# ROTA: CHANGE PRODUCT (ADMIN)
# CWE-284: Improper Access Control
# CWE-20:  Improper Input Validation
# CWE-79:  Improper Neutralization of Input During Web Page Generation
# CWE-319: Cleartext Transmission of Sensitive Information
# CWE-209  Information Exposure Through an Error Message
@app.route('/change_product', methods=['POST'])
def change_product_route():
    if request.method == 'POST':
        try:
            product_id = int(request.form.get('product_id'))
            new_title = request.form.get('new_title')
            new_description = request.form.get('new_description')
            new_category = request.form.get('new_category')
            new_price = float(request.form.get('new_price'))
            new_stock = int(request.form.get('new_stock'))

            result = change_product(product_id, new_title, new_description, new_category, new_price, new_stock)

            return jsonify({'message': result})
        except Exception as e:
            return jsonify({'error': f"Error: {str(e)}"})



# CWE-541: Inclusion of Sensitive Information in an Include File
# Deixar comentários sobre vulnerabilidades no código é em sí uma vulnerabilidade.
