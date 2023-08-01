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

#main
def main():
    while True:
        print("\nINTERFACE:\n")
        jor = validarJornada("Jornada? ")
        if jor == "0":
            break
        jornadasFile = open("Jornadas.csv" , 'r')
        jornadaIWant = []
        betsDict = {}
        for entry in jornadasFile:
            entry = entry.rstrip().rsplit(",")
            if entry[0] == jor:
                jornadaIWant.append(tuple(entry))
        for i in range(0, len(jornadaIWant)):
            aposta = validarAposta("{} {} vs {}: ".format(i+1, jornadaIWant[i][1], jornadaIWant[i][2]))
            betsDict[i+1] = aposta
        jornadasFile.close()

        betFile = open("Jornada"+jor+".csv" , "w")
        for bet in betsDict:
            entrada = str(bet) + ", " + str(betsDict[bet] +"\n")
            betFile.write(entrada)
        betFile.close()

        jogos = open("Jogos.csv" , 'r')
        jornadaIWantChecked = {}
        for jogo in jogos:
            jogo = jogo.rstrip().rsplit(",")
            for jogo1 in range(0, len(jornadaIWant)):
                if jogo[1] == jornadaIWant[jogo1][1] and jogo[2] == jornadaIWant[jogo1][2]:
                    jornadaIWantChecked[jogo1+1] = tuple([jogo[3],jogo[4]])

        for i in range(0,10):
            if jornadaIWantChecked[i][0] > jornadaIWantChecked[i][1] and

main()
