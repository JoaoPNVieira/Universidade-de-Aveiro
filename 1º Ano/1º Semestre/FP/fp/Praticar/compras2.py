#Let's ask to the user the value of and order and from where is this order being made
totalOrder = float(input("Write the value of your order: "))
country = input("Which country are you from? ")

if country.upper() == "CANADA":
    province = input("Which province of Canada are you from: ")
    if province.upper() == "ALBERTA":
        tax = (0.05)*totalOrder

    elif province.upper() == "ONTARIO" or province.upper() == "NEW BRUNSWICK" or province.upper() == "NOVA SCOTIA":
        tax = (0.13)*totalOrder

    else:
        tax = (0.11)*totalOrder

else:
    tax = 0

finalOrder = totalOrder + tax
print ("The value you have to pay for your order is: $%.2f" % finalOrder)
