# encoding=utf-8
import hashlib

h = hashlib.md5()										# Iniciar contexto
h.update("A long sentence ".encode('utf-8') )			# Adicionar dados
h.update("broken in two halves".encode('utf-8') )		# Adicionar mais dados
print(h.hexdigest())									# Calcular síntese
