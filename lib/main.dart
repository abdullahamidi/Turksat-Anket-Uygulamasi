import 'package:flutter/material.dart';

import 'package:turksat_survey/Screens/surveyScreen.dart';

void main() {
  runApp(new SurveyScreen());
}

class MyAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData(primaryColor: Colors.blue), child: null);
  }
}
