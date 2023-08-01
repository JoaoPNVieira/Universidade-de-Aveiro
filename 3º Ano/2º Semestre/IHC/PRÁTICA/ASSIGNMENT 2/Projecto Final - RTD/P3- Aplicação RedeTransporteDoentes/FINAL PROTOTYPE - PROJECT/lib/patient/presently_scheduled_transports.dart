import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!! DEBUGGER SNIPPET !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
void main() {
  int debbug = 1;
  if(debbug == 1){
    runApp(PresentlySchedule());
  }
}

class PresentlySchedule extends StatefulWidget {
  const PresentlySchedule({Key? key}) : super(key: key);

  @override
  _PresentlyScheduleState createState() => _PresentlyScheduleState();
}

class _PresentlyScheduleState extends State<PresentlySchedule> {

  List<Map<String, dynamic>> transportation = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> filtered = <Map<String, dynamic>>[];
  JsonDecoder decoder = JsonDecoder();

  Future<bool> _loadAsset() async {
    String value = await rootBundle.loadString('assets/files/scheduled_transports.json');
    for (Map<String, dynamic> x in decoder.convert(value)["transportation"]) {
      transportation.add(x);
      filtered.add(x);
    }
    return true;
  }
  @override
  void initState() {
    super.initState();
    _loadAsset().then((value) => setState(() {}));
  }
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rede Transporte de Doentes',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(230, 150, 0, 0),
      ),),
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: const Text("Transportes já marcados"),
          backgroundColor: Color.fromARGB(230, 150, 0, 0),
        ),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: "Procurar",
                      labelStyle:
                      TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )
                  ),
                  onChanged: (e) {
                    print(transportation[0]["treatment"]);
                    setState(() {
                      filtered = transportation.where((element) =>
                          element["treatment"].toLowerCase().contains(e.toLowerCase())).toList();
                    });
                  },
                ),
              ),

              Flexible(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                filtered[index]["treatment"],
                                style: TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                              subtitle: Text(
                                filtered[index]["date"],
                              ),
                              textColor: Colors.blueAccent,
                              trailing: GestureDetector(
                                child: Icon(
                                    Icons.today_outlined,
                                    color: Colors.redAccent,
                                    size: 36
                                ),
                                onTap: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}