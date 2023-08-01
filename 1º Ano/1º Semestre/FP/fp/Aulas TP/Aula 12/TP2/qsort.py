# A kind of quick sort (but not in-place)

def qsorted(lst):
    """Return a sorted version of lst."""
    if len(lst)<=1:     # no need to sort
        return lst[:]   # just return a copy
    T = lst[0]
    # Using a for instruction here might be more efficient!
    L1 = [x for x in lst[1:] if x<T]
    L2 = [x for x in lst[1:] if x>=T]
    return qsorted(L1) + [T] + qsorted(L2)

print( qsorted([7,4,5,9,1,3,8,2,6]) )

# Make a generic version with a key= keyword argument.


