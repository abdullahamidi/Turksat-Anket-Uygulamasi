import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turksat_survey/ViewModels/AnswerVM.dart';

class Answers {
  List<AnswerVM> answers = [];

  Future<void> getAnswers(int questionid) async {
    try {
      var url = "http://10.0.2.2:60065/api/answers/$questionid";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<AnswerVM> tempList = [];
      data.forEach((a) {
        tempList.add(AnswerVM(id: a['id'], answerText: a['answerText']));
      });
      answers = tempList;
    } catch (error) {
      print(error);
    }
  }
}
