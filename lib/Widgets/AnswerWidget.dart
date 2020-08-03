import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/Answers.dart';

class AnswerWidget extends StatefulWidget {
  int answerNumber;
  String answerText;
  List<String> answerList;

  AnswerWidget(this.answerText, this.answerList);
  @override
  State<StatefulWidget> createState() => MyAnswerWidget(answerText, answerList);
}

class MyAnswerWidget extends State<AnswerWidget> {
  int answerNumber;
  String answerText;
  List<String> answerList;

  MyAnswerWidget(this.answerText, this.answerList);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            answerText,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Radio(
              value: answerText,
              groupValue: answerList,
              onChanged: (value) {
                setState(() {
                  answerList = value;
                });
              }),
        ]);
  }
}
