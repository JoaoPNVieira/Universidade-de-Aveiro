#encoding:utf8
from cartas import cartas
baralho = cartas()

# exemplo: baralhar todas as cartas e tirar 1 carta do baralho
# (sempre que uma carta sai, não volta a aparecer até o baralho voltar a ser baralhado)
baralho.baralhar()
retirar=baralho.nova()
def pontos(retirar):
	carta_retirada = retirar.split(" ")[0]
	if carta_retirada =="2":
		pontos =2
		return(pontos)
	if carta_retirada =="3":
		pontos =3
		return(pontos)
	if carta_retirada =="4":
		pontos =4
		return(pontos)
	if carta_retirada =="5":
		pontos =5
		return(pontos)
	if carta_retirada =="6":
		pontos =6
		return(pontos)
	if carta_retirada =="7":
		pontos =7
		return(pontos)
	if carta_retirada =="Dama":
		pontos =8
		return(pontos)
	if carta_retirada =="Valete":
		pontos =9
		return(pontos)
	if carta_retirada =="Rei":
		pontos =10
		return(pontos)
	if carta_retirada =="Ás":
		pontos =11
		return(pontos)

def dar_cartas_dealer():
	retirar=baralho.nova()
	print("Dealer: " + retirar)
	pontos_dealer = pontos(retirar)
	return pontos_dealer
	
def dar_cartas_player():
	retirar=baralho.nova()
	print(r"Player: " + retirar)
	pontos_player=pontos(retirar)
	return pontos_player
	
def vencedor(pontos_player, pontos_dealer):
	if pontos_dealer >21 and pontos_player < 21:
		print("O player é o vencedor")
		vencedor = "player"
		return vencedor
		
	elif pontos_dealer < 21 and pontos_player > 21:
		print("O dealer é o vencedor")
		vencedor = "dealer"
		return vencedor
	
	elif pontos_dealer < 21 and pontos_player > 21:
		print("O dealer é o vencedor")
		vencedor = "dealer"
		return vencedor
	elif pontos_dealer < 21 and pontos_player < 21:
		if pontos_dealer < pontos_player:
			print("O dealer é o vencedor")
			vencedor = "dealer"
			return vencedor
		
	elif pontos_dealer >= pontos_player:
		print("O dealer é o vencedor")
		vencedor = "dealer"
		return vencedor
		
def cartas_incial_dealer():
	retirar=baralho.nova()
	print("")
	print("Dealer - Jogada 1: " + retirar)
	pontos_dealer_1 = pontos(retirar)
	retirar=baralho.nova()
	print("Dealer - Jogada 2: " + retirar)
	print("")
	pontos_dealer_2 = pontos(retirar)
	pontos_dealer = int(pontos_dealer_1) + int(pontos_dealer_2)
	print ("Pontos do Dealer: "+ str(pontos_dealer))
	print("")
	return pontos_dealer

def cartas_incial_player():
	a=0
	retirar=baralho.nova()
	print("Player - Jogada 1: " + retirar)
	pontos_player_1 = pontos(retirar)
	retirar=baralho.nova()
	print("PLayer - Jogada 2:  " + retirar)
	pontos_player_2 = pontos(retirar)
	pontos_player = int(pontos_player_1) + int(pontos_player_2)
	j=0
	while j < 5:
		j+=1
		resposta = int(input ("(1)Pedir carta ou (2)Ficar ? " ))
		a=2
		if resposta == 1:
			a+=1
			pontos_player = pontos_player
			retirar=baralho.nova()
			print("Player - Jogada " +str(a)+ " : "  + retirar)
			print("")
			pontos_novos = pontos(retirar)
			pontos_player= pontos_player + pontos_novos
		elif resposta == 2:
			print("")
			print ("Pontos do Player: "+ str(pontos_player))
			print("")
			return pontos_player
			break	

def jogo():	
	pontos_player = cartas_incial_player()
	pontos_dealer = cartas_incial_dealer()
	vencedor(pontos_player, pontos_dealer)
	

pontos_player = cartas_incial_player()
pontos_dealer = cartas_incial_dealer()
	
def repetir_jogo():
	win = vencedor(pontos_player, pontos_dealer)
	repetir=0
	if win == "dealer":
		d=1
		p=0
	if win == "player":
		p=1
		d=0
	while repetir != "abd":
		repetir= str(input("(1)Repetir Jogo   ou   (2)Parar? "))
		print("")
		if repetir == "1":
			win=jogo()
			vencedor(pontos_player, pontos_dealer)
			if win == "dealer":
				d+=1
			if win == "player":
				p+=1
		elif repetir == "2":
			print("Resultado Final ==>   Dealer({}) - Player ({})".format(d,p))
			return d, p
			break
	
repetir_jogo()



