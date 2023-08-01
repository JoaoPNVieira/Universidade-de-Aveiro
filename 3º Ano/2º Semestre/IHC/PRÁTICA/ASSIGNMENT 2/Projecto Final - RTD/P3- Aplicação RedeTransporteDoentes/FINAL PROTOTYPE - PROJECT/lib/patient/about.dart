import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {

    // get the screen size
    Size size = MediaQuery.of(context).size;

    // padding 10% of screen width
    double horizontalPadding1 = size.width * 0.05;

    // padding 25% of screen width
    double verticalPadding1 = size.height * 0.25;

    // padding 5% of screen width
    double verticalPadding2 = size.height * 0.05;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Image(image: AssetImage("assets/logo/icon.png"),
            ),
          ),
        ],
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: const Text("Sobre esta APP"),
        backgroundColor: Color.fromARGB(230, 150, 0, 0),
      ),

      body: SafeArea(
          child: Center(
            child: Column(
              children: [

                Card(
                  child:Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text('Versão 1.0.0',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(230, 152, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Esta aplicação foi desenvolvida no ambito da unidade curricular "Interação HUmano-COmputador" da Universidade de Aveiro, no decorrer do ano lectivo 2022/2023 '
                            '\nAutores:'
                            '\n\nJoão Pedro Nunes Vieira, NºMec.: 50458 '
                            '\nLara Catarina da Silva Matos, NºMec.: 95228'
                            '\nVitor Manuel Santos: NºMEc.: 107186',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                            //color: Colors.teal,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          )

      ),

    );
  }
}