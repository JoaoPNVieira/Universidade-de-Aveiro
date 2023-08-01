import random
import time
import re


def loadList():
    # f = open('shakespeare.txt', 'r', encoding='utf8')
    f = open('shakespeare.txt', 'r', errors='ignore')
    lines = f.readlines()
    words = []
    for l in lines:
        w = re.split('[.,; \n]+', l)
        words += w
    f.close()
    return words


def sequentialSort(l):
    for i in range(len(l) - 1):
        for j in range(i + 1, len(l)):
            if l[i] > l[j]:
                tmp = l[i]
                l[i] = l[j]
                l[j] = tmp


li = loadList()
print('number of words:', len(li))

# print(li)
tic = time.perf_counter()
liSorted = sorted(li)
toc = time.perf_counter()
print('sorted: ', toc - tic)
# print(liSorted)

li2 = list(li)
tic = time.perf_counter()
sequentialSort(li2)
toc = time.perf_counter()
print('sequential sort: ', toc - tic)
# print(li2)

tic = time.perf_counter()
li.sort()
toc = time.perf_counter()
print('sort: ', toc - tic)

# print(li)

f = open('output.txt', 'w')
for w in li:
    f.write(w + '\n')
f.close()