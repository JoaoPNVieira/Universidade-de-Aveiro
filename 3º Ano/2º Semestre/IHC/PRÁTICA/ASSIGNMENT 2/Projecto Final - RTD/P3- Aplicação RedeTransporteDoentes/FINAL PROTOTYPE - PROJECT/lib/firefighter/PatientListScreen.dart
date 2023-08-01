import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PatientListProvider.dart';
import 'main_bombeiros.dart';

class PatientListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MainFirefighter())
              );
            }
        ),
        title: const Text("Lista de Transportes"),
        backgroundColor: Color.fromARGB(230, 152, 0, 1),
      ),
      body: Consumer<PatientListProvider>(
        builder: (context, provider, _) {
          final patients = provider.patients;

          return ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final patient = patients[index]; // Update this line
              return ListTile(
                title: Text(patient.name,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                subtitle: Text(patient.details
                ),
                trailing: DropdownButton<String>(
                  value: patient.status,
                  items: <String>['Próximo', 'Recolhido', 'Concluído']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    provider.updatePatientStatus(index, newValue!);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

