#encoding=utf-8
import hashlib
import sys

# FUNÇÃO DE SINTESE SHA-1:

h = hashlib.sha1()										# Iniciar contexto

h.update("A long sentence ".encode('utf-8') )			# Adicionar dados
h.update("broken in two halves".encode('utf-8') )		# Adicionar mais dados

sys.argv = h
print(h.hexdigest())									# Calcular síntese
print(str(sys.argv))

# RESULTADO: 	String de 40 algarismos. 40x4 = 160 bits.
# 	ATENÇÃO: 	Qualquer alteração (espaço, character etc...) no h.update 
# 				altera também o resultado.
