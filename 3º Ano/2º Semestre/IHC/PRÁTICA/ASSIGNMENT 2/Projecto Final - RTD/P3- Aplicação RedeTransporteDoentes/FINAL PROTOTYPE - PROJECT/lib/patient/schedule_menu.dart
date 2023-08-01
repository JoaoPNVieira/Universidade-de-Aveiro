import 'package:flutter/material.dart';
import 'package:rtd_project/patient/presently_scheduled_transports.dart';
import 'package:rtd_project/patient/schedule_history.dart';
import 'package:rtd_project/patient/schedule_transport.dart';
import 'package:rtd_project/patient/schedule_treatment.dart';
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  int debbug = 1;
  if(debbug == 1){
    runApp(ScheduleMainMenu());
  }
}
//
// #############################################################################
// ################ Schedule Main Menu Class ####################################
// #############################################################################
//
class ScheduleMainMenu extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}
//
// #############################################################################
// ################ Patient State Class - Main Menu ############################
// #############################################################################
//
class _ScheduleState extends State<ScheduleMainMenu> {
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
              )
        ),
// _____________________________________________________________________________
    home: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset : false, // --------------------------------> P2: Evita Overflow de Pixels **
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: const Center(
          child: Text("Agendamentos"),
        ),
      ),

      body: Center (
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),

          // -------------------------------------------------------------------
          // ------ SCHEDULE MENU OPTIONS --------------------------------------
          // -------------------------------------------------------------------
          child: Column(
                children: [
                  Column(
                    children: [
                      // -------------------------------------------------------
                      // ------ 1st OPTION - SCHEDULE TRANSPORT ----------------
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ScheduleTransport())
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                          foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                          minimumSize: const Size.fromHeight(80),
                          side: BorderSide(width: 1.0, color: Colors.blueAccent),// ---> Border color and thickness
                        ),
                        icon: const Icon(
                          color: Colors.blueAccent, // ------------------------------> Icon Color
                          Icons.add_box_outlined,
                          size: 80,
                        ),
                        label: const Text('Agendar transporte', style: TextStyle(fontSize: 25), textAlign: TextAlign.left, ), // ---> Text & its size
                      ),
                      // -------------------------------------------------------
                      // ------ 2nd OPTION - SCHEDULED TRANSPORT ---------------
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PresentlySchedule())
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                          foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                          minimumSize: const Size.fromHeight(80),
                          side: BorderSide(width: 1.0, color: Colors.blueAccent),// ---> Border color and thickness
                        ),
                        icon: const Icon(
                          color: Colors.blueAccent, // ------------------------------> Icon Color
                          Icons.list,
                          size: 80,
                        ),
                        label: const Text('Transportes marcados', style: TextStyle(fontSize: 25), textAlign: TextAlign.left, ), // ---> Text & its size
                      ),
                      // -------------------------------------------------------
                      // ------ 3rd OPTION - SCHEDULE HISTORY ------------------
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ScheduleHistory())
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                          foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                          minimumSize: const Size.fromHeight(80),
                          side: BorderSide(width: 1.0, color: Colors.blueAccent), // ---> Border color and thickness
                        ),
                        icon: const Icon(
                          color: Colors.blueAccent, // ------------------------------> Icon Color
                          Icons.history,
                          size: 80,
                        ),
                        label: const Text('Histórico', style: TextStyle(fontSize: 25), textAlign: TextAlign.left, ), // ---> Text & its size
                      ),
                      // -------------------------------------------------------
                      // ------ 4th OPTION - TREATMENT SESSIONS ----------------
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ScheduleTreat())
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                          foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                          minimumSize: const Size.fromHeight(80),
                          side: BorderSide(width: 1.0, color: Colors.blueAccent), // ---> Border color and thickness
                        ),
                        icon: const Icon(

                          color: Colors.blueAccent, // ------------------------------> Icon Color
                          Icons.personal_injury,
                          size: 80,
                        ),
                        label: const Text('Sessoẽs de tratamento', style: TextStyle(fontSize: 25), textAlign: TextAlign.left, ), // ---> Text & its size
                      ),
                    ],
                  ),
                  const Divider(
                      height:0
                  )

// #############################################################################
// ################ ENDING #####################################################
// #############################################################################
                ],
              ),
          ),
      ),
    ),
    );
  }
}