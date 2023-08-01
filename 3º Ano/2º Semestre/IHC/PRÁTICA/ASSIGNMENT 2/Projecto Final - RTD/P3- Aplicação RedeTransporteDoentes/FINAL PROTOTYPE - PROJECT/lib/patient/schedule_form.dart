import 'package:flutter/material.dart';
import 'confirmation_page.dart';

void main()
{
  bool debug = true;
  if(debug)
    runApp(ScheduleFormMain());
}

// #############################################################################
// ################ Schedule Form Main Class ###################################
// #############################################################################
//
class ScheduleFormMain extends StatefulWidget {
  @override
  _ScheduleFormMainState createState() => _ScheduleFormMainState();
}

//
// #############################################################################
// ################ Schedule Form Main State Class #############################
// #############################################################################
//
class _ScheduleFormMainState extends State<ScheduleFormMain> {
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

          body: ScheduleForm(),
      ),
    );
  }
} //
// Custom Form widget.
class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key});

  @override
  ScheduleFormState createState() {
    return ScheduleFormState();
  }
}

class ScheduleFormState extends State<ScheduleForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  bool _submitted = false;

  String? get _errorText {
    final text = dateController.value.text;

    if (text.isEmpty) {
      return 'Especifique uma hora!';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return
      Center (
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Preencha os dados do seu agendamento", style: TextStyle(fontSize: 17.6)),
                  ),
                  Divider(),
                // Add TextFormFields and ElevatedButton here.
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.home),
                      hintText: '',
                      labelText: 'Morada'
                  ),
                ),
                  TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Hora *",
                          errorText: _submitted ? _errorText : null ,
                      ),
                      readOnly: true,  // when true user cannot edit text
                      onTap: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );
                        if(selectedTime != null) {
                          setState(() {
                            dateController.text = selectedTime.hour.toString() + ":" +selectedTime.minute.toString(); //set foratted date to TextField value.
                          });
                        }
                      },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: '',
                        labelText: 'Comentários:'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ConfirmationPage())
                          );
                          setState(() {
                            _submitted = true;
                          });
                        }
                      },
                      child: const Text('Submeter'),
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