import 'package:flutter/material.dart';
import 'package:turksat_survey/addressScreen.dart';
import 'package:turksat_survey/surveyScreen.dart';
import 'package:turksat_survey/LoginScreen.dart';

void main() {
  runApp(new AddressScreen());
}

class MyAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData(primaryColor: Colors.blue), child: null);
  }
}
