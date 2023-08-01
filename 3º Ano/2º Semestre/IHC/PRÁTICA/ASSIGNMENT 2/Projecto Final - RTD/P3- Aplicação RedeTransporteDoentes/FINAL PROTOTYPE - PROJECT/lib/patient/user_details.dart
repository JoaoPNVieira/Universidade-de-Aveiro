import 'package:flutter/material.dart';
import 'package:rtd_project/patient/main_patient.dart';
import 'package:rtd_project/patient/presently_scheduled_transports.dart';
import 'package:rtd_project/patient/regist_new_patient.dart';
import 'package:rtd_project/patient/schedule_history.dart';
import 'package:rtd_project/patient/schedule_transport.dart';
import 'package:rtd_project/patient/schedule_treatment.dart';


class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  void _alterStatus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Utente'),
          content: Text('Selecione ação:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ScheduleTransport())
                );
              },
              child: Text('Agendar Transporte'),
            ),

            TextButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PresentlySchedule())
                );

              },
              child: Text('Ver transportes marcados'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ScheduleHistory())
                );
              },
              child: Text('Ver histórico de transporte'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ScheduleTreat())
                );
              },
              child: Text('Ver sessões de tratamento'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build (BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MainPatient())
              );
            }
        ),
        title: const Text("Lista de Transportes"),
        backgroundColor: Color.fromARGB(230, 150, 0, 0),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Flexible(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      child: Column(
                        children: [

                          ListTile(
                            title: Text("Honório Rodrigues",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text("86 anos - Rua da Amoreira, nº 20"
                            ),
                            textColor: Color.fromRGBO(44, 73, 108, 1.0),
                            trailing: GestureDetector(
                              child: Icon(
                                  Icons.navigate_next_outlined,
                                  color: Color.fromRGBO(44, 73, 108, 1.0),
                                  size: 36
                              ),
                              onTap: () {
                                _alterStatus(); // Chama _alterStatus passando o BuildContext
                              },
                            ),
                          ),

                          ListTile(
                            title: Text("Maria Augusta Sousa",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text("78 anos - Avenida da Ajuda, nº 42"
                            ),
                            textColor: Color.fromRGBO(44, 73, 108, 1.0),
                            trailing: GestureDetector(
                              child: Icon(
                                  Icons.navigate_next_outlined,
                                  color: Color.fromRGBO(44, 73, 108, 1.0),
                                  size: 36
                              ),
                              onTap: () {
                                _alterStatus(); // Chama _alterStatus
                              },
                            ),
                          ),
                          SizedBox.fromSize(
                            size: Size(80, 80),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blueAccent,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => RegisterNewPatient()
                                    ),);

                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );


  }
}