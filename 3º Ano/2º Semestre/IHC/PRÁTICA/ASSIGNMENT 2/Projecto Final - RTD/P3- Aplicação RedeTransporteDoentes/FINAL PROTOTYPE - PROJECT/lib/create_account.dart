import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rtd_project/patient/account_submitted.dart';
import 'package:rtd_project/patient/main_patient.dart';
import 'firefighter/main_bombeiros.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}
//
// #############################################################################
// ################ LOGIN PAGE STATE CLASS #####################################
// #############################################################################
//
class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var emailVal = "";
    var passVal = "";
    var passwordChoice = "";
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
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: Text("RTD - Criar uma conta"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Nome completo"),
                    validator: (namevalue) {
                      if (namevalue == null || namevalue.isEmpty) {
                        return 'Insira o seu nome...';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
                    validator: (emailvalue) {
                      if (emailvalue == null || emailvalue.isEmpty) {
                        return 'Insira o seu email...';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailvalue)){
                        return 'Email inválido.';
                      }
                      emailVal = emailvalue;
                      return emailVal;
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
                    validator: (passvalue1) {
                      if (passvalue1 == null || passvalue1.isEmpty) {
                        return 'Insira a sua Password...';
                      }
                      passwordChoice = passvalue1;
                      return passwordChoice;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: confirmationController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Confirmação de Password"),
                    validator: (passvalue) {
                      if (passvalue == null || passvalue.isEmpty) {
                        return 'Insira novamente a sua Password...';
                      }
                      if (RegExp(passvalue).hasMatch(passwordChoice)) {
                        passVal = passvalue;
                        return passVal;
                      }
                      return "Error. Confirmação de password não corresponde à password escolhida";
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                        child: const Text('Submeter'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AccountSubmitted()
                          ),);
                          /*
                              if (emailVal == null || emailVal == "") {
                                showDialog<String>(context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Email inválido!'),
                                        content: const Text(
                                            'Por favor insira um email válido.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),);
                              }
                              if (passVal == null || passVal == "") {
                                showDialog<String>(context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Password inválida!'),
                                        content: const Text(
                                            'Por favor verifique a sua password e confirmação da mesma.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),);
                              }
                               else {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => AccountSubmitted()
                                ),);
                              }
                             */
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}