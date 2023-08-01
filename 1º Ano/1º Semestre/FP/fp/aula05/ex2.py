# Complete the code to make the HiLo game...

import random
conta = 0
# Pick a random number between 1 and 100, inclusive
secret = random.randrange(1, 101);
print("Can you guess my secret?")
# put your code here
n = int(input("guess?"))
while not n==secret:
	conta=conta+1
	if n > secret: 
		print("High.")
	else:
		print("Low.")
	n = int(input("guess?"))
if n == secret:
	print("Congrats, you've won on the", conta+1, "try!")
