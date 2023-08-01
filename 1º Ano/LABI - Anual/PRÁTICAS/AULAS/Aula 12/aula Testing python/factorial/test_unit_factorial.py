#encode = 'utf-8'
import pytest
from factorial import factorial

def test_negativos ():
	assert factorial (-1) == "undefined"

def test_zero ():
	assert factorial (0) == 1

def test_valor_pequeno ():
	assert factorial (5) == 120

def test_valor_grande ():
	assert factorial (10) == 3628800

