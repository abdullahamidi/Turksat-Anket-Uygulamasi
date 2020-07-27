import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import './Class/Users.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Türksat Anket Sistemi",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLoginPage();
}

//State Class

class _MyLoginPage extends State<LoginPage> {
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  bool _passwordVisibility = true;
  String txtUsername;
  String txtPass;
  Users user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Türksat Anket Uygulaması")),
      body: Center(
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
              margin: EdgeInsets.only(left: 175, right: 175),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle, color: Colors.blue),
                      hintText: "Kullanıcı Adını Giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
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
                        hintText: "Şifrenizi Giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: _passwordVisibility,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 75),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        //user.setUsername = userController.text;
                        //user.setPassword = pwdController.text;
                        user = Users(userController.text, pwdController.text);
                        print("${user.getUsername}  ${user.getPassword}");
                      },
                      child: Text("Giriş Yap")),
                ],
              )),
        ],
      )),
    );
  }
}

void SayiSay() {}
