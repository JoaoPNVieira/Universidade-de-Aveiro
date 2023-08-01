import 'package:flutter/material.dart';
import 'package:rtd_project/create_account.dart';
import 'package:rtd_project/login_page.dart';

class AccountSubmitted extends StatefulWidget {
  const AccountSubmitted({Key? key}) : super(key: key);
  @override
  _AccountSubmittedState createState() => _AccountSubmittedState();
}

class _AccountSubmittedState extends State<AccountSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: const Text("Conta registada!"),
        backgroundColor: Color.fromARGB(230, 152, 0, 1),
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Verifique o seu email!',
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
                      child: Text('O seu pedido de adesão está a ser processado... '
                          '\nPara sua segurança, enviámos-lhe um email com link de confirmação! ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          //color: Colors.teal,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginPage()
                          ),);
                        },
                        child: Text('Voltar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}