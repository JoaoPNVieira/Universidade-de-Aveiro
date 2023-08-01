import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {

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
        title: const Text("Questões Frequentes:"),
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
                        child: Text('Questão 1: A minha aplicação está bloquear. O que faço? '
                                    '\nResposta 1: Muitas vezes algumas aplicações bloqueia devido a um sobrecarregamento do sistema. Por favor saia da aolicação e volte a entrar.'
                                    '\n\nQuestão 2: Como registar um utente? \nResposta 2: No menú principal, carregue no botão utentes. Ao entrar na area de utentes irá visualizar a lista de utentes ao seu cuidado '
                                    '\nPrecione o botão azul com simbolo de adição (+), e registe o seu utente.',
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