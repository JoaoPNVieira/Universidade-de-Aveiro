import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  List<Map<String, dynamic>> contacts = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> filtered = <Map<String, dynamic>>[];
  JsonDecoder decoder = JsonDecoder();

  Future<bool> _loadAsset() async {
    String value = await rootBundle.loadString('assets/files/contacts.json');
    for (Map<String, dynamic> x in decoder.convert(value)["contacts"]) {
      contacts.add(x);
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Image(image: AssetImage("assets/images/ambulancia.jpeg"),
            ),
          ),
        ],
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Contactos:"),
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
                style: TextStyle(color: Color.fromRGBO(44, 73, 108, 1.0)),
                cursorColor: Color.fromRGBO(44, 73, 108, 1.0),
                decoration: InputDecoration(
                    labelText: "Procurar",
                    labelStyle:
                    TextStyle(color: Color.fromRGBO(44, 73, 108, 1.0)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(44, 73, 108, 1.0)),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(44, 73, 108, 1.0),
                    )
                ),
                onChanged: (e) {
                  print(contacts[0]["name"]);
                  setState(() {
                    filtered = contacts.where((element) =>
                        element["name"].toLowerCase().contains(e.toLowerCase())).toList();
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
                              filtered[index]["name"],
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                            subtitle: Text(
                              filtered[index]["type"],
                            ),
                            textColor: Color.fromRGBO(44, 73, 108, 1.0),
                            trailing: GestureDetector(
                              child: Icon(
                                  Icons.phone,
                                  color: Color.fromRGBO(44, 73, 108, 1.0),
                                  size: 36
                              ),
                              onTap: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path:filtered[index]["number"],
                                );
                                await launchUrl(launchUri);
                              },
                            ),
                          )
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
    );

  }
}