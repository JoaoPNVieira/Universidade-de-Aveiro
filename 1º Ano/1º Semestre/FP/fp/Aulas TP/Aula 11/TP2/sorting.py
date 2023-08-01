# -*- coding: utf-8 -*-
#
#  sorting.py
#  
#  2017 <jmr@ua.pt>

import random

## Generate a list of n random integers
def randList(n, stop=0):
    rl = []
    if stop <= 0:
        stop = 2*n
    while n>0:
        rl.append(random.randrange(0,stop))
        n -= 1
    return rl

# Insert value x into sorted list l[bos:eos],
# moving elements forward to make space.
# Note that l[eos] must exist and will be overwritten!
def insertInto(x, l, bos, eos):
    assert 0<=bos<=eos<len(l)
    #print("Insert {} into {} -> ".format(x, l[bos:eos]),
    k = eos-1
    while k >= bos and l[k] > x:
        l[k+1] = l[k]
        k -= 1
    l[k+1] = x
    #print(l[bos:eos+1]
        
def insertionSort(l, start, stop):
    assert 0<=start<=stop<=len(l)
    eos = start+1    # end of sorted part
    while eos < stop:
        x = l[eos]    # x is the element to insert
        insertInto(x, l, start, eos)
        eos += 1

def insertionSortR(l, start, stop):
    assert 0<=start<=stop<=len(l)
    if start+1 < stop:
        insertionSortR(l, start, stop-1)    # sort all but last element
        x = l[stop-1]        # x is the last element
        insertInto(x, l, start, stop-1)        # insert last into sorted part

def main():
    l0 = randList(20)
    print(l0)
    l = l0[:]
    insertionSort(l,0,len(l))
    print(l)
    l = l0[:]
    insertionSortR(l,0,len(l))
    print(l)
    return 0

if __name__ == '__main__':
    main()

