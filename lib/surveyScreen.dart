import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Türksat Anket Sistemi",
        darkTheme: ThemeData.dark(),
        home: new SurveyPage());
  }
}

class SurveyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySurveyPage();
}

enum Answers1 { Evet, Hayir }

class _MySurveyPage extends State<SurveyPage> {
  Answers1 answers1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Türksat Anket Uygulaması")),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(14.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text("Evet"),
                  leading: Radio(
                      value: Answers1.Evet,
                      groupValue: answers1,
                      onChanged: (Answers1 value) {
                        setState(() {
                          answers1 = value;
                        });
                      }),
                ),
                ListTile(
                  title: Text("Hayır"),
                  leading: Radio(
                      value: Answers1.Hayir,
                      groupValue: answers1,
                      onChanged: (Answers1 value) {
                        setState(() {
                          answers1 = value;
                        });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
