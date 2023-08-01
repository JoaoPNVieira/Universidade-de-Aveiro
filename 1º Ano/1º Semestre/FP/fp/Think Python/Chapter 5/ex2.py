def check_fermat (a, b, c, n):
    expression = a**n + b**n
    if expression == c**n:
        print("Holy smokes, Fermat was wrong!")
    else:
        print("After all, Fermat was right...")

def values ():
    print ("""Fermat's last theorem says that there are no positive integers
a, b, c such that,
            a^n + b^n = c^,
for any values of n greater than 2.
Let's see if he was right!\n""")
    a = int(input("Write a positve integer a: "))
    b = int(input("Write a positve integer b: "))
    c = int(input("Write a positve integer n: "))
    n = int(input("Write a positve integer n greater than 2: "))
    while a < 0 or b < 0 or c < 0 or n < 2:
        print("""Oops... One of that values introduced by way wasn't valid.
Please try again.\n""")
        a = int(input("Write a positve integer a:"))
        b = int(input("Write a positve integer b: "))
        c = int(input("Write a positve integer n: "))
        n = int(input("Write a positve integer n greater than 2: "))
    check_fermat(a, b, c, n)

values()
