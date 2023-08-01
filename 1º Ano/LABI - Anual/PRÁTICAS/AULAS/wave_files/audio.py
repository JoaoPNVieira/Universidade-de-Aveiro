import pyaudio, wave, sys



def main(argv):
	wf = wave.open(piano, "rb")
	print(wf.getnchannels())
	
	wf.close()

main(sys.argv)
