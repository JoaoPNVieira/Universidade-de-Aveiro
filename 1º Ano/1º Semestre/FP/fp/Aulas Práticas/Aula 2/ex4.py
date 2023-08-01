media10 = float(input("Insira a sua nota final de 10º ano: "))
media11 = float(input("Insira a sua nota final de 11º ano: "))
media12 = float(input("Insira a sua nota final de 12º ano: "))
notaEM = float(input("Insira a nota que obteve no Exame Nacional de Matemática: "))

mediaINTERNA = (media10 + media11 + media12)/3

mediaFinal = (mediaINTERNA + notaEM)/2

print(mediaFinal)