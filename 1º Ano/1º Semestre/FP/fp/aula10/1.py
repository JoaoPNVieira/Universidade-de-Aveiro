lstx = [1, 3, 5, 7, 9]
print([10+x for x in lstx])
lsty = [2, 4, 6]
print([x+y for x in lstx for y in lsty])
print({x+y for x in lstx for y in lsty})
print([(x,y) for x in lstx for y in lsty])
print([(x,y) for y in lsty for x in lstx])
print([x*c for c in "abc" for x in lstx])
print([x%3==0 for x in lstx])
print([(x, x//3) for x in lstx if x%3==0])
print({x:x//3 for x in lstx if x%3==0})
print([(x,y) for x in lstx
 for y in lsty if x<y])
print({ x:[y for y in lsty if x<y]
 for x in lstx })
print(any(x%2==0 for x in lstx))
