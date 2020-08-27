import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String userName;
  String password;
  int id;
  bool isVerified = true;

  Users({this.userName, this.password});

  Future<void> verifyUser(String username, String pwd) async {
    final url =
        "https://turksatsurvey.azurewebsites.net/api/accounts/verify/$username/$pwd";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      isVerified = json.decode(response.body);
    } else {
      throw Exception("Bağlantı Sorunu");
    }
  }

  Future<void> getID(String username, String pwd) async {
    final url =
        "https://turksatsurvey.azurewebsites.net/api/accounts/$username/$pwd";
    var response = await http.get(url);
    List<int> tempList = [];
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      data.forEach((a) {
        tempList.add(a);
      });
      if (isVerified == true) id = tempList[0];
    } else {
      throw Exception("Bağlantı Sorunu");
    }
  }
}
