# Exemplo 4 na turma TP2
# Verifica se n é primo.
# Agora usando for com else.
# JMR 2017

n = int(input("n? "))

r = "nao"               # Este é o resultado que queremos se o ciclo terminar pelo break!
for d in range(2,n):
    if n%d == 0:        # Se achou divisor,
        break           #   interrompe ciclo (e não executa bloco do else!)
else:                   # Este else pertence à instrução for!
    r = "sim"

print(r)
#print(d)       # se quisermos ver o último divisor tentado

