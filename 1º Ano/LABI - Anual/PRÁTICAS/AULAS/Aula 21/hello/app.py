import os
import cherrypy
import time

baseDir = os.path.dirname(os.path.abspath(__file__))
config = {
	"/":     { "tools.staticdir.root": baseDir },
	"/js":   { "tools.staticdir.on":True,"tools.staticdir.dir": "js" },
	"/css":  { "tools.staticdir.on":True,"tools.staticdir.dir": "css" }
}

class HelloWorld(object):
	@cherrypy.expose
	def index(self):
	# Método serve_file tb poderia ser utilizado
	return open("index.html")
	
	@cherrypy.expose
	def time(self):
		cherrypy.response.headers["Content-Type"] = "application/json"
		return time.strftime(’{"date":"%d-%m-%Y", "time":"%H:%M:%S"}’).encode('utf-8')
		cherrypy.quickstart(HelloWorld(),"/",config)
