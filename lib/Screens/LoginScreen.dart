import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/Users.dart';
import 'package:turksat_survey/Screens/addressScreen.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLoginScreen();
}

//State Class

class _MyLoginScreen extends State<LoginScreen> {
  UserAnswersVM userAnswers = UserAnswersVM();
  Users user = Users();
  var userController = TextEditingController();
  var pwdController = TextEditingController();
  bool _passwordVisibility = true;
  bool _isEmpty = true;
  bool _isLoading = false;
  String errorText = "";
  String txtUsername;
  String txtPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Türksat Anket Uygulaması")),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/images/kablo.jpg",
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              scale: 2.5,
            ),
            //Text and Button Container
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextField(
                      onChanged: (_) => checkisEmpty(),
                      controller: userController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle, color: Colors.blue),
                        hintText: user.isVerified == false
                            ? "Lütfen geçerli bir Kullanıcı Adı girin!"
                            : "Kullanıcı Adı",
                        hintStyle: user.isVerified == false
                            ? TextStyle(color: Theme.of(context).errorColor)
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onChanged: (_) => checkisEmpty(),
                      controller: pwdController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  _passwordVisibility = !_passwordVisibility;
                                });
                              }),
                          icon: Icon(Icons.lock, color: Colors.blue),
                          hintText: user.isVerified == false
                              ? "Lütfen geçerli bir Şifre girin!"
                              : "Şifre",
                          hintStyle: user.isVerified == false
                              ? TextStyle(color: Theme.of(context).errorColor)
                              : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(color: Colors.blue))),
                      obscureText: _passwordVisibility,
                    ),
                    SizedBox(height: 10.0),
                    _isLoading
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: _isEmpty
                                ? null
                                : () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    user
                                        .verifyUser(userController.text,
                                            pwdController.text)
                                        .then((_) {
                                      setState(() {
                                        user
                                            .getID(userController.text,
                                                pwdController.text)
                                            .then((value) {
                                          setState(() {
                                            userAnswers.userID = user.id;
                                          });
                                        });
                                        _isLoading = false;
                                        if (user.isVerified) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddressScreen(
                                                          userAnswers)));
                                        } else {
                                          userController.clear();
                                          pwdController.clear();
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          _isEmpty = true;
                                        }
                                      });
                                    });
                                  },
                            child: Text("Giriş Yap")),
                  ],
                )),
          ],
        )),
      ),
    );
  }

  bool checkisEmpty() {
    if (userController.text == "" || pwdController.text == "")
      setState(() {
        _isEmpty = true;
      });
    else
      setState(() {
        _isEmpty = false;
      });
    return _isEmpty;
  }
}
