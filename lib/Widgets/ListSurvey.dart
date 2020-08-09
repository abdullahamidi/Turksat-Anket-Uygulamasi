import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/Surveys.dart';
import 'package:turksat_survey/Screens/surveyScreen.dart';

class ListSurvey extends StatelessWidget {
  final Surveys survey = new Surveys();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
      children: <Widget>[
        Text(
          "Lütfen doldurmak istediğiniz anketi seçin",
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.0),
        for (var i = 0; i < survey.surveys.length; i++)
          Container(
            child: ListTile(
                leading: Icon(
                  Icons.library_books,
                  size: 50.0,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: RaisedButton(
                  elevation: 5.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).secondaryHeaderColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SurveyScreen()));
                  },
                  child: Text("Anketi Seç"),
                ),
                title: Text(
                  survey.surveys[i],
                  style: TextStyle(fontSize: 25.0),
                )),
          ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton.icon(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                elevation: 7.0,
                icon: Icon(Icons.add),
                label: Text("Anket Ekle"),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
            RaisedButton.icon(
                padding: EdgeInsets.symmetric(horizontal: 53.0),
                elevation: 7.0,
                icon: Icon(Icons.delete),
                label: Text("Anket Sil"),
                onPressed: () {},
                color: Theme.of(context).errorColor,
                textColor: Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ],
        )
      ],
    );
  }
}
