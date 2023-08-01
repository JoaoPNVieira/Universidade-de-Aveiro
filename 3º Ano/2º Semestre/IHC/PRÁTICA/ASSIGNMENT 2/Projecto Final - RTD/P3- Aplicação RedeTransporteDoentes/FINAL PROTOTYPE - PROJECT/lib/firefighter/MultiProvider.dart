import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PatientListProvider.dart';
import 'PatientListScreen.dart';

class Multi_Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PatientListProvider()),
      ],
      child: MaterialApp(
        title: 'Patient List',
        home: PatientListScreen(),
      ),
    );
  }
}