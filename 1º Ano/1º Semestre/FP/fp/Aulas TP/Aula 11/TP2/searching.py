# encoding: utf8


def seqSearch(lst, x):
    """Return k such that x == lst[k]. (Or None if no such k.)"""
    for i in range(len(lst)):
        if x == lst[i]:
            return i
    return None

# This is a binary search with the same semantics as seqSearch.
# But we can make it faster. See below.
def binSearchExact(lst, x):
    """Find k such that x == lst[k]. (Or None if no such k.)"""
    first = 0	        # first index that could be solution
    last = len(lst)	    # first index that cannot be solution
    while first < last:
        mid = (first+last)//2
        if x < lst[mid]:
            last = mid
        elif x > lst[mid]:
            first = mid+1
        else:
            return mid
    return None

# A binary search with different semantics.
# This is equivalent to bisect.bisect_left.
def binSearch(lst, x):
    """Find k such that: lst[k-1] < x <= lst[k] (not quite!)."""
    first = 0	        # first index that can be result
    last = len(lst)	    # last index that can be result
    while first < last:
        mid = (first+last)//2
        if x <= lst[mid]:     # (just 1 comparison inside loop!)
            last = mid
        else:
            first = mid+1
    return first

# This has the same semantics as seqSearch and binSearchExact,
# but implemented with the faster binSearch.
def binSearchExact2(lst, x):
    """Find k such that x == lst[k]. (Or None if no such k.)"""
    k = binSearch(lst, x)
    if k == len(lst) or x != lst[k]:
        return None
    return k


def loadFile(fname):
    """Load a file containing words in proper lexicographic order."""
    words = []
    with open(fname) as f:   # this does f = open(fname); but also calls f.close() automatically
        for w in f:
            words.append(w.strip())
            # check that the file is sorted:
            assert len(words)<2 or words[-2] <= words[-1], "lines should be ordered"
    return words


import time

def main():
    words = loadFile("/usr/share/dict/words")
    
    print(words[10000:10005])  # just checking a few words

    x = input("word to search? ")

    t = time.perf_counter()
    k = words.index(x)        # ValueError if x not in words!
    t = time.perf_counter() - t
    found = words[k]
    print("list.index(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))

    t = time.perf_counter()
    k = seqSearch(words, x)
    t = time.perf_counter() - t
    if k==None:
        found = "----"
    else:
        found = words[k]
    print("seqSearch(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))

    t = time.perf_counter()
    k = binSearchExact(words, x)
    t = time.perf_counter() - t
    if k==None:
        found = "----"
    else:
        found = words[k]
    print("binSearchExact(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))

    t = time.perf_counter()
    k = binSearchExact2(words, x)
    t = time.perf_counter() - t
    if k==None:
        found = "----"
    else:
        found = words[k]
    print("binSearchExact2(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))

    t = time.perf_counter()
    k = binSearch(words, x)
    t = time.perf_counter() - t
    if k==len(words):
        found = "--FIM--"
    else:
        found = words[k]
    print("binSearch(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))

    import bisect
    t = time.perf_counter()
    k = bisect.bisect_left(words, x)
    t = time.perf_counter() - t
    if k==len(words):
        found = "--FIM--"
    else:
        found = words[k]
    print("bisect.bisect_left(words, {!r}) == {} -> {}  in {} ms".format(x, k, found, t*1000))


if __name__ == '__main__':      # If called as a script, run main()
    main()

