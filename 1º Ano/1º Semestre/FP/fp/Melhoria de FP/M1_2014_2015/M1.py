# -*- encoding: utf8 -*-
# NOME:
# NMEC:
# Use este ficheiro para o exercicio 1

from cartas import cartas
baralho = cartas()

# exemplo: baralhar todas as cartas e tirar 1 carta do baralho
# (sempre que uma carta sai, não volta a aparecer até o baralho voltar a ser baralhado)
baralho.baralhar()

def valor(carta):
    if "Dama" in carta[:7]:
        return 8
    elif "Valete" in carta[:7]:
        return 9
    elif "Rei" in carta[:7]:
        return 10
    elif "Ás" in carta[:7]:
        return 11
    else:
        return int(carta[0])

def vencedor(pontos_jogador, pontos_dealer):
    if pontos_jogador == 21:
        return 1
    elif pontos_dealer == 21:
        return 0
    elif pontos_jogador > 21:
        return 0
    elif pontos_dealer > 21:
        return 1
    elif pontos_jogador > pontos_dealer:
        return 1
    elif pontos_jogador == pontos_dealer:
        return 2 #empate
    else:
        return 0


def jogo():
    carta1 = baralho.nova()
    carta2 = baralho.nova()
    p_jogador = valor(carta1) + valor(carta2)
    print carta1
    print carta2
    print "Pontos jogador: ", p_jogador
    p_dealer = valor(baralho.nova()) + valor(baralho.nova())

    while p_jogador < 21:
        s = raw_input("Nova carta? (s/n)")
        if s != "s":
            break
        carta = baralho.nova()
        print carta
        p_jogador += valor(carta)
        print "Pontos jogador: ", p_jogador

    print "Pontos dealer: ", p_dealer
    if vencedor(p_jogador, p_dealer) == 1:
        print "Jogador GANHA"
        return 1
    elif vencedor(p_jogador, p_dealer) == 2:
        print "EMPATE"
        return 2
    else:
        print "Jogador PERDE"
        return 0

def campeonato():
    g_jogador = 0
    g_dealer = 0
    while True:
        baralho.baralhar()
        j = jogo()

        if j == 1:
            g_jogador+=1
        elif j == 0:
            g_dealer+=1

        s = raw_input("Novo Jogo? (s/n)")
        if s != "s":
            break

    print "Vitórias Jogador: ", g_jogador
    print "Vitórias Dealer: ", g_dealer

campeonato()
