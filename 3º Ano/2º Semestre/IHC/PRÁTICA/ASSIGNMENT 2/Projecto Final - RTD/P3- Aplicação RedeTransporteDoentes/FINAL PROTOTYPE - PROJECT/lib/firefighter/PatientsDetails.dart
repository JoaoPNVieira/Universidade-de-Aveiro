import 'package:flutter/material.dart';
import 'package:rtd_project/firefighter/utentes.dart';
import 'package:rtd_project/patient/main_patient.dart';

import 'VerticalUtenteItem.dart';

class PatientsDetails extends StatefulWidget {
  const PatientsDetails({Key? key}) : super(key: key);
  @override
  _PatientsDetailsState createState() => _PatientsDetailsState();
}

class _PatientsDetailsState extends State<PatientsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Image(image: AssetImage("assets/logo/icon.png"),
            ),
          ),
        ],
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Informações"),
        backgroundColor: Color.fromARGB(230, 150, 0, 0),
      ),

      body: SafeArea(
          child: ListView(
            children: [
              buildVerticalList(),
            ],
          )
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: utentes == null ? 0 : utentes.length,
        itemBuilder: (BuildContext context, int index) {
          Map utente = utentes[index];
          return VerticalUtenteItem(utentes: utente);
        },
      ),
    );
  }


}