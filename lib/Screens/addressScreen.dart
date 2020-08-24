import 'package:flutter/material.dart';
import 'package:turksat_survey/Screens/LoginScreen.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';
import 'package:turksat_survey/Widgets/AddressDDB.dart';

class AddressScreen extends StatelessWidget {
  UserAnswersVM userAnswer;
  AddressScreen(this.userAnswer);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                padding: EdgeInsets.only(right: 30.0),
                icon: Icon(Icons.power_settings_new,
                    color: Theme.of(context).errorColor, size: 30.0),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                })
          ], automaticallyImplyLeading: false, title: Text("Adres Seçiniz")),
          body: Container(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AddressDDB(userAnswer),
                    SizedBox(
                      height: 20,
                    ),
                  ]))),
    );
  }
}
