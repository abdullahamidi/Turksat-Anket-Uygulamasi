import 'dart:io';

import 'package:flutter/material.dart';
import 'package:turksat_survey/Screens/LoginScreen.dart';

import 'Classes/HttpOverride.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          secondaryHeaderColor: Colors.white,
          disabledColor: Colors.blueGrey[300],
          errorColor: Colors.red,
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 25.0),
            bodyText2: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
            button: TextStyle(fontSize: 20.0),
            headline1: TextStyle(fontSize: 22.0),
            subtitle1: TextStyle(fontSize: 22.0),
          )),
      home: LoginScreen(),
    );
  }
}
