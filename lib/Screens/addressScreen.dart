import 'package:flutter/material.dart';
import 'package:turksat_survey/Widgets/AddressDDB.dart';
import 'package:turksat_survey/Classes/address.dart';

Address address = new Address();

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Türksat Anket Uygulaması")),
            body: Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                          children: groupedAddress.map((data) {
                        //return Text('${data['addressText']} ${data['values']}');
                        return AddressDDB(data['addressText'], data['values']);
                      }).toList()),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 75),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("Adresi Kaydet")),
                    ]))));
  }
}

List<Map<String, Object>> get groupedAddress {
  return List.generate(6, (index) {
    return {
      'addressText': address.address[index]['addressText'],
      'values': address.address[index]['values']
    };
  });
}
