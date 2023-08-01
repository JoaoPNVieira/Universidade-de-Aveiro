from struct import pack
from math import sin, pi
import ast
import wave
import sys

if __name__ == '__main__':
	music = wave.open("piano.wav","r")
	music_conversion = music.readframes(-1) #-1 serve para declarar que queremos ler todos os frames
	print(music_conversion)
