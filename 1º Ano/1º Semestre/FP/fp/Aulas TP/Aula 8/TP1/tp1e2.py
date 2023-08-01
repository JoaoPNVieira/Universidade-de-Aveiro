# count the number of each letter in text

s = input('text? ')
count = {} # empty dictionary

# for all caracteres in a lower case version of the text
for l in s.lower():
  # just letters
  if l >= 'a' and l <= 'z': # l in string.ascii_lowercase
    if l in count:
      count[l] += 1
    else:
      count[l] = 1
    
print(count)

