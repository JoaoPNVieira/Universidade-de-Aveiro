def mensalidade(msg):
    while True:
        mens = input("Mensalidade {}: ".format(msg))
        try:
            mens = float(mens)
        except:
            print("Valor inválido.", end=" ")
        else:
            if mens <= 0:
                print("Valor inválido.", end=" ")
            else:
                break
    return mens
# print(mensalidade("NOS"))

def duracao(msg):
    while True:
        dur = input("{}: ".format(msg))
        if dur.isdigit():
            dur = float(dur)
            if dur % 6 == 0:
                break
            else:
                print("Valor inválido.", end=" ")
        else:
            print("Valor inválido.", end=" ")
    return dur
# print(duracao("Duração do contrato em meses"))

def menor(val1, val2, val3):
    li = [val1, val2, val3]
    m = li[0]
    for i in li:
        if i < m:
            m = i
    return m
# print(menor(1000,2000.4,3))

def descontos(mens):
    while True:
        meses = input("Meses oferecidos? ")
        if meses.isdigit():
            meses = int(meses)
            break
        else:
            print("Valor inválido!", end=" ")
    while True:
        descTlm = input("Desconto por tlm portado? ")
        if descTlm.isdigit():
            descTlm = int(descTlm)
            break
        else:
            print("Valor inválido!", end=" ")
    if descTlm != 0:
        while True:
            numTel = input("Quantos por tlm portados? ")
            if numTel.isdigit():
                numTel = int(numTel)
                break
            else:
                print("Valr inválido!", end=" ")
        desconto = mens*meses + numTel*descTlm
    else:
        desconto = mens*meses
    return desconto

def extras(msg):
    extras = 0
    while True:
        n = input("Preço de UM extra (canal premium, Gb's extra) no(a) {}: ".format(msg))
        try:
            n = float(n)
        except:
            print("Valor inválido.", end=" ")
        else:
            if n < 0:
                print("Valor inválido.", end=" ")
            elif n == 0:
                break
            else:
                extras += n
    return extras

def melhor(MEO, NOS, VODAFONE):
    TCO = {MEO: "MEO", NOS: "NOS", VODAFONE: "VODAFONE"}
    TcoVAL = list(TCO.keys())
    valorMenor = menor(TcoVAL[0], TcoVAL[1], TcoVAL[2])
    melhorOp = TCO[valorMenor]
    return melhorOp



def main():
    menMEO = mensalidade("MEO")
    durMEO = duracao("Duração do contrato em meses")
    descontosMEO = descontos(menMEO)
    TcoMEO = menMEO*durMEO - descontosMEO
    print("Total MEO = {}".format(TcoMEO))
    menNOS = mensalidade("NOS")
    durNOS = duracao("Duração do contrato em meses")
    descontosNOS = descontos(menNOS)
    TcoNOS = menNOS*durNOS - descontosNOS
    print("Total NOS = {}".format(TcoNOS))
    menVodafone = mensalidade("Vodafone")
    durVodafone = duracao("Duração do contrato em meses")
    descontosVodafone = descontos(menVodafone)
    TcoVodafone = menVodafone*durVodafone - descontosVodafone
    print("Total Vodafone = {}".format(TcoVodafone))

    extrasMEO = extras("MEO")
    TcoMEO = menMEO*durMEO + durMEO*extrasMEO - descontosMEO
    extrasNOS = extras("NOS")
    TcoNOS = menNOS*durNOS + durNOS*extrasNOS - descontosNOS
    extrasVodafone = extras("Vodafone")
    TcoVodafone = menVodafone*durVodafone + durVodafone*extrasVodafone - descontosVodafone
    print("{:-<34}".format("-"))
    print("| {:>8s} | {:>8s} | {:>8s} |".format("Operador", "TCO", "TCO/mes"))
    print("| {:>8s} | {:>7.2f}€ | {:>7.2f}€ |".format("MEO", TcoMEO, TcoMEO/durMEO))
    print("| {:>8s} | {:>7.2f}€ | {:>7.2f}€ |".format("NOS", TcoNOS, TcoNOS/durNOS))
    print("| {:>8s} | {:>7.2f}€ | {:>7.2f}€ |".format("VODAFONE", TcoVodafone, TcoVodafone/durVodafone))
    print("{:-<34}".format("-"))
    opMelhor = melhor(TcoMEO, TcoNOS, TcoVodafone)
    print("Melhor operador: {}".format(opMelhor))

main()
