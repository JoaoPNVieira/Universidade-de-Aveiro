import cherrypy, os, os.path, sys
import sqlite3 as sql
from datetime import date


#Variàvel global de apresentação:
welcome= ("\n \n \n"
		"                          ██▄                           \n"
		"                  ██       ██       ██                  \n"
		"                 ████      ██      ████                 \n"
		"                 █████     ██     █████                 \n"
		"                 ██████████████████████                 \n"
		"                 ██████████████████████                 \n"
		"                 ███▒▒▒▒▒▒████▒▒▒▒▒▒███                 \n"
		"                 ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███                 \n"
		"                 ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███                 \n"
		"                 █████████▒▒▒▒█████████                 \n"
		"                  ████████████████████                  \n" 
		"                 UNIVERSIDADE DE AVEIRO:                \n"
		"Departamento de Eletrónica, Telecomunicações e Informática"
		"\n         Laboratórios de Informática - 2020/2021        "
		"\n \n AUTORES :"
		"\n Pedro Cruzeiro -----------------------> NºMec.: 103173"
		"\n Inês Moreira -------------------------> NºMec.: 100084"
		"\n Rui Machado --------------------------> NºMec.: 65081"
		"\n João Vieira --------------------------> NºMec.: 50458"
		"\n \n \n"
		"	╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╭━━━╮╱╱╱╱╱╱╭╮╱╭━━━╮				\n"
		"	┃╭━╮┃╱╱╱╱╭╮╱╱╱╱╭╯╰╮╱╱╱┃╭━━╯╱╱╱╱╱╱┃┃╱┃╭━╮┃				\n"
		"	┃╰━╯┣━┳━━╋╋━━┳━┻╮╭╋━━╮┃╰━━┳┳━╮╭━━┫┃╱╰╯╭╯┃				\n"
		"	┃╭━━┫╭┫╭╮┣┫┃━┫╭━┫┃┃╭╮┃┃╭━━╋┫╭╮┫╭╮┃┃╱╭━╯╭╯				\n"
		" 	┃┃╱╱┃┃┃╰╯┃┃┃━┫╰━┫╰┫╰╯┃┃┃╱╱┃┃┃┃┃╭╮┃╰╮┃┃╰━╮				\n"
		"	╰╯╱╱╰╯╰━━┫┣━━┻━━┻━┻━━╯╰╯╱╱╰┻╯╰┻╯╰┻━╯╰━━━╯				\n"
		"	╱╱╱╱╱╱╱╱╭╯┃												\n"
		"	╱╱╱╱╱╱╱╱╰━╯												\n"
		" ╭━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╱╱╱╱╱╭╮			\n"
		" ┃╭╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╱╱╱╱╱╱╱╱╱╱┃╭━╮┃╱╱╱╱╱╱╱╱╱╱┃┃			\n"
		" ┃╰╯╰┳━━┳╮╭╮╭╮╭┳┳━╮╭━╯┣━━╮╭━━┳━━╮┃╰━━┳━━┳━┳╮╭┳┳━╯┣━━┳━╮	\n"
		" ┃╭━╮┃┃━┫╰╯┃┃╰╯┣┫╭╮┫╭╮┃╭╮┃┃╭╮┃╭╮┃╰━━╮┃┃━┫╭┫╰╯┣┫╭╮┃╭╮┃╭╯	\n"
		" ┃╰━╯┃┃━┫┃┃┃╰╮╭┫┃┃┃┃╰╯┃╰╯┃┃╭╮┃╰╯┃┃╰━╯┃┃━┫┃╰╮╭┫┃╰╯┃╰╯┃┃		\n"
		" ╰━━━┻━━┻┻┻╯╱╰╯╰┻╯╰┻━━┻━━╯╰╯╰┻━━╯╰━━━┻━━┻╯╱╰╯╰┻━━┻━━┻╯		\n")


#
#--------------------------------------------------------------------------------------------------------------------------------------------
#Acesso actual: http://127.0.0.1:10007/ (uso de porta 10007, onde 7 é o nº do nosso grupo)
#
cherrypy.config.update({'server.socket_host': '127.0.0.1',
						'server.socket_port': 10007,})
