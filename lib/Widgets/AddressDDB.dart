import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/address.dart';
import 'package:turksat_survey/Screens/addressScreen.dart';
import 'package:turksat_survey/Classes/api_connection.dart';

class AddressDDB extends StatefulWidget {
  final Address address = new Address();
  final String text;
  //final List<Object> values;
  AddressDDB(
    this.text,
    /*this.values*/
  );
  @override
  State<StatefulWidget> createState() => MyAddressDDB(
        text, /*values*/
      );
}

class MyAddressDDB extends State<AddressDDB> {
  String text;
  List values;
  String selectedText;

  MyAddressDDB(
    String text,
    /*List values*/
  ) {
    this.text = text;
    //this.values = values;
  }

  @override
  Widget build(BuildContext context) {
    //fill.getDistricts(address.districts);
    //fill.getNeighrborhoods(address.neighborhoods);
    //fill.getStreets(address.streets);
    //fill.getBuildings(address.buildings);
    //fill.getFlats(address.flats);
    //ddbleri buraya taşı

    return Column(
      children: <Widget>[
        //active fonksiyonu oluştur üstteki girilen parametre seçili değil ise inactive olsun.
        DropdownButton(
            isExpanded: true,
            hint: Text("İl Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items:
                address.cities['cityName'].map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem<String>(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),
        /*DropdownButton(
            isExpanded: true,
            hint: Text("İlçe Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items: address.districts['districtName']
                .map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),
        DropdownButton(
            isExpanded: true,
            hint: Text("Mahalle Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items: address.neighborhoods['neighborhoodName']
                .map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),
        DropdownButton(
            isExpanded: true,
            hint: Text("Cadde/Sokak Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items: address.streets['streetName']
                .map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),
        DropdownButton(
            isExpanded: true,
            hint: Text("Apartman Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items: address.buildings['buildingName']
                .map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),
        DropdownButton(
            isExpanded: true,
            hint: Text("Daire Numarası Seçiniz"),
            underline: Container(color: Colors.blue, height: 2.5),
            style: TextStyle(color: Colors.black54, fontSize: 25.0),
            iconEnabledColor: Colors.blue,
            items:
                address.flats['flatName'].map<DropdownMenuItem<String>>((txt) {
              return DropdownMenuItem(child: new Text(txt), value: txt);
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedText = newText;
              });
            },
            elevation: 24,
            dropdownColor: Colors.grey[150],
            value: selectedText),*/
      ],
    );
  }
}
