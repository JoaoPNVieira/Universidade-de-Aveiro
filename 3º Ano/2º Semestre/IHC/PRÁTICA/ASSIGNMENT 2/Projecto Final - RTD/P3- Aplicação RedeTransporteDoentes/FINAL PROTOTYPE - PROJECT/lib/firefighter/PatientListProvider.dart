import 'package:flutter/foundation.dart';

import 'Patient.dart';

class PatientListProvider with ChangeNotifier {
  List<Patient> _patients = [
    Patient(name: 'Honório Rodrigues', status: 'Próximo', details: "83 anos - Rua da Amoreira, nº 42 \nTransporte por cadeira de rodas"),
    Patient(name: 'Joaquina Lima', status: 'Recolhido', details: "79 anos - Avenida Lourenço Peixinho, nº 69"),
    Patient(name: 'Bernardo Loureiro', status: 'Recolhido', details: "85 anos - Travessa da Universidade, nº 27 \nMobilidade reduzida"),
    Patient(name: 'José Luís Vieira', status: 'Próximo', details: "75 anos - Rua do Campismo, nº 854"),
    Patient(name: 'Catarina Silva', status: 'Recolhido', details: "78 - Avenida de Famalicão, Edifício Terra e Mar, 1ª Dir, nº 12"),
    // Add more patients as needed
  ];

  List<Patient> get patients => _patients;

  void updatePatientStatus(int index, String newStatus) {
    _patients[index] = _patients[index].copyWith(status: newStatus);
    notifyListeners();
  }

  List<Patient> getPatientsByStatus(String status) {
    return _patients.where((patient) => patient.status == status).toList();
  }
}
