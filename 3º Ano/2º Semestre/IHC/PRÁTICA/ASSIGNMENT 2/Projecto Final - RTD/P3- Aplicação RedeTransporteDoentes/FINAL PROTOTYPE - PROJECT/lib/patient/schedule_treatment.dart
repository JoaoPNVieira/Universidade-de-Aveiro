import 'package:flutter/material.dart';
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  bool debug = true;
  if(debug){
    runApp(ScheduleTreat());
  }
}
//
// #############################################################################
// ################ Treatment Sessions #########################################
// #############################################################################
//
class ScheduleTreat extends StatefulWidget {
  @override
  _ScheduleTreatState createState() => _ScheduleTreatState();
}
//
// #############################################################################
// ################ Treatment Sessions Class - Main Menu #######################
// #############################################################################
//
class _ScheduleTreatState extends State<ScheduleTreat> {
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
              child: Text("Agendar um tratamento"),
            ),
          ),

          body: Center (
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Sessões de tratamento", style: TextStyle(fontSize: 17.6)),
                  ),
                  Divider(),
                  GenericTreatSession(
                    treatmentName: "Fisioterapia",
                    location: "Hospital Y",
                    date: "30/05/2023",
                    time: "16:00 - 17:00",
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