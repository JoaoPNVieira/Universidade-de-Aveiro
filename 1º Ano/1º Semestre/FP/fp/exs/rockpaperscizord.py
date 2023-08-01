import getpass
#
def ropasc(p1c, p2c):
	if p1c == "rock": 
		if p2c == "rock":
			print("Draw")
		elif p2c == "paper":
			print("Player 2 Wins!")
		else:
			print("Player 1 Wins!")
	if p1c == "paper": 
		if p2c == "paper":
			print("Draw")
		elif p2c == "scissor":
			print("Player 2 Wins!")
		else:
			print("Player 1 Wins!")			
	if p1c == "scizor": 
		if p2c == "scizor":
			print("Draw")
		elif p2c == "rock":
			print("Player 2 Wins!")
		else:
			print("Player 1 Wins!")
#		
def replayg():
	r = input("Wanna play again?")
	if r == "yes":
		n=0
	elif r == "no":
		print("Hope you had fun!")
		n=1
		return n 
	else: 
		print("Sorry I'm not very good with english, please answer with yes or no.") 
		replayg()
#	
def ini():
	i= input("Wanna play some rock papper scissor?")
	if i == "yes":
		print("Great let's start!")
		n=0
		while n == 0:
			while n==0: 
				password = getpass.getpass("Player1's choice?")
				password2 = getpass.getpass("Player2's choice?")
				if (password != "rock") and (password != "paper") and (password != "scissor"):
					if (password2 != "rock") and (password2 != "paper") and (password2 != "scissor"):
						print("Invalid answer by both players,", password, "and", password2, "are not valid answers, no winner this round.")
						break
					else:
						print("Invalid play by player 1,", password, "is not a valid answer, player 2 wins!")
						break
				elif (password2 != "rock") and (password2 != "paper") and (password2 != "scissor"):
					print("Invalid play by player 2,", password2,"is not a valid answer, player 1 wins!")
					break
				else:
					ropasc(password, password2)
					break
			if replayg()==1:
				n=1
	elif i == "no":
		print("Oh that's okay, see you another time.")
	else:
		print("Sorry I'm not very good with english, please answer with yes or no")
		ini()
#
ini()

		
