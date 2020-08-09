import 'package:flutter/material.dart';
import 'package:turksat_survey/Widgets/ListSurvey.dart';

class SurveySelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Anket Seçiniz")), body: ListSurvey());
  }
}
