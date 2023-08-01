# Some examples of recursive functions.
# These are presented in the slides.
#
# JMR 2017

from traced import traced  # a package to show execution traces


# A function that returns the sum of squares of a list of numbers.
def sumsq(lst):
    s = 0
    for x in lst:
        s += x**2
    return s

# Exercise1: Can you fill the ... with a generator expression
# to make sumsqG equivalent to sumsq?
# Which version do you prefer?
def sumsqG(lst):
    return sum(...)

# Exercise2: Complete the lambda expression to make sumsqL
# equivalent to sumsq.
sumsqL = lambda lst: ...

# A weird and kind-of-stupid version.
def sumsq2(lst):
    s = 0
    if len(lst) > 0:
        sq0 = lst[0]**2
        s = sq0 + sumsq(lst[1:])
    return s


# A recursive implementation of sumsq
#@traced        # uncomment this to see function calls.
def sumsqR(lst):
    s = 0
    if len(lst) > 0:
        sq0 = lst[0]**2
        s = sq0 + sumsqR(lst[1:])
    return s

# Equivalent, but in a single line:
def sumsqR2(lst):
    return 0 if len(lst)==0 else lst[0]**2 + sumsqR2(lst[1:])


print( sumsqR([1, 2, 3]) )
# Run this again after uncommenting the @traced declaration.

