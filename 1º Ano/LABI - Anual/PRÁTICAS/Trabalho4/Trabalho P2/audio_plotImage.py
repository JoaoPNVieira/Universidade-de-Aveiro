from struct import pack
from math import sin, pi
import ast
import numpy as np
import wave
import sys
import matplotlib.pyplot as plt

if __name__ == '__main__':
	music = wave.open("empty.wav","r")
	m = music.readframes(-1) #-1 serve para declarar que queremos ler todos os frames
	music = np.frombuffer(m, np.int16)


	plt.title("Waveform")
	plt.plot(m, color="blue")
	plt.ylabel("Amplitude")
	plt.show()
	
	
	print(music_conversion)

