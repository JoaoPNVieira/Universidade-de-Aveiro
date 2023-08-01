import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rtd_project/create_account.dart';
import 'package:rtd_project/patient/main_patient.dart';
import 'firefighter/main_bombeiros.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
//
// #############################################################################
// ################ LOGIN PAGE STATE CLASS #####################################
// #############################################################################
//
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        home: Scaffold(
          resizeToAvoidBottomInset : false,
            appBar: AppBar(
              title: Text("RTD - Login"),
            ),
            body: Form(
              key: _formKey,
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image(
                    image: AssetImage('assets/logo/icon.png'),
                    width: 200, // desired width
                    height: 200, // desired height
                    fit: BoxFit.cover, // how the image should be inscribed into the space
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o seu email...';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira a sua Password...';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(

                        child: const Text('Login',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),

                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 15,
                            backgroundColor: Color.fromARGB(230, 152, 0, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                          ),

                        onPressed: () {
                          if (emailController.text == "honorio@gmail.com" &&
                              passwordController.text == "ajuda123") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MainPatient()
                            ),);
                          }
                          if (emailController.text == "marialuisa@gmail.com" &&
                              passwordController.text == "ajuda123") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MainPatient()
                            ),);
                          }
                          if (emailController.text == "paulo@bombeiro.pt" &&
                              passwordController.text == "ajuda123") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MainFirefighter()
                            ),);
                          } else {
                            showDialog<String>(context: context,
                              builder: (BuildContext context) =>
                                  AlertDialog(
                                    title: const Text('Credenciais Erradas!'),
                                    content: const Text(
                                        'Email ou Password incorrectos.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),);
                          }
                        }
                        ),
                    ),
                  ),

                  SizedBox(
                    height: 70,
                  ),

              TextButton(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CreateAccount()
                      ),
                    ),
                    child: const Text('Não tem conta? Crie uma aqui!',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        );
  }
}