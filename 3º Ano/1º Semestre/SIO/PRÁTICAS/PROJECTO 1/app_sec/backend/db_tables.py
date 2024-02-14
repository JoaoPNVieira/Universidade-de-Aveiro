#########################################################################################
#########################################################################################
# ----------------- SECURE DATABASE - TABLE CREATION - SIO PROJECT Nº 1 --------------- #
#########################################################################################
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #
from sqlalchemy import DateTime
from sqlalchemy import BINARY, DECIMAL, TIMESTAMP, Date, Float, ForeignKey, ForeignKeyConstraint, Column, Integer, String, Text, UniqueConstraint
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
#########################################################################################
# ----------------- TABLE CREATION MODULE --------------------------------------------- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CUSTOMERS -------------------------------------------------- #
# -----                                                                           ----- #

class User(Base):
	__tablename__ = "users"

	user_id = Column(Integer, primary_key=True)
	fname   = Column(String(32), nullable=False)
	lname   = Column(String(32), nullable=False)
	email   = Column(String(64), nullable=False, unique=True)
	nick    = Column(String(32), nullable=False, unique=True)
	passwd  = Column(String(64), nullable=False)
	nib     = Column(DECIMAL)
	role    = Column(String(16), nullable=False)
	failed_login_attempts = Column(Integer, default=0)

	# User Constructor:
	def __init__(self, fname, lname, email, nick, passwd, nib, role):
		self.fname  = fname
		self.lname  = lname
		self.email  = email
		self.nick   = nick
		self.passwd = passwd
		self.nib    = nib
		self.role   = role
		self.failed_login_attempts = 0

	# Constraints:
	__table_args__ = (
		UniqueConstraint("email", "nick", name="uq_email_nick"),
	)

	# Print function:
	def __repr__(self):
		return f"({self.user_id} {self.nick} {self.email} {self.fname} {self.lname} {self.nib} {self.role})"

# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: ADDRESSES -------------------------------------------------- #
# -----                                                                           ----- #
class Address(Base):
	__tablename__ = "addresses"

	user_id  = Column(Integer, ForeignKey("customers.user_id"), primary_key=True)
	addr     = Column(String(128), nullable=False)
	door     = Column(String(8), nullable=False)
	floor    = Column(String(8))
	country  = Column(String(32), nullable=False)
	postal   = Column(String(16))

	# Address Constructor:
	def __init__(self, user_id, addr, door, floor, country, postal):
		self.user_id = user_id
		self.addr = addr
		self.door = door
		self.floor = floor
		self.country = country
		self.postal = postal

    # Constraints:
	__table_args__ = (
        ForeignKeyConstraint(["user_id"], ["customers.user_id"], name="fk_address_customer"),
    )

    # Print funct:
	def __repr__(self):
		return f"({self.user_id} {self.addr} {self.door} {self.floor} {self.country} {self.postal})"
	
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CUSTOMER ITEMS --------------------------------------------- #
# -----                                                                           ----- #
class CustomerItem(Base):
	__tablename__ = "customer_items"

	item_id     = Column(Integer, primary_key=True)
	user_id     = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	product_id  = Column(Integer, ForeignKey("products.id"), nullable=False)
	quantity    = Column(Integer, nullable=False)
	
	# Customer Items Constructor:
	def __init__(self, user_id, product_id, quantity):
			self.user_id = user_id
			self.product_id = product_id
			self.quantity = quantity

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_customer_item_customer",
		),
		ForeignKeyConstraint(
			["product_id"],
			["products.id"],
			name="fk_customer_item_product",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.item_id} {self.user_id} {self.product_id} {self.quantity})"
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CARTS ------------------------------------------------------ #
# -----  
class Cart(Base):
	__tablename__ = "carts"

	cart_id     = Column(Integer, primary_key=True)
	user_id     = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	total_cost  = Column(DECIMAL, nullable=False)
	in_cart     = Column(BINARY, nullable=False)

	# Carts Constructor:
	def __init__(self, user_id, total_cost, in_cart):
		self.user_id = user_id
		self.total_cost = total_cost
		self.in_cart = in_cart

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_customer_cart",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.cart_id} {self.user_id} {self.total_cost} {self.in_cart})"

# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: CART ITEMS ------------------------------------------------------ #
# -----  

class CartItems(Base):
    __tablename__ = "cart_items"

    cart_item_id = Column(Integer, primary_key=True)
    cart_id = Column(Integer, ForeignKey("carts.cart_id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)

    # Cart Items Constructor:
    def __init__(self, cart_id, product_id, quantity):
        self.cart_id = cart_id
        self.product_id = product_id
        self.quantity = quantity

    # Constraints:
    __table_args__ = (
        ForeignKeyConstraint(["cart_id"], ["carts.cart_id"], name="fk_cart_item_cart"),
        ForeignKeyConstraint(["product_id"], ["products.id"], name="fk_cart_item_product"),
    )

    # Print funct:
    def __repr__(self):
        return f"({self.cart_item_id} {self.cart_id} {self.product_id} {self.quantity})"
	
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: SAFECARTS -------------------------------------------------- #
# -----  
class SafeCart(Base):
	__tablename__ = "safecarts"

	safe_id = Column(Integer, primary_key=True)
	cart_id = Column(Integer, ForeignKey("carts.cart_id"), nullable=False)
	user_id = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	total_cost = Column(DECIMAL, nullable=False)
	in_safecart = Column(BINARY, nullable=False)

	# Safe Carts Constructor
	def __init__(self, cart_id, user_id, total_cost, in_safecart):
		self.cart_id = cart_id
		self.user_id = user_id
		self.total_cost = total_cost
		self.in_safecart = in_safecart

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["cart_id"],
			["carts.cart_id"],
			name="fk_safecart_cart",
		),
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_safecart_customer",
		),
	)
	
	# Print funct:
	def __repr__(self):
		return f"({self.safe_id} {self.cart_id} {self.user_id} {self.total_cost} {self.in_safecart})"
	
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: SAFECART ITEMS -------------------------------------------------- #
# -----  

