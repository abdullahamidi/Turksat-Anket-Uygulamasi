import 'package:flutter/material.dart';
import 'package:turksat_survey/Classes/address.dart';
import 'package:turksat_survey/Screens/SurveySelectScreen.dart';
import 'package:turksat_survey/ViewModels/SAddressVM.dart';
import 'package:turksat_survey/ViewModels/UserAnswersVM.dart';

class AddressDDB extends StatefulWidget {
  UserAnswersVM userAnswers;
  AddressDDB(this.userAnswers);
  @override
  State<StatefulWidget> createState() => MyAddressDDB(userAnswers);
}

class MyAddressDDB extends State<AddressDDB> {
  bool _isLoading = true;
  Address address = Address();
  UserAnswersVM userAnswers;
  String selectedCity;
  String selectedDistrict;
  String selectedNeighborhood;
  String selectedStreet;
  String selectedBuilding;
  SAddressVM sAddressVM;
  int selectedFlat;
  int cityId;
  int districtId;
  int neighborhoodId;
  int streetId;
  int buildingId;
  int flatId;

  MyAddressDDB(this.userAnswers);

  @override
  void initState() {
    address.getCities().then((_) {
      setState(() {
        _isLoading = false;
      });
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("İl Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.cities
                          .map((map) => DropdownMenuItem(
                                child: Text(map.cityName),
                                value: map.cityName,
                                onTap: () {
                                  selectedCity = map.cityName;
                                  cityId = map.id;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        _isLoading = true;
                        if (selectedDistrict != null) {
                          selectedDistrict = null;
                          selectedNeighborhood = null;
                          selectedStreet = null;
                          selectedBuilding = null;
                          selectedFlat = null;

                          address.districts = [];
                          address.neighborhoods = [];
                          address.streets = [];
                          address.buildings = [];
                          address.flats = [];

                          districtId = null;
                          neighborhoodId = null;
                          streetId = null;
                          buildingId = null;
                          flatId = null;
                        }
                        address.getDistricts(cityId).then((_) {
                          setState(() {
                            selectedCity = newText;
                            _isLoading = false;
                          });
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: selectedCity),
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("İlçe Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.districts
                          .map((txt) => DropdownMenuItem(
                                child: Text(txt.districtName),
                                value: txt.id,
                                onTap: () {
                                  selectedDistrict = txt.districtName;
                                  districtId = txt.id;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        if (selectedNeighborhood != null) {
                          selectedNeighborhood = null;
                          selectedStreet = null;
                          selectedBuilding = null;
                          selectedFlat = null;

                          address.neighborhoods = [];
                          address.streets = [];
                          address.buildings = [];
                          address.flats = [];

                          neighborhoodId = null;
                          streetId = null;
                          buildingId = null;
                          flatId = null;
                        }
                        address.getNeighborhoods(districtId).then((_) {
                          setState(() {});
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: districtId),
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("Mahalle Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.neighborhoods
                          .map((txt) => DropdownMenuItem(
                                child: Text(txt.neighborhoodName),
                                value: txt.id,
                                onTap: () {
                                  selectedNeighborhood = txt.neighborhoodName;
                                  neighborhoodId = txt.id;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        if (selectedStreet != null) {
                          selectedStreet = null;
                          selectedBuilding = null;
                          selectedFlat = null;

                          address.streets = [];
                          address.buildings = [];
                          address.flats = [];

                          streetId = null;
                          buildingId = null;
                          flatId = null;
                        }
                        address.getStreets(neighborhoodId).then((_) {
                          setState(() {});
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: neighborhoodId),
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("Cadde/Sokak Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.streets
                          .map((txt) => DropdownMenuItem(
                                child: Text(txt.streetName),
                                value: txt.id,
                                onTap: () {
                                  selectedStreet = txt.streetName;
                                  streetId = txt.id;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        if (selectedBuilding != null) {
                          selectedBuilding = null;
                          selectedFlat = null;

                          address.buildings = [];
                          address.flats = [];

                          buildingId = null;
                          flatId = null;
                        }
                        address.getBuildings(streetId).then((_) {
                          setState(() {});
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: streetId),
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("Apartman Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.buildings
                          .map((txt) => DropdownMenuItem(
                                child: Text(txt.buildingName),
                                value: txt.id,
                                onTap: () {
                                  selectedBuilding = txt.buildingName;
                                  buildingId = txt.id;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        if (selectedFlat != null) {
                          selectedFlat = null;

                          address.flats = [];

                          flatId = null;
                        }
                        address.getFlats(buildingId).then((_) {
                          setState(() {});
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: buildingId),
                  DropdownButton(
                      isExpanded: true,
                      hint: Text("Daire Numarası Seçiniz"),
                      underline: Container(color: Colors.blue, height: 2.5),
                      iconEnabledColor: Colors.blue,
                      items: address.flats
                          .map((txt) => DropdownMenuItem(
                                child: Text(txt.flatName.toString()),
                                value: txt.flatName,
                                onTap: () {
                                  selectedFlat = txt.flatName;
                                },
                              ))
                          .toList(),
                      onChanged: (newText) {
                        setState(() {
                          sAddressVM = SAddressVM(
                              cityName: selectedCity,
                              districtName: selectedDistrict,
                              neighborhoodName: selectedNeighborhood,
                              buildingName: selectedBuilding,
                              streetName: selectedStreet,
                              flatNumber: selectedFlat);
                        });
                      },
                      elevation: 24,
                      dropdownColor: Colors.grey[150],
                      value: selectedFlat),
                  RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 6),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: sAddressVM == null
                          ? null
                          : () {
                              _isLoading = true;
                              address.insertAddress(sAddressVM).then((_) {
                                setState(() {
                                  address.getID().then((value) {
                                    setState(() {
                                      userAnswers.addressID = address.id;
                                    });
                                  });
                                  _isLoading = false;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          SurveySelect(userAnswers)));
                                });
                              });
                            },
                      child: Text("Adresi Kaydet")),
                ],
              )
      ],
    );
  }
}
