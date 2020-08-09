import 'package:flutter/material.dart';
import 'package:turksat_survey/Screens/LoginScreen.dart';
import 'package:turksat_survey/Screens/addressScreen.dart';

import 'package:turksat_survey/Screens/surveyScreen.dart';

import 'Screens/SurveySelectScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            secondaryHeaderColor: Colors.white,
            errorColor: Colors.red),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/address': (context) => AddressScreen(),
          '/surveyselect': (context) => SurveySelect(),
          '/survey': (context) => SurveyScreen()
        });
  }
}
