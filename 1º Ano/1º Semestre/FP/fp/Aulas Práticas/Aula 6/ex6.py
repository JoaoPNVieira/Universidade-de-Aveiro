n = input("Escreva uma frase: ")

# def SplitStringInWords (n):
#     listOfWords = []
#     palavra = ""
#     for char in n:
#         if char != " ":
#             palavra += char
#         else:
#             if len(palavra) > 0:
#                 listOfWords.append(palavra)
#                 palavra = ""
#     if len(palavra) > 0:
#         listOfWords.append(palavra)
#
#     return listOfWords
#
# y = SplitStringInWords(n)
#
#
# def capitalizeFirstLetter (y):
#     for i in y:




def capitalizeFirstLetter (n):
    n2 = ''
    if n != '':
        n2 += n[0].upper()
    for i in range(1, len(n)):
        if n[i-1] == ' ':
            n2 += n[i].upper()
        else:
            n2 += n[i]
    return n2

print(capitalizeFirstLetter(n))