class SafeCartItems(Base):
    __tablename__ = "safecart_items"

    safecart_items_id = Column(Integer, primary_key=True)
    safe_id = Column(Integer, ForeignKey("safecarts.safe_id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)

    # Safe Cart Items Constructor:
    def __init__(self, safe_id, product_id, quantity):
        self.safe_id = safe_id
        self.product_id = product_id
        self.quantity = quantity

    # Constraints:
    __table_args__ = (
        ForeignKeyConstraint(["safe_id"], ["safecarts.safe_id"], name="fk_safecart_item_safe"),
        ForeignKeyConstraint(["product_id"], ["products.id"], name="fk_safecart_item_product"),
    )

    # Print funct:
    def __repr__(self):
        return f"({self.safecart_items_id} {self.safe_id} {self.product_id} {self.quantity})"
	
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PURCHASES -------------------------------------------------- #
# -----                                                                           ----- #
class Purchase(Base):
	__tablename__ = "purchases"

	purch_id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	purch_date = Column(Date, nullable=False)

	# Purchases Constructor:
	def __init__(self, user_id, purch_date):
		self.user_id = user_id
		self.purch_date = purch_date

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_purchase_customer",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.user_id} {self.purch_id} {self.purch_date})"
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PURCHASED ITEMS -------------------------------------------- #
# -----                                                                           ----- #
class PurchasedItem(Base):
    __tablename__ = "purchased_items"

    item_id = Column(Integer, primary_key=True)
    purch_id = Column(Integer, ForeignKey("purchases.purch_id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)
    order_date = Column(DateTime)
    order_status = Column(String)
    user_id = Column(Integer)
    items = Column(String)  
    total_cost = Column(Float)

    def __init__(self, purch_id, product_id, quantity, items, total_cost):
        self.purch_id = purch_id
        self.product_id = product_id
        self.quantity = quantity
        self.items = items
        self.total_cost = total_cost

    __table_args__ = (
        ForeignKeyConstraint(
            ["purch_id"],
            ["purchases.purch_id"],
            name="fk_purchased_item_purchase",
        ),
        ForeignKeyConstraint(
            ["product_id"],
            ["products.id"],
            name="fk_purchased_item_product",
        ),
    )

    def __repr__(self):
        return f"({self.item_id} {self.purch_id} {self.product_id} {self.quantity})"
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: WISHLIST --------------------------------------------------- #
# -----                                                                           ----- #
class Wishlist(Base):
	__tablename__ = "wishlists"

	wish_id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	total_cost = Column(DECIMAL, nullable=False)
	in_wishlist = Column(BINARY, nullable=False)

	# Wishlist Constructor:
	def __init__(self, user_id, total_cost, in_wishlist):
		self.user_id = user_id
		self.total_cost = total_cost
		self.in_wishlist = in_wishlist

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_wishlist_customer",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.wish_id} {self.user_id} {self.total_cost} {self.in_wishlist})"
	
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: WISHLIST ITEMS --------------------------------------------------- #
# -----      

class WishlistItems(Base):
    __tablename__ = "wishlist_items"

    wishlist_items_id = Column(Integer, primary_key=True)
    wish_id = Column(Integer, ForeignKey("wishlists.wish_id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)

    # Wishlist Items Constructor:
    def __init__(self, wish_id, product_id, quantity):
        self.wish_id = wish_id
        self.product_id = product_id
        self.quantity = quantity

    # Constraints:
    __table_args__ = (
        ForeignKeyConstraint(["wish_id"], ["wishlists.wish_id"], name="fk_wishlist_item_wishlist"),
        ForeignKeyConstraint(["product_id"], ["products.id"], name="fk_wishlist_item_product"),
    )

    # Print funct:
    def __repr__(self):
        return f"({self.wishlist_items_id} {self.wish_id} {self.product_id} {self.quantity})"

# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PRODUCTS --------------------------------------------------- #
# -----                                                                           ----- #
class Product(Base):
	__tablename__ = "products"

	id = Column(Integer, primary_key=True)
	title = Column(String(32), nullable=False)
	descrip = Column(String(128))
	category = Column(String(16), nullable=False)
	price = Column(Integer, nullable=False)
	stock = Column(Integer, nullable=False)
	meadrating = Column(DECIMAL)
	
	# Product Constructor:
	def __init__(self, title, descrip, category, price, stock, meadrating):
		self.title = title
		self.descrip = descrip
		self.category = category
		self.price = price
		self.stock = stock
		self.meadrating = meadrating

	# Print funct:
	def __repr__ (self):
		return f"({self.id} {self.title} {self.category} {self.price} {self.stock} {self.meadrating}: {self.descrip})"

# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PRODUCT RATINGS -------------------------------------------- #
# -----                                                                           ----- #
class ProductRatings(Base):
	__tablename__ = "product_ratings"

	rating_id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
	user_id = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	rating = Column(Integer)
	comment = Column(Text)
	timestamp = Column(TIMESTAMP)

	# Product Ratings Constructor:
	def __init__(self, product_id, user_id, rating, comment, timestamp):
		self.product_id = product_id
		self.user_id = user_id
		self.rating = rating
		self.comment = comment
		self.timestamp = timestamp

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["product_id"],
			["products.id"],
			name="fk_product_rating_product",
		),
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_product_rating_customer",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.user_id}{self.product_id}{self.rating_id} {self.rating} : {self.comment} {self.timestamp})"


# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PRODUCT COMMENTS ------------------------------------------- #
# -----                                                                           ----- #
class ProductComment(Base):
	__tablename__ = "product_comments"

	comment_id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
	user_id = Column(Integer, ForeignKey("customers.user_id"), nullable=False)
	comment = Column(Text)
	timestamp = Column(TIMESTAMP)

	# Product Comments Constructor:
	def __init__(self, product_id, user_id, comment, timestamp):
		self.product_id = product_id
		self.user_id = user_id
		self.comment = comment
		self.timestamp = timestamp

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["product_id"],
			["products.id"],
			name="fk_product_comment_product",
		),
		ForeignKeyConstraint(
			["user_id"],
			["customers.user_id"],
			name="fk_product_comment_customer",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.comment_id} {self.product_id} {self.user_id} {self.comment} {self.timestamp})"
# -----                                                                           ----- #
# ------------------------------------------------------------------------------------- #
# ----------------- TABLE: PAYMENTS --------------------------------------------------- #
# -----                                                                           ----- #
class Payment(Base):
	__tablename__ = "payments"

	cart_id = Column(Integer, ForeignKey("carts.cart_id"), primary_key=True, nullable=False)
	mbway = Column(String(256), nullable=False)
	ref_mb = Column(String(256), nullable=False)
	paypal = Column(String(256), nullable=False)

	# Payment Constructor:
	def __init__(self, cart_id, mbway, ref_mb, paypal):
		self.cart_id = cart_id
		self.mbway = mbway
		self.ref_mb = ref_mb
		self.paypal = paypal

	# Constraints:
	__table_args__ = (
		ForeignKeyConstraint(
			["cart_id"],
			["carts.cart_id"],
			name="fk_payment_cart",
		),
	)

	# Print funct:
	def __repr__(self):
		return f"({self.cart_id} {self.mbway} {self.ref_mb} {self.paypal})"

# ------------------------------------------------------------------------------------- #
#########################################################################################
#########################################################################################