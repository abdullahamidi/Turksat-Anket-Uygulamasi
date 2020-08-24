import 'package:turksat_survey/Classes/Questions.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Surveys {
  int surveyID;
  String surveyName;
  String description;
  Questions questions;
  int questionNumber;

  Surveys({this.surveyName, this.description, this.surveyID});
  List<Surveys> surveys = [];

  Future<void> getSurveys() async {
    const url = "http://192.168.1.104:60065/api/surveys";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Surveys> tempList = [];
      data.forEach((survey) {
        tempList.add(Surveys(
            surveyID: survey["id"],
            description: survey["description"],
            surveyName: survey["surveyName"]));
      });
      surveys = tempList;
    } else {
      throw "Bağlantı Sorunu";
    }
  }

  void addSurvey() {}

  void removeSurvey() {}
}
