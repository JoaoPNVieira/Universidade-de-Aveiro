import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../patient/select_patient.dart';
import 'MultiProvider.dart';
import 'PatientsDetails.dart';
import 'contactos.dart';

void main() {
  runApp(MainFirefighter());
}

class MainFirefighter extends StatefulWidget {
  //const MainFirefighter({Key? key}) : super(key: key);

  @override
  _MainFirefighterState createState() => _MainFirefighterState();
}

class _MainFirefighterState extends State<MainFirefighter> {

  @override
  Widget build (BuildContext context) {

    final List<String> images = [
      'assets/images/transportes1.jpeg',
      'assets/images/transportes2.jpg',
      'assets/images/transportes3.jpg',
    ];

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rede Transporte de Doentes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Color.fromARGB(230, 150, 0, 0),
        ),
      ),
      home:Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Image(image: AssetImage("assets/logo/icon.png"),
            ),
          ),
        ],
        title: const Text("Área do Bombeiro"),
        backgroundColor: Color.fromARGB(230, 150, 0, 0),
      ),

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left:0,
            top:0,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              child: ImageSlideshow(
                width: width,
                height: width * 0.5,
                indicatorColor: Colors.redAccent,
                indicatorBackgroundColor: Colors.grey,
                //isLoop: true,
                children: images.map((image) {
                  return Image.asset(image);
                }).toList(),
                autoPlayInterval: 5000,     // -> está em milisegundos
                isLoop: true,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, width*0.45, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x5B000000),
                    offset: Offset(3, -5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, height*0.04),
                    child: Text("Com a RTD, o transporte\nnunca foi mais simples!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: width*0.053,
                      ),
                    ),
                  ),



                  // BOTOES ---------------------------------------------------

                  Expanded(
                      child: Align(
                        alignment: Alignment. topCenter,
                        child: Wrap(
                          runSpacing: (height+200)*0.02, //Space between Rows
                          // PESQUISAR SOBRE FUNÇÃO PARA OCUPAR O RESTANTE ESPAÇO
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width*0.80,
                                  height: height*0.1,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Multi_Provider())
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.black,
                                        elevation: 15,
                                        backgroundColor: Color.fromARGB(230, 152, 0, 1),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                              Icons.format_list_bulleted_rounded,
                                              size: 45,
                                              color: Colors.white
                                          ),

                                          Text('LISTA DE TRANSPORTES',
                                            style: TextStyle(
                                                fontSize: Checkbox.width,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width*0.80,
                                  height: height*0.1,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => PatientsDetails())
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.black,
                                        elevation: 15,
                                        backgroundColor: Color.fromARGB(230, 152, 0, 1),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                              Icons.people_alt,
                                              size: 45,
                                              color: Colors.white
                                          ),

                                          Text('DETALHES - PACIENTES',
                                            style: TextStyle(
                                                fontSize: Checkbox.width,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width*0.80,
                                  height: height*0.1,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => ContactosInternos())
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.black,
                                        elevation: 15,
                                        backgroundColor: Color.fromARGB(230, 152, 0, 1),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                            Icons.phone_iphone,
                                            size: 45,
                                            color: Colors.white,
                                          ),

                                          Text('CONTACTOS',
                                            style: TextStyle(
                                                fontSize: Checkbox.width,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      )
                  ),

                ],
              ),
            ),
          ),

        ],
      ),

    ),
    );


  }
}