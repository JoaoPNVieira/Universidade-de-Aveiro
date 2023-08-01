#encode = 'utf-8'
import pytest
import fibonnacci

from subprocess import Popen
from subprocess import PIPE


def teste1():
	if fibonacci(0) == [0] and fibonacci(-1) == []:
		print("Teste OK")
	else:
		print("Teste Falhou")

def test_inferior_1():
	print("Testa comportamento com n < 1")
	assert fibonacci(0) ==[0]
	assert fibonacci(-1) == []
	
def test_no_args ():
	proc = Popen ("python3 factorial.py", stdout=PIPE, shell=True)
	assert proc.wait() == 1 #Check Return Code
	assert proc.stdout.read ().decode ('utf-8') == "Usage: python3 factorial.py positive number\n"

def test_invalid_args ():
	proc = Popen ("python3 factorial.py n", stdout=PIPE, shell=True)
	assert proc.wait () == 2 #Check Return Code
	assert proc.stdout.read ().decode ('utf-8') == "Usage: python3 factorial.py positive number\n"

	proc = Popen ("python3 factorial.py -5", stdout=PIPE, shell=True)
	assert proc.wait () == 2 #Check Return Code
	assert proc.stdout.read ().decode ('utf-8') == "Usage: python3 factorial.py positive number\n"

def test_valid_args ():
	proc = Popen ("python3 factorial.py 10", stdout=PIPE, shell=True)
	assert proc.wait () == 0 #Check Return Code
	assert proc.stdout.read ().decode ('utf-8') == "3628800\n"
