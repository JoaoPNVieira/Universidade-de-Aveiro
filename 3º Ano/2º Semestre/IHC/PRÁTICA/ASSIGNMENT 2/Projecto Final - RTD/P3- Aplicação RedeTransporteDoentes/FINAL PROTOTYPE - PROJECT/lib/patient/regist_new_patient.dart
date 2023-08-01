import 'package:flutter/material.dart';
import 'package:rtd_project/patient/account_submitted.dart';
import 'package:rtd_project/patient/user_details.dart';


class RegisterNewPatient extends StatefulWidget {
  @override
  _RegisterNewPatientState createState() => _RegisterNewPatientState();
}
//
// #############################################################################
// ################ LOGIN PAGE STATE CLASS #####################################
// #############################################################################
//
class _RegisterNewPatientState extends State<RegisterNewPatient> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
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
          title: Text("Utentes - Registar novo utente"),
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
                        return 'Insira o email do patiente (opcional)...';
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
                    controller: contactController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                    validator: (contactvalue) {
                      if (contactvalue == null || contactvalue.isEmpty) {
                        return 'Insira o contacto do utente...';
                      }
                      passwordChoice = contactvalue;
                      return passwordChoice;
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
                              builder: (context) => UserDetails()
                          ),);
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