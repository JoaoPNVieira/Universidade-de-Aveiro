import 'package:flutter/material.dart';
import 'package:rtd_project/patient/schedule_form.dart';

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  int debbug = 1;
  if(debbug == 1){
    runApp(ScheduleTransport());
  }
}
//
// #############################################################################
// ################ Schedule Main Menu Class ####################################
// #############################################################################
//
class ScheduleTransport extends StatefulWidget {
  @override
  _ScheduleTransState createState() => _ScheduleTransState();
}
//
// #############################################################################
// ################ Schedule Transport Class - Main Menu #######################
// #############################################################################
//
class _ScheduleTransState extends State<ScheduleTransport> {
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
            child: Text("Agendar transporte"),
          ),
        ),

        body: Center (
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Divider(),
                //
                // SELECT TREATMENT SESSION
                //
                Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child:
                        ListTile(
                          leading: Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.black,
                            size: 50,
                          ),
                          title: Text('Selecione uma sessão de tratamento',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20 ,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                Divider(),
                GenericTreatSession(
                    treatmentName: "Fisioterapia",
                    location: "Hospital Y",
                    date: "30/05/2023",
                    time: "15:00 - 16:00",
                ),
                Divider(),
                GenericTreatSession(
                  treatmentName: "Urologia",
                  location: "Hospital Y",
                  date: "10/06/2023",
                  time: "14:30 - 16:00",
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class GenericTreatSession extends StatelessWidget {
  const GenericTreatSession(
      {
        super.key,
        this.treatmentName = "NULL",
        this.location = "NULL",
        this.date = "NULL",
        this.time = "NULL",
      }
      );

  final String treatmentName;
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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ScheduleFormMain())
          );
        },
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
                  title: Text(this.treatmentName,
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 20 ,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  subtitle: Text(this.location),
                ),
                Card(
                  color: Color.fromARGB(230, 150, 0, 0),
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