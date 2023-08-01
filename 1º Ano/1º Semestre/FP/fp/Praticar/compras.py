orderTotal = float(input("What was the total for your order? " ))
shippingCost = 0
finalAmount = 0

if orderTotal >= 50:
    shippingCost = 0

else:
    shippingCost = 10

finalAmount = orderTotal + shippingCost


print("So, the final amount you have to pay, including shipping, is: $%.2f" % finalAmount)
