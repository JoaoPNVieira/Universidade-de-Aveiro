API = float(input("Insira a sua nota de API: "))
ATP = float(input("Insiria a sua nota de ATP: "))
EP = float(input("Insira a sua nota de EP: "))

media = 0.3 * API + 0.3 * ATP + 0.4 * EP

if media >= 10:
    print("Tem ", media," valores. Parabéns foi aprovado.")

else:
    print("Não conseguiu atingir a nota mínima, logo, não foi aprovado.")
