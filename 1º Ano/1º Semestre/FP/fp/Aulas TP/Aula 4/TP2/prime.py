# Exemplo 2 na turma TP2
# Verifica se n é primo.
# JMR 2017

n = int(input("n? "))
d = 2           # primeiro divisor a testar
while d<n and n%d!=0:   # Enquanto d não chega a n e se n não é divisível por d
    d = d+1             # incrementa d  (e repete)

if d<n:
    r = "nao"
else:
    r = "sim"

print(r)

