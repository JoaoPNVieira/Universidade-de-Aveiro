# -*- encoding: utf8 -*-
import random

class cartas:
	import random
	def __init__(self):
		self.mesa = []
	
	# Prepara um novo baralho
	def baralhar(self):
		self.mesa = []

	# Tira uma carta do baralho
	def nova(self):
#        naipes = [u"\u2660", u"\u2663", u"\u2665", u"\u2666"]
		naipes = ["Espadas", "Copas", "Paus", "Ouros"]
		naipe = random.randint(0,3)
		caras = ["Dama", "Valete", "Rei", "Ás"]
		cara = random.randint(2,11)
		carta =  "{:<7d}".format(cara) if cara < 8 else "{:<7s}".format(caras[cara-8])
		carta += " " + naipes[naipe]

		if carta in self.mesa:
			return self.nova()

		self.mesa.append(carta)
		return carta


