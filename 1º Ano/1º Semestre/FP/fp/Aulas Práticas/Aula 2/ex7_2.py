grauscel = input('Qual a temperatura ambiente do local onde se encontra em ºC? ')
grauscel = int(grauscel)

grausfar = 1.8*grauscel +32

message = "{} ºC = {} ºF"

print(message.format(grauscel, grausfar))
