import 'package:flutter/material.dart';
import 'package:turksat_survey/Widgets/QuestionWidget.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Türksat Anket Sistemi",
        darkTheme: ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(title: Text("Türksat Anket Uygulaması")),
            body: Column(children: <Widget>[
              QuestionWidget(
                  'Hizmetimizden memnun musunuz?', answerTypes.yesOrNo),
              QuestionWidget(
                  'Hizmet kalitesi çok iyidi', answerTypes.aggrement),
              RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 75),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text("Anketi Kaydet")),
            ])));
  }
}
