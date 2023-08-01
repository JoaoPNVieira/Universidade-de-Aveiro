def lerNumerosParaLista():
  l = []
  x = int(input('Introduza um úmero (introduza 0 para sair): '))
  while x != 0: #and len(l) < 5:
    l.append(x)
    if len(l) == 5:
      break
    x = int(input('Introduza um úmero (introduza 0 para sair): '))

  return l

l2 = lerNumerosParaLista()
print(l2)
