
cols = int( input('col: ') )
rows = int( input('row: ') )

i = 1
for r in range(1, rows + 1):
  for c in range(1, cols + 1):
    s = '{:>5d}({},{})'.format(i, r, c)
    print(s, end=' ')
    i = i + 1
  print()
