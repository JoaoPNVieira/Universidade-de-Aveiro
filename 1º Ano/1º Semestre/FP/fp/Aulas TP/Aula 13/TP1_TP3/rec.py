def f(n):
    if n == 1:
        return 1
    
    else:
        return n * f(n-1)
    
def s(l):
    if len(l) == 1:
        return l[0]
    
    else:
        return l[0] + s(l[1:])
        
print(f(3))
li = [1, 2, 3, 4, 5]
print(s(li))