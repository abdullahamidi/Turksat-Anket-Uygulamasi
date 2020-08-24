import 'package:flutter/material.dart';
import 'package:turksat_survey/Screens/LoginScreen.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';
import 'package:turksat_survey/Widgets/ListSurvey.dart';

class SurveySelect extends StatelessWidget {
  UserAnswersVM userAnswers;
  SurveySelect(this.userAnswers);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anket Seçiniz"),
          actions: [
            IconButton(
                padding: EdgeInsets.only(right: 30.0),
                icon: Icon(Icons.power_settings_new,
                    color: Theme.of(context).errorColor, size: 30.0),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                })
          ],
        ),
        body: ListSurvey(userAnswers));
  }
}
