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
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 30,
                vertical: MediaQuery.of(context).size.height / 30),
            children: <Widget>[
              for (var i = 0; i < survey.surveys.length; i++)
                Container(
                  child: ListTile(
                      subtitle: survey.surveys[i].description == null
                          ? Text(
                              "No Description",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontStyle: FontStyle.italic),
                            )
                          : Text(
                              survey.surveys[i].description,
                            ),
                      leading: Icon(
                        Icons.library_books,
                        size: MediaQuery.of(context).size.width / 10,
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
                      )),
                ),
              SizedBox(
                height: 30.0,
              ),
            ],
          );
  }
}
