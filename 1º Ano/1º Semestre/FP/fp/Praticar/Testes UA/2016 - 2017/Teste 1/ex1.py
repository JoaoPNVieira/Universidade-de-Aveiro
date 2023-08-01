#a) validação do valor da mensalidade (leitura	 de	 um	 número	 real	positivo)
def mensalidade (operador):
    mensal = float(input("Mensalidade {}: ".format(operador)))
    while mensal < 0:
        print("Valor inválido!", end=" ")
        mensal = float(input("Mensalidade {}: ".format(operador)))
    return mensal


#b) função que lê do utilizador	a duração de um único contrato (tem de ser múltiplo de 6 meses)
def duracao():
    dur = int(input("Duração do contrato em meses: "))
    while dur % 6 != 0:
        print("Valor Inválido!", end=" ")
        dur = int(input("Duração do contrato em meses: "))
    return dur


#c) função que compara três valores e devolve o mais baixo
def menor(x, y, z):
    menor = x
    li = [x, y, z]
    for i in range(1, len(li)):
        if li[i] < menor:
            menor = li[i]
    return menor


#d)
def descontos (m):
    mesesOferecidos = mensalidade("Meses oferecidos")
    descontoTlmPortado = mensalidade("Desconto por tlm portado")
    if descontoTlmPortado != 0:
        tlmsPortados = mensalidade("Quantos tlms portados")
        descontoTotal = mesesOferecidos*m + descontoTlmPortado*tlmsPortados
    else:
        descontoTotal = mesesOferecidos*m
    return descontoTotal

def extras(op):
    total = 0
    while True:
        extra = mensalidade("Preço de UM extra (canal premium, Gb's extra) no(a) {}: ".format(op))
        total += extra
        if extra == 0.0:
            break
    return total

#g) função que compara três valores e devolve o mais baixo   (PERGUNTAr COMO FAZER ESTA ULTIMA PARTE E TAMBÉM A FORMATAÇÃO EM CONDIÇẼS!!!)
def melhor(x, y, z):
    menor = x
    li = [x, y, z]
    for i in range(1, len(li)):
        if li[i] < menor:
            menor = li[i]
    return menor



# main
    #MEO
mensalidadeBaseMEO = mensalidade("MEO")
durMEO = duracao()
descontoMEO = descontos(mensalidadeBaseMEO)
MEO = mensalidadeBaseMEO*durMEO - descontoMEO
print("Total MEO = {}".format(MEO))
    #NOS
mensalidadeBaseNOS = mensalidade("NOS")
durNOS = duracao()
descontoNOS = descontos(mensalidadeBaseNOS)
NOS = mensalidadeBaseNOS*durNOS - descontoNOS
print("Total NOS = {}".format(NOS))
    #Vodafone
mensalidadeBaseVodafone = mensalidade("Vodafone")
durVodafone = duracao()
descontoVodafone = descontos(mensalidadeBaseVodafone)
Vodafone = mensalidadeBaseVodafone*durVodafone - descontoVodafone
print("Total Vodafone = {}".format(Vodafone))
extrasMEO = extras("MEO")
extrasNOS = extras("NOS")
extrasVodafone = extras("Vodafone")

MEO += extrasMEO*durMEO
NOS += extrasNOS*durNOS
Vodafone += extrasVodafone*durVodafone
print("---------------------------------")
print("| {:>8s} | {:>8s} | {:>8s} |".format("Operador", "TCO", "TCO/mes"))
print("| {:>8s} | {:>7.2f}€ |   {:>5.2f}€ |".format("MEO", MEO, MEO/durMEO))
print("| {:>8s} | {:>7.2f}€ |   {:>5.2f}€ |".format("NOS", NOS, NOS/durNOS))
print("| {:>8s} | {:>7.2f}€ |   {:>5.2f}€ |".format("VODAFONE", Vodafone, Vodafone/durVodafone))
print("---------------------------------")

print("Melhor operador: {}".format(menor(MEO, NOS, Vodafone)))
