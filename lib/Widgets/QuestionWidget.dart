import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/Answers.dart';
import 'package:turksat_survey/ViewModels/QuestionVM.dart';
import 'package:turksat_survey/ViewModels/SelectedqaVM.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class QuestionWidget extends StatefulWidget {
  UserAnswersVM userAnswers;
  QuestionVM questions;

  QuestionWidget(this.questions, this.userAnswers);
  @override
  State<StatefulWidget> createState() =>
      MyQuestionWidget(questions, userAnswers);
}

class MyQuestionWidget extends State<QuestionWidget> {
  bool _isLoading = false;
  var answerController = TextEditingController();
  int index = 0;
  static List<SelectedqaVM> selectedqavm = [];
  String groupValue;
  QuestionVM questions;
  UserAnswersVM userAnswers = UserAnswersVM();

  Answers answers = new Answers();
  MyQuestionWidget(this.questions, this.userAnswers);

  bool checkIsSelected(int id) {
    bool a = false;

    for (var i = 0; i < selectedqavm.length; i++) {
      if (selectedqavm[i].questionID == id) {
        index = i;
        a = true;
        break;
      } else
        a = false;
    }

    return a;
  }

  @override
  void initState() {
    _isLoading = true;
    answers.getAnswers(questions.id).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width / 20,
                    horizontal: MediaQuery.of(context).size.width / 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${questions.questionText}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width / 25),
                      textAlign: TextAlign.justify,
                    ),
                    Row(children: <Widget>[
                      if (questions.selectionType == "MultipleChoice")
                        for (var i = 0; i < answers.answers.length; i++)
                          Expanded(
                            child: RadioListTile(
                                title: Text(
                                  "${answers.answers[i].answerText}",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                      400 &&
                                                  answers.answers.length > 3
                                              ? 18
                                              : 20),
                                ),
                                dense: true,
                                value: answers.answers[i].answerText,
                                groupValue: groupValue,
                                onChanged: (answer) {
                                  setState(() {
                                    groupValue = answer;
                                    if (checkIsSelected(questions.id)) {
                                      selectedqavm[index].answerText = answer;
                                    } else {
                                      selectedqavm.add(SelectedqaVM(
                                          questionID: questions.id,
                                          answerText: answer));
                                    }
                                    userAnswers.answers = selectedqavm;
                                  });
                                }),
                          ),
                      if (questions.selectionType == "Text")
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontSize: 20),
                            controller: answerController,
                            maxLength: 100,
                            decoration: InputDecoration(
                                hintText: "Cevabı yazınız",
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.0)),
                            onChanged: (value) {
                              setState(() {
                                if (checkIsSelected(questions.id)) {
                                  selectedqavm[index].answerText = value;
                                } else {
                                  selectedqavm.add(SelectedqaVM(
                                      questionID: questions.id,
                                      answerText: value));
                                }
                                userAnswers.answers = selectedqavm;
                              });
                            },
                          ),
                        )
                    ]),
                  ],
                ),
              ),
            ],
          );
  }
}
