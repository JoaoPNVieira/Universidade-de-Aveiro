# Solving the Hanoi Towers problem.
#

# In this program, we use global variables A, B, C to represent the 3 towers.
# Using globals makes the program slightly simpler.

def showTowers():
    """Prints the contents of the 3 towers."""
    print(A, B, C, "---------", sep='\n')

def moveDisk(n, src, dst):
    dst.append(src.pop())
    showTowers()
    
# Hanoi tower of n disks from src to dst, using aux:
def moveTower(n, src, aux, dst):
    if n > 0:
        moveTower(n-1, src, dst, aux)   # move n-1 disks to aux
        moveDisk(n, src, dst)           # move disk n to dst
        moveTower(n-1, aux, src, dst)   # move n-1 disks to dst

A = [3, 2, 1]
B = []
C = []
showTowers()
moveTower(len(A), A, B, C)

