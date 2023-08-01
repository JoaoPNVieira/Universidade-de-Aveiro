#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  soundmaker.py
#  
#  Copyright 2021 labi <labi@labi-VirtualBox>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  



from struct import pack
from math import sin, pi
import wave
import sys

def main(argv):

	var = {"bpm":"100","chord1":1,"chord2":3,"chord3":2,"chord4":0,
"Cnote":[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"Dnote":[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0],
"Enote":[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0],"Fnote":[0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
"Gnote":[0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0],"Anote":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
"Bnote":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"Hihat":[1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0],
"Tom":[0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0],"Clap":[0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
"Kick":[1,0,0,1,1,0,0,0,1,0,0,1,1,0,0,0]}


	rate=44100
	wv = wave.open("empty.wav", "w")
	wv.setparams((1, 2, rate, 0, "NONE", "not compressed"))
	
	#Frequencias das notas
	Cfreq = 261.63
	Dfreq = 293.66
	Efreq = 329.63
	Ffreq = 349.23
	Gfreq = 382.00
	Afreq = 440.00
	Bfreq = 483.88
	
	#Definiçoes de audio
	amplitude = 10000
	data = []
	bpm = int(var["bpm"])
	duration = 60/bpm
	
	def freqfunction(j):

		freq = 0
		
		if(var["Cnote"][j])==1: freq = Cfreq
		if(var["Dnote"][j])==1: freq = Dfreq
		if(var["Enote"][j])==1: freq = Efreq
		if(var["Fnote"][j])==1: freq = Ffreq
		if(var["Gnote"][j])==1: freq = Gfreq
		if(var["Anote"][j])==1: freq = Afreq
		if(var["Bnote"][j])==1: freq = Bfreq
		
		return freq
	
	j=0
	while(j<16):
		
		freq=freqfunction(j)
		
		for i in range(0, int(rate * duration)):
			data.append(amplitude*sin(2*pi*freq*i/rate))
				
		j+=1
	
	# Gerar (pack) a informação no formato correto (16bits)
	wvData = []
	for v in data:
		wvData += pack("h", int(v))
	
	wv.writeframes(bytearray(wvData))
	wv.close()
	
main(sys.argv)
