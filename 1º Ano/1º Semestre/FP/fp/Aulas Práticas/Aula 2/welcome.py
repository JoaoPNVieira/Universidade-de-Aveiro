# coding: utf-8

# Execute the program and see what happens.
# Then modify the program so that X is replaced by the grade input.
# Hint: see what we did with the name.

message = """
Caro/a {},

Bem-vindo/a à disciplina de Fundamentos de Programação.
Esperamos que aprendas muito e que te divirtas a fazê-lo.
Vamos torcer para que consigas X valores, ou mais!

Cumprimentos,

Os Profes de FP.
"""

name = input("Como te chamas? ")
grade = input("Que nota esperas conseguir em FP? ")

print(message.format(name))