PATH = os.path.abspath(os.path.dirname(__file__))
#
#--------------------------------------------------------------------------------------------------------------------------------------------
# Configuração para servir todos os ficheiros (CSS, HTML, JS, Imagens) ao servidor
#
conf = {
		'/': {
		'tools.sessions.on': True, 
		'tools.staticdir.root': PATH,
		},
		'/css': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "css"
		},
		'/js': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "js"
		},
		'/html': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "html"
		},
		'/audio': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "audio"
		},
		'/fonts': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "fonts"
		},
		'/images': {
		'tools.staticdir.on': True,
		'tools.staticdir.dir': "images"
		}
	}

#
#--------------------------------------------------------------------------------------------------------------------------------------------
#ROOT Class
#
class Root(object):
	
	@cherrypy.expose
	def index(self):
		raise cherrypy.HTTPRedirect("/html/index.html") #redirect para o html/index.html - (Página por defeito - default)

	@cherrypy.expose
	def sounds(self):
		return open("html/sounds.html").read() #(URL:html/sounds.html)

	@cherrypy.expose
	def musics(self):
		return open("html/musics.html").read() #(URL:html/musics.html)

	@cherrypy.expose
	def create(self):
		return open("html/create.html").read() #(URL:html/create.html)

	@cherrypy.expose
	def about(self):
		return open("html/about.html").read() #(URL:html/about.html)

	@cherrypy.expose
	def download(self):
		fo = open(os.getcwd()+ '/uploads/' + myFile.filename, 'wb')
		while True:
			data = myFile.file.read(8192)
			if not data:
				break
			fo.write(data)
			print(data)
		fo.close()

	@cherrypy.expose
	def upload(self, autor, audioname, audio):	
		upload_path = PATH + "../audio/db-audio"
		
		extencao = audio.filename.split(".")
		if len(extencao) != 2 :
			print("o user tentou dar upload a uma foto com + de um .")
		else:
			db = sql.connect("database.db") #Nota: A database.db tem de ter o mesmo diretório do api.py
			result = db.execute("SELECT music_id FROM Musics")
			rows = result.fetchall()
			i=0
			for row in rows:
				i=i+1
			
			i=i+1
			print("music_id=",i)
			name=str(i)	#Nota: deve bater certo com a id da base de dados
			upload_filename = name+"."+extencao[1]
			upload_file = os.path.normpath(
				os.path.join(upload_path, upload_filename))
			size = 0
			with open(upload_file, 'wb') as out:
				while True:
					data = audio.file.read(8192)
					if not data:
						break
					out.write(data)
					size += len(data)
			today = date.today()
			d1 = today.strftime("%d/%m/%Y")
			ext="."+extencao[1]
			db.execute("INSERT INTO Music VALUES (?, ?, ?, ?, ?, ?,?,?);",(i,autor,0,audioname,0,autor,d1,ext))	
			db.commit()
			db.close()
		return open("/html/index.html", "r").read()

	@cherrypy.expose
	def gallery(self):
		db = sql.connect("database.db") 
		result = db.execute("SELECT music_id FROM Musics")
		rows = result.fetchall()
		i=0
		for row in rows:
			i=i+1

		i=i+1
		result = db.execute("SELECT ext FROM Musics")
		rows = result.fetchall()
		lista=[]
		ext=[]
		for row in rows:
			lista=list(row)
			ext.append(lista[0])
		categoria=[]
		for x in range(1, i):
			categoria.append("null")
		musicas=""""""
		for x in range(1, i):
			temp =str(x)+ext[x-1]
			musicas= musicas+"""
					<!-- Single Gallery Item -->
					<div class="col-12 col-sm-6 col-lg-3 single_gallery_item """+categoria[x-1]+""" mb-30 wow fadeInUp" data-wow-delay="100ms">
						<div class="single-portfolio-content">
							<img src="audio/db-audio/"""+temp+"""" alt="">
							<form method="" action="comment">
							<input type="hidden" value="""+temp+""" name="audio" style />
							<input type="hidden" value="null" name="firstname" style />
							<input type="hidden" value="null" name="lastname" style />
							<input type="hidden" value="null" name="subject" style />
							<input type="hidden" value="null" name="vote_up" style />
							<input type="hidden" value="null" name="vote_down" style />
							<div class="hover-content">
									<button type="submit" class="btn alime-btn btn-2 mt-15" style="
										margin-top: 10%;
										margin-left: 3.4vw;
									">View it now!</button>
								</form>
							</div>
						</div>
						<span class="likebtn-wrapper" data-theme="google" data-identifier="item_1"></span>
					</div>
					"""

		page =  """
		<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="description" content="">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Title -->
		<title>Galeria</title>

		<!-- Favicon -->
		<link rel="icon" href="./img/core-img/favicon.png">

		<!-- Stylesheet -->
		<link rel="stylesheet" href="style.css">

	</head>

	<body>
		<!-- Preloader -->
		<div id="preloader">
			<div class="loader"></div>
		</div>
		<!-- /Preloader -->

		<!-- Top Search Form Area -->
		<div class="top-search-area">
			<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<!-- Close -->
							<button type="button" class="btn close-btn" data-dismiss="modal"><i class="ti-close"></i></button>
							<!-- Form -->
							<form method="post" action="search" enctype="multipart/form-data">
								<input type="search" name="procura" class="form-control" placeholder="Search and hit enter...">
								<button type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Header Area Start -->
		<header class="header-area">
			<!-- Main Header Start -->
			<div class="main-header-area">
				<div class="classy-nav-container breakpoint-off">
					<div class="container">
						<!-- Classy Menu -->
						<nav class="classy-navbar justify-content-between" id="alimeNav">

							<!-- Logo -->
							<a class="nav-brand" href="./index.html"><img src="./img/core-img/logo.png" alt="" style="
								height: 60px;
								width: 165px;
							"></a>

							<!-- Navbar Toggler -->
							<div class="classy-navbar-toggler">
								<span class="navbarToggler"><span></span><span></span><span></span></span>
							</div>

							<!-- Menu -->
							<div class="classy-menu">
								<!-- Menu Close Button -->
								<div class="classycloseIcon">
									<div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
								</div>
								<!-- Nav Start -->
								<div class="classynav">
									<ul id="nav">
										<li ><a href="./index.html">Home</a></li>
										<li class="active"><a href="./gallery">Galeria</a></li>
										<li><a href="./upload.html">Enviar Foto</a></li>
										<li><a href="./about.html">Info autores</a></li>
									</ul>

									<!-- Search Icon -->
									<div class="search-icon" data-toggle="modal" data-target="#searchModal"><i class="ti-search"></i></div>
								</div>
								<!-- Nav End -->
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<!-- Header Area End -->
		<!-- Breadcrumb Area Start -->
		<section class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/38.jpg);">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<div class="breadcrumb-content text-center">
							<h2 class="page-title">Galeria</h2>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-center">
									<li class="breadcrumb-item"><a href="index.html"><i class="icon_house_alt"></i>Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Galeria</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Breadcrumb Area End -->
	<!-- Gallery Area Start -->


	<div class="alime-portfolio-area section-padding-80 clearfix">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<!-- Projects Menu -->
					<div class="alime-projects-menu">
						<div class="portfolio-menu text-center">
							<button class="btn active" data-filter="*" name="all">All</button>
							<button class="btn" data-filter=".likes" name="likes">Likes</button>
							<button class="btn" data-filter=".vistos" name="vistos">Vistos</button>
							<button class="btn" data-filter=".data" name="data">Data</button>
							<button class="btn" data-filter=".autor" name="autor">Autor</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row alime-portfolio">
			"""+musicas+"""

		<!-- Gallery Area End -->

		<!-- **** All JS Files ***** -->
		<!-- jQuery 2.2.4 -->
		<script src="js/jquery.min.js"></script>
		<!-- Popper -->
		<script src="js/popper.min.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.min.js"></script>
		<!-- All Plugins -->
		<script src="js/alime.bundle.js"></script>
		<!-- Active -->
		<script src="js/default-assets/active.js"></script>
	</script>

	</body>

	</html>"""

		return page

	@cherrypy.expose
	def comment(self,audio,name,subject,gosto,title):

		db = sql.connect("database.db") 
		temp=audio.split(".")
		s=temp[0]
		s=s.replace('audio/db-audio/','')

		if(name != "null" and subject != "null"):
			nome = name
			today = date.today()
			d1 = today.strftime("%d/%m/%Y")
			db.execute("INSERT INTO comments VALUES (?, ?, ?, ?);",(s,d1,nome,subject))
			db.commit()

		if(gosto != "null"):
			executar="SELECT votes FROM Music WHERE music_id LIKE "+s
			result = db.execute(executar) 
			rows = result.fetchall()
			for row in rows:
				lista=list(row)
				likes=lista[0]

			if(gosto == "1" ):
				likes=likes+1

			db.execute("update Music set votes= ? where music_id= ?",(likes,s))
			db.commit()

		execute="SELECT v_numb FROM Music WHERE music_id LIKE "+s
		result = db.execute(execute) 
		rows = result.fetchall()
		for row in rows:
			lista=list(row)
			vistos=lista[0]

		vistos=vistos+1
		db.execute("update Music set v_numb= ? where music_id= ?",(vistos,s))
		db.commit()

		executar="SELECT * FROM Music WHERE music_id LIKE "+s
		result = db.execute(executar) 
		rows = result.fetchall()
		dados=[]
		for row in rows:
			lista=list(row)
			for y in lista:
				dados.append(y)

		executar="SELECT * FROM comments WHERE comment_id LIKE "+s
		result = db.execute(executar) 
		rows = result.fetchall()
		comentarios=[]
		z=0
		for row in rows:
			z=z+1
			lista=list(row)
			for y in lista:
				comentarios.append(y)

		for_comentarios=""""""
		u=2
		for x in range(0,z):
			for_comentarios= for_comentarios+"""
						<h6>Nome: """+str(comentarios[u])+"""</h2>
						<p>Data: """+str(comentarios[u-1])+"""</p>
						<p>Comentario: """+str(comentarios[u+1])+"""</p>
					"""
			u=u+4

		audio="audio/db-audio/"+audio

		page="""<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
			"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		<meta charset="utf-8">

		<head>
			<title>Info</title>
			<meta name="viewport" content="initial-scale=1, maximum-scale=1">
			<meta name="apple-mobile-web-app-capable" content="yes">
			<meta name="apple-mobile-web-app-status-bar-style" content="black">
			<link href="css/ratchet.css" rel="stylesheet">
			<link href="css/musicas.css" rel="stylesheet">
			<script src="js/sons.js"></script>
		</head>

		<body>
			<!-- Make sure all your bars are the first things in your <body> -->
			<header class="bar bar-nav">
				<a class="icon icon-home" href="index.html" style="color:white"></a>
				<h1 class="title inline" style="color:white;"></h1>
			</header>
			<!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
			<div class="content" style="background-image: url('images/banner.jpg');">
				<div class="spacing"></div>
				<div class="leftcard">
				</div>
				<div class="rightcard">
					<div class="infocontain"><b>Titulo:</b>&nbsp;&nbsp;&nbsp;&nbsp; """+str(title)+"""</div>
					<div class="infocontain"><b>Autor:</b>&nbsp;&nbsp;&nbsp;&nbsp; """+str(nome)+"""</div>
					<div class="infocontain"><b>Vistos:</b>&nbsp;&nbsp;&nbsp;&nbsp; """+str(vistos)+"""</div>
					<div class="infocontain"><b>Votos:</b>&nbsp;&nbsp;&nbsp;&nbsp; """+str(likes)+"""</div>
				</div>
			</div>
		</body>
		</html>"""
		return page

	index.exposed = True
	gallery.exposed = True


#
#--------------------------------------------------------------------------------------------------------------------------------------------
#Funções Misc.:
def start_server():
	print(welcome)
	cherrypy.tree.mount(Root(), "/", config=conf)
	cherrypy.server.start()
	
def stop_server():
	cherrypy.engine.exit()

#
#--------------------------------------------------------------------------------------------------------------------------------------------
#Iniciação do Servidor (MAIN):
if __name__ == '__main__':
	try:
		start_server()
	except KeyboardInterrupt:
		stop_server()
