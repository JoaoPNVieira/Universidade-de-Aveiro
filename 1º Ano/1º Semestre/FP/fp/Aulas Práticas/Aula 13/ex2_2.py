def validarJornada(msg):
    while True:
        jor = input(msg)
        if jor.isdigit() and 0 <= int(jor) <= 13:
            return jor
            break
        else:
            print("Valor inválido!", end=" ")

def validarAposta(msg):
    while True:
        bet = input(msg)
        if bet.lower() == "x" or bet == "1" or bet == "2":
            return bet.upper()
            break
        else:
            print("Input inválido!", end=" ")


def main():
    print("\nInterface: ", end="\n\n")
    while True:
        jornada = validarJornada("Jornada? ")
        if jornada == "0":
            break

        jornadasFile = open("Jornadas.csv", "r")
        count = 1
        for entry in jornadasFile:
            entry = entry.rstrip().rsplit(",")
            if entry[0] == jornada:
                bet = validarAposta("{} {} vs {}: ".format(count, entry[1], entry[2]))
                count += 1


main()
