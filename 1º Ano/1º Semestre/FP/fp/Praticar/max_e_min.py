print("""Introduza números reais difrentes de zero.
Com estes valore será calculado:
- o valor máximo,
- o valor mínimo,
- a média,
- o número de elementos introduzidos.

Quando quiser parar o processo, introduza zero.""")

def tudo ():
    n = input("\nEscreva um número real (introduza zero para parar a introdução de números): ")
    if n.upper() != "END":
        contagem = 0
        soma = 0
        maximo = float(n)
        minimo = float(n)
        while n.upper() != "END":
            n = float(n)
            contagem += 1
            soma += n
            # <-- Máximo -->
            if n > maximo:
                maximo = n
            # <-- Mínimo -->
            if n < minimo:
                minimo = n
            n = input("Escreva um número real (introduza zero para parar a introdução de números): ")
        print("\nNúmero de elementos introduzidos: ", contagem,"\nMédia dos elementos introduzidos: ",soma/contagem,"\nValor máximo dos elementos introduzidos: ", maximo,"\nValor mínimo dos elementos introduzidos: ",minimo)

    else:
        print("\nNúmero de elementos introduzidos: None\nMédia dos elementos introduzidos: None\nValor máximo dos elementos introduzidos: None\nValor mínimo dos elementos introduzidos: none")
tudo()

print("\n\n         <-- OU!!!! -->")

print("\n\n     <-- Máximo -->")
def maximo ():
        n = float(input("\nEscreva um número inteiro (introduza zero para parar a introdução de números): "))
        maximo = n
        while n != 0:
            if n > maximo:
                maximo = n
            n = float(input("Escreva um número inteiro (introduza zero para parar a introdução de números): "))
        return maximo

print("\nO valor máximo que introduziu foi: ",maximo() )

print("\n\n     <-- Minimo -->")
def minimo ():
        n = float(input("\nEscreva um número inteiro (introduza zero para parar a introdução de números): "))
        minimo = n
        while n != 0:
            if n < minimo:
                minimo = n
            n = float(input("Escreva um número ineiro (introduza zero para parar a introdução de números): "))
        return minimo

print("\nO valor minimo que introduziu foi: ",minimo() )
