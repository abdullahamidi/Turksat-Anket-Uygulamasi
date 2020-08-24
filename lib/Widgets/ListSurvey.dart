import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/Questions.dart';
import 'package:turksat_survey/Classes/Surveys.dart';
import 'package:turksat_survey/Screens/surveyScreen.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class ListSurvey extends StatefulWidget {
  UserAnswersVM userAnswers;
  ListSurvey(this.userAnswers);
  @override
  State<StatefulWidget> createState() => MyListSurvey(userAnswers);
}

class MyListSurvey extends State<ListSurvey> {
  UserAnswersVM userAnswers;
  MyListSurvey(this.userAnswers);

  Questions question = Questions();
  final Surveys survey = new Surveys();
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    survey.getSurveys().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            children: <Widget>[
              Text(
                "Lütfen doldurmak istediğiniz anketi seçin",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              for (var i = 0; i < survey.surveys.length; i++)
                Container(
                  child: ListTile(
                      subtitle: Text(survey.surveys[i].description,
                          style: TextStyle(fontSize: 17.0)),
                      leading: Icon(
                        Icons.library_books,
                        size: 50.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      trailing: RaisedButton(
                        elevation: 5.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).secondaryHeaderColor,
                        onPressed: () {
                          question
                              .getQuestions(survey.surveys[i].surveyID)
                              .then((value) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SurveyScreen(question, userAnswers)));
                          });
                        },
                        child: Text("Anketi Seç"),
                      ),
                      title: Text(
                        survey.surveys[i].surveyName,
                        style: TextStyle(fontSize: 25.0),
                      )),
                ),
              SizedBox(
                height: 30.0,
              ),
            ],
          );
  }
}
