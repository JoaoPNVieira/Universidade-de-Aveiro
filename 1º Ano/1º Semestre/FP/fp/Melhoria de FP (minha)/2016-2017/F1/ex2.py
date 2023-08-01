def bissexto(ano):
    control = False
    if ano % 400 == 0:
        control = True
    elif ano % 4 == 0 and ano % 100 != 0:
        control = True
    return control

# print(bissexto(1984))
# print(bissexto(1100))
# print(bissexto(2000))
