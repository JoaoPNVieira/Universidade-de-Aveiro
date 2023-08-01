s = 'ola aveiro'
print(s)
print(s[0])

for x in s:
  print(x, end=',')
print()

for i in range(len(s)):
  print(i, ' -> ', s[i])

s2 = s.replace('a', 'z')
print(s,  ' -> ', s2 ) # não é bem o que se quer...

s3 = ''
aindanaomudamos = True
for i in s:
  if i == 'a' and aindanaomudamos:
      s3 += 'z'
      aindanaomudamos = True
  else:
    s3 += i

print('s3 = ', s3) # MAS ISTO JÁ É QUE NÓS QUEREMOS!!
