#encode = 'utf-8'
import sys

def factorial (x):
	if x < 0: return "undefined"

	if x == 0: return 1

	res = 1
	while x > 0:
		res = res * x
		x = x - 1

	return res

def usage (progname):
	print ("Usage: python3 %s positive number" % (progname))

def main (argv):
	if (len(argv) != 2):
		usage (argv[0])
		sys.exit (1)

	if not argv[1].isdigit ():
		usage (argv[0])
		sys.exit (2)

	print (factorial (int (argv[1])))
	sys.exit (0)

if __name__ == "__main__":
	main (sys.argv)
