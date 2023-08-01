def countOccurrencies(l, x):
    count = 0
    for i in l:
        if i == x:
            count += 1
        
    return count

def positionsOfOccurrencies(l, x):
    lout = []
    for i in range(len(l)):
        if x == l[i]:
            lout.append(i)
            
    return lout

l = [1, 2, 1, 3, 4, 1]
print(countOccurrencies(l, 1))
print(positionsOfOccurrencies(l, 1))
print(l.index(1))
print(l.index(1, 1))