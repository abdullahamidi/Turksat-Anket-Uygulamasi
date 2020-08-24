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
      theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.white,
        disabledColor: Colors.blueGrey[300],
        errorColor: Colors.red,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: "Oswald", fontSize: 25.0),
          button: TextStyle(fontFamily: "Oswald", fontSize: 20.0),
          headline1: TextStyle(fontFamily: "Oswald", fontSize: 22.0),
          subtitle1: TextStyle(fontFamily: "Oswald", fontSize: 18.0),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
