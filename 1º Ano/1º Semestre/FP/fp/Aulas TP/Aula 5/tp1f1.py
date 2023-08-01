def printFiveTimes(msg):
  for i in range(5):
    print(msg)

def printNTimes(msg, n):
  for i in range(n):
    print(msg)
    
def printNTimesByDefaultFive(msg, n = 5):
  for i in range(n):
    print(msg)
    
# understand arguments
printFiveTimes('Hello')
printNTimes('text', 3)

# default values for parameters
printNTimesByDefaultFive('More text')

# passing arguments by keyword
printNTimesByDefaultFive(n = 2, msg = 'ola')

