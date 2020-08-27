import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turksat_survey/ViewModels/AnswerVM.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class Answers {
  List<AnswerVM> answers = [];

  Future<void> getAnswers(int questionid) async {
    try {
      var url =
          "https://turksatsurvey.azurewebsites.net/api/answers/$questionid";
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

  Future<void> insertAnswers(UserAnswersVM userAnswers) async {
    const url = "https://turksatsurvey.azurewebsites.net/api/useranswers";
    for (var i = 0; i < userAnswers.answers.length; i++) {
      await http
          .post(url,
              headers: {"Content-Type": "application/json"},
              body: json.encode({
                'AddressId': userAnswers.addressID,
                'QuestionId': userAnswers.answers[i].questionID,
                'AnswerText': userAnswers.answers[i].answerText,
                'EmployeeId': userAnswers.userID
              }))
          .then((_) {
        print("Adres başarıyla eklendi");
      });
    }
  }
}
