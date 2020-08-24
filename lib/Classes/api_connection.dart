import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class ApiConnections {
  Future<void> insertAddress(UserAnswersVM userAnswers) async {
    const url = "http://10.0.2.2:60065/api/useranswers";
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
