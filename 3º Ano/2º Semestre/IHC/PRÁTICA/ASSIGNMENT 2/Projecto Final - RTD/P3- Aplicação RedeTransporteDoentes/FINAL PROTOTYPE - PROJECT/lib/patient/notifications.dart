import 'package:flutter/material.dart';
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  int debbug = 1;
  if(debbug == 1){
    runApp(Notifications());
  }
}
//
// #############################################################################
// ################ Schedule Main Menu Class ####################################
// #############################################################################
//

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}
//
// #############################################################################
// ################ Patient State Class - Main Menu ############################
// #############################################################################
//
class _NotificationState extends State<Notifications> {
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
          resizeToAvoidBottomInset : false,
          appBar: AppBar(
            leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            title: const Center(
              child: Text("Notificações"),
            ),
          ),

          body: Center (
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Hoje - 30/05/2023:", style: TextStyle(fontSize: 17.6)),
                  ),
                  Divider(),
                  //
                  // SELECT TREATMENT SESSION
                  //
                  Divider(),
                  GenericTreatSession(
                    notificationTitle: "Transportate confirmado! ",
                    location: "Hospital São João, Porto",
                    date: "30/05/2023",
                    time: "10:00",
                  ),
                  Divider(),
                  GenericTreatSession(
                    notificationTitle: "Transportate confirmado!",
                    location: "Hospital da Luz, Aveiro",
                    date: "11/02/2020",
                    time: "14:30",
                  ),
                  /*
                  Divider(),
                  GenericTreatSession(
                    notificationTitle: "Transportate confirmado!",
                    location: "Hospital São João, Porto",
                    date: "20/06/2019",
                    time: "09:00",
                  ),
                  Divider(),
                  GenericTreatSession(
                    notificationTitle: "Transportate confirmado!",
                    location: "Hospital da Luz, Aveiro",
                    date: "25/08/2018",
                    time: "11:00",
                  ),

                   */
                ],
              ),
            ),
          ),
        )
    );
  }
}


// #############################################################################
// ##### USAR PARA COLOCAR FUNCIONALIDADES DE VISUALIZAR NOTIFICAÇÕES ##########
// #############################################################################

class GenericTreatSession extends StatelessWidget {
  const GenericTreatSession(
      {
        super.key,
        this.notificationTitle = "NULL",
        this.location = "NULL",
        this.date = "NULL",
        this.time = "NULL",
      }
      );

  final String notificationTitle;
  final String location;
  final String date; // As a placeholder, we won't be using a special Date class
  final String time;

  @override
  Widget build(BuildContext context)
  {
    //
    // GENERIC SESSION CARD
    //
    // AndroidStudio did some weird indentation here
    return
      GestureDetector(
        onTap: () { },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child:
            Column(
              children: <Widget> [
                ListTile(
                  title: Text(this.notificationTitle,
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 20 ,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  subtitle: Text(this.location),
                ),
                Card(
                  color: Colors.blueAccent,
                  child:
                  ListTile(
                    title: Text(this.date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15 ,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    subtitle: Text(this.time,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        // END OF GENERIC OPTION
        //
      );
  }
}