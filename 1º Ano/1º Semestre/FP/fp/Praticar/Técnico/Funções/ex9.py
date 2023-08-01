r = int(input("Insira um número inteiro r: "))
n = int(input("Insira um número inteiro n não negativo: "))

def serie_geom(r, n):
    soma = 0
    for i in range (0, n+1):
        numero = r**i
        soma += numero
    return soma

print("O valor da soma dos primeiros n+1 termos da série geométrica é:",serie_geom(r, n))
