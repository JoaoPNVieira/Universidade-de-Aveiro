import random
import time

def genList(n):
    l = []
    for i in range(n):
        l.append(random.randint(0, 1000))
    
    return l

def sequentialSort(l):
    for i in range(len(l) - 1):
        for j in range(i+1, len(l)):
            if l[i] > l[j]:
                tmp = l[i]
                l[i] = l[j]
                l[j] = tmp
            

dim = int(input('Dimensao?'))
li = genList(dim)

#print(li)
li2 = list(li)
tic = time.perf_counter()
sequentialSort(li2)
toc = time.perf_counter()
print('sequential sort: ', toc-tic)
#print(li2)


tic = time.perf_counter()
liSorted = sorted(li)
toc = time.perf_counter()
print('sorted: ', toc-tic)
#print(liSorted)


print('antes:', li)
tic = time.perf_counter()
li.sort()
toc = time.perf_counter()
print('sort: ', toc-tic)
print('li depois:', li)