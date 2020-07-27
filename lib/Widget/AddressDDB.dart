import 'package:flutter/material.dart';
import 'package:turksat_survey/Class/address.dart';
import 'package:turksat_survey/addressScreen.dart';

class AddressDDB extends StatefulWidget {
  String text;
  List<Object> values;
  AddressDDB(this.text, this.values);
  @override
  State<StatefulWidget> createState() => MyAddressDDB(text, values);
}

class MyAddressDDB extends State<AddressDDB> {
  String text;
  List<Object> values;
  String selectedText;

  MyAddressDDB(String text, List<Object> values) {
    this.text = text;
    this.values = values;
  }

  @override
  Widget build(BuildContext context) {
    //ddbleri buraya taşı

    return Column(
      children: <Widget>[
        //active fonksiyonu oluştur üstteki girilen parametre seçili değil ise inactive olsun.
        DropdownButton(
            isExpanded: true,
            hint: Text("$text Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items: values.map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              selectedText = newText;
              setState(() {});
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText)
      ],
    );
  }
}
