num = int(input("Escreva um número inteiro positivo: "))
prime = True
for numbers in range(2, num):
    if num % numbers == 0:
        prime = False

if prime:
    print("Congratulations!!", num, " is a prime number.")

else:
    print("O número não é primo.")
