import 'dart:convert';

import 'package:http/http.dart' as http;

class SAddressVM {
  String cityName = "";
  String districtName = "";
  String neighborhoodName = "";
  String streetName = "";
  String buildingName = "";
  int flatNumber = 0;

  SAddressVM(
      {this.cityName,
      this.buildingName,
      this.districtName,
      this.flatNumber,
      this.neighborhoodName,
      this.streetName});
}
