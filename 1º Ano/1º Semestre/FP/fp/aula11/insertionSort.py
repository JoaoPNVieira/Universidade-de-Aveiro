
# This function sorts a list (like list.sort)
# using the insertion sort algorithm.

def insertionSort(lst, key=(lambda x:x), reverse=False):
    i = 1   # i = index of element to insert next = end of sorted part
    while i < len(lst):
        x = lst[i]    # x is the element to insert
        # insert x into lst[:i]
        k = i-1
        while k >= 0 and lst[k] > x:
            lst[k+1] = lst[k]
            k -= 1
        lst[k+1] = x
        i += 1


# Original list
lst0 = ["paulo", "augusto", "maria", "paula", "bernardo", "tito"]
print("lst0", lst0)

# sort in lexicographic order:
lst = lst0.copy()
insertionSort(lst)
print("lst1", lst)
assert lst == sorted(lst0)

# sort by length (requires key= argument):
ll = [0, 1, 2, 3, 4, 5 ]
for i in ll:
	x = lst[i]
lst = lst0.copy()
insertionSort(lst, key=len)
print("lst2", lst)
assert lst == sorted(lst0, key=len)

# sort by length, than lexicographic order:
myorder = lambda s:(len(s), s)
lst = lst0.copy()
insertionSort(lst, key=myorder)
print("lst3", lst)
assert lst == sorted(lst0, key=myorder)

print("All tests OK!")

