import 'package:flutter/material.dart';
import 'package:turksat_survey/Widgets/AnswerWidget.dart';

enum answerTypes { yesOrNo, aggrement }

List<Map<String, Object>> answersList = [
  {
    'answerType': 'yesOrNo',
    'answers': ['Yes', 'No']
  },
  {
    'answerType': 'aggrement',
    'answers': [
      'Kesinlikle katılıyorum',
      'Katılıyorum',
      'Kararsızım',
      'Katılmıyorum',
      'Kesinlikle katılmıyorum',
    ]
  }
];

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final answerTypes answerType;

  int determineAnswerType() {
    int i;
    switch (answerType) {
      case answerTypes.yesOrNo:
        i = answerType.index;
        break;
      case answerTypes.aggrement:
        i = answerType.index;
        break;
      default:
    }
    return i;
  }

  QuestionWidget(this.questionText, this.answerType);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$questionText",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ...(answersList[determineAnswerType()]['answers']
                              as List<String>)
                          .map((answer) {
                        return AnswerWidget(answer,
                            answersList[determineAnswerType()]['answers']);
                      }).toList(),
                    ]),
              ])),
    );
  }
}
