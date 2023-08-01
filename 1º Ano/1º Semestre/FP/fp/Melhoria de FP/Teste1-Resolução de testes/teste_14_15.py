
# -*- encoding: utf8 -*-
from cartas import cartas

def nome2pontos(nome):
	if '2' <= nome[0] <= '7':
		return int(nome[0])
	if nome[0] == 'D':
		return 8
	if nome[0] == 'V':
		return 9
	if nome[0] == 'R':
		return 10
	if nome[0] == 'A':
		return 11 
	print(nome)
def vencedor(p_dealer, p_jogador):
	if p_dealer >= p_jogador and p_dealer <= 21:
		return 0
	else:
		return 1

baralho = cartas()
pontos_dealer = 0
pontos_jogador = 0

while pontos_dealer <= 21 and pontos_jogador <=21:
	c_dealer = baralho.nova()
	c_jogador = baralho.nova()
	print("Dealer: {}".format(c_dealer))
	print("Jogador: {}".format(c_jogador))

	pontos_dealer+=nome2pontos(c_dealer)
	pontos_jogador+=nome2pontos(c_jogador)
