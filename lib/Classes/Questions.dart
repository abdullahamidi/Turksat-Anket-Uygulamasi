import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turksat_survey/ViewModels/QuestionVM.dart';

class Questions {
  List<QuestionVM> questions;

  Future<void> getQuestions(int surveyid) async {
    try {
      var url =
          "https://turksatsurvey.azurewebsites.net/api/questions/$surveyid";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<QuestionVM> tempList = [];
      data.forEach((a) {
        tempList.add(QuestionVM(
            id: a['id'],
            questionText: a['questionText'],
            selectionType: a['selectionType']));
      });
      questions = tempList;
    } catch (error) {
      print(error);
    }
  }
}
