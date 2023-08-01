import 'package:flutter/material.dart';
import 'package:rtd_project/patient/about.dart';
import 'package:rtd_project/patient/contacts.dart';
import 'package:rtd_project/patient/faq.dart';
import 'package:rtd_project/patient/notifications.dart';
import 'package:rtd_project/patient/schedule_menu.dart';
import 'package:rtd_project/patient/user_details.dart';
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  int debbug = 0;
  if(debbug == 1){
    runApp(MainPatient());
  }
}
//
// #############################################################################
// ################ Patient Main Menu Class ####################################
// #############################################################################
//
class MainPatient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}
//
// #############################################################################
// ################ Patient State Class - Main Menu ############################
// #############################################################################
//
class _PatientState extends State<MainPatient> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rede Transporte de Doentes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              color: Color.fromARGB(230, 150, 0, 0),
              ),
        ),
// _____________________________________________________________________________
        home: Scaffold( // ----------------------------------------------------> P1: Scaffold tem de ser Child de MaterialApp
          backgroundColor: Color.fromARGB(230, 150, 0, 0), // -----------------------------------> EDIT: Background Color
          resizeToAvoidBottomInset : false, // --------------------------------> P2: Evita Overflow de Pixels **
          appBar: AppBar(
            leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            title: const Center(
              child: Text("RTD - Menu Principal")
            ),
          ),
          body: SingleChildScrollView( // -------------------------------------> P2: Evita Overflow de Pixels **
            child: Column(
              children: <Widget>[
                GridView.count(
                  shrinkWrap: true,
                  primary: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: <Widget>[
// #############################################################################
// ################ SCHEDULE - UPPER LEFT BUTTON ###############################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ScheduleMainMenu())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.local_hospital,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Agendamentos', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),
// #############################################################################
// ################ PATIENT - UPPER RIGHT BUTTON ###############################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserDetails())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.account_box,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Utentes', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),
// #############################################################################
// ################ CONTACTS - MIDDLE LEFT BUTTON ##############################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Contacts())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.phone,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Contactos', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),
// #############################################################################
// ################ NOTIFICATIONS - MIDDLE RIGHT BUTTON ########################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Notifications())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.notifications,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Notificações', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),
// #############################################################################
// ################ CONTACTS - LOWER LEFT BUTTON ##############################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Faq())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.help,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Ajuda', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),
// #############################################################################
// ################ CONTACTS - MIDDLE LEFT BUTTON ##############################
// #############################################################################
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => About())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ---------------------> Button Color (Background color)
                        foregroundColor: Colors.blueAccent, // --------------------> Text Color  (Foreground color)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:0.1,
                          ),
                          Icon(
                            color: Colors.blueAccent, // ------------------------------> Icon Color
                            Icons.info,
                            size: 80,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                            Text('Sobre', style: TextStyle(fontSize: 25),), // -> Text & Size
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
// #############################################################################
// ################ ENDING #####################################################
// #############################################################################
              ],
            ),
          ),
        ));
      }
    }
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------