from PIL import Image
from PIL import ExifTags
import sys

def main(frame):
	im = Image.open("flor.jpg")
	
	width, height = im.size
	
	print("Largura: %dpx" % width)
	print("Altura %dpx" % height)
	print("Formato %spx" % im.format)
	
	tags = im._getexif()
	
	for k, v in tags.items():
		print(str(ExifTags.TAGS[k])+" : "+str(v))

	for s in [0.2, 8]:
		dimension = (int(width*s), int(height*s))
		new_im = im.resize( dimension, Image.ANTIALIAS)
		new_im.save("flor.jpg"+"ANTIALIAS-%.2f.jpg" % s) # guardar imagem c/nome diferente

main(sys.argv[0])
