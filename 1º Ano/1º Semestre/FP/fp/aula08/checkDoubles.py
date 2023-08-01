def containsDoubles(test):
	charN = len(test)
	con = 1 
	lcon = con - 1
	while ((con >= 1) and (con < charN)):
		if test[con] == test[lcon]:
			break
		else: 
			con += 1
			lcon += 1 
	if con == charN:
		return False
	else: 
		return True
# Test function
assert containsDoubles("pool") == True
assert containsDoubles("polo") == False
assert containsDoubles("erro") == True
assert containsDoubles("connosco") == True
assert containsDoubles("banana") == False
# Add a few more tests below
...

# If the program reaches this point...
print("All tests passed!")


# This function should read lines from the given file
# and return a list of lines that contain doubles (consecutive repeated chars).
def findLinesWithDoubles(fname):
	f = open(fname, 'r')
	lst = []
	for line in f:
		nlin = len(line)
		con = 1
		lcon = 0
		while ((con >= 1) and (con < nlin)):
			if line[con] == line[lcon]:
				break
			else: 
				con += 1
				lcon += 1 
		if con != nlin:
			lst.append(line)
	return lst
	
# Same thing for Portuguese words (if file available)
lst = findLinesWithDoubles('123.txt')
print(lst)

