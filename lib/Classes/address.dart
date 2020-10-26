import 'dart:async';
import 'dart:convert';

import 'package:turksat_survey/ViewModels/BuildingVM.dart';
import 'package:turksat_survey/ViewModels/CityVM.dart';

import 'package:http/http.dart' as http;
import 'package:turksat_survey/ViewModels/DistrictVM.dart';
import 'package:turksat_survey/ViewModels/FlatVM.dart';
import 'package:turksat_survey/ViewModels/NeighborhoodVM.dart';
import 'package:turksat_survey/ViewModels/SAddressVM.dart';
import 'package:turksat_survey/ViewModels/StreetVM.dart';

//DB den çekilen adres verilerinin tutulduğu listeler
class Address {
  int id;
  List<CityVM> cities = [];
  List<DistrictVM> districts = [];
  List<NeighborhoodVM> neighborhoods = [];
  List<StreetVM> streets = [];
  List<BuildingVM> buildings = [];
  List<FlatVM> flats = [];
  SAddressVM sAddress = SAddressVM();

  Address();
  //Get Requests
  Future<void> getCities() async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/cities";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<CityVM> tempList = [];
      data.forEach((a) {
        tempList.add(CityVM(id: a['id'], cityName: a['cityName']));
      });
      cities = tempList;
    } catch (error) {
      print(error);
    }
  }

  Future<void> getDistricts(int id) async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/districts/$id";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<DistrictVM> tempList1 = [];
      data.forEach((district) {
        tempList1.add(DistrictVM(
            id: district['id'], districtName: district['districtName']));
      });
      districts = tempList1;
    } catch (error) {
      print(error);
    }
  }

  Future<void> getStreets(int id) async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/streets/$id";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<StreetVM> tempList2 = [];
      data.forEach((street) {
        tempList2
            .add(StreetVM(id: street['id'], streetName: street['streetName']));
      });
      streets = tempList2;
    } catch (error) {
      print(error);
    }
  }

  Future<void> getBuildings(int id) async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/buildings/$id";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<BuildingVM> tempList3 = [];
      data.forEach((building) {
        tempList3.add(BuildingVM(
            id: building['id'], buildingName: building['buildingName']));
      });
      buildings = tempList3;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getFlats(int id) async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/flats/$id";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<FlatVM> tempList4 = [];
      data.forEach((flat) {
        tempList4.add(FlatVM(flatName: flat));
      });
      flats = tempList4;
    } catch (e) {}
  }

  Future<void> getNeighborhoods(int id) async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/neighborhoods/$id";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<NeighborhoodVM> tempList5 = [];
      data.forEach((neighborhood) {
        tempList5.add(NeighborhoodVM(
            id: neighborhood['id'],
            neighborhoodName: neighborhood['neighborhoodName']));
      });
      neighborhoods = tempList5;
    } catch (e) {
      print("error");
    }
  }

//Insert Address
  Future<void> insertAddress(SAddressVM addressVM) async {
    try {
      const url =
          "https://turksatsurvey.azurewebsites.net/api/surveyaddresses/";
      await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'CityName': addressVM.cityName,
            'DistrictName': addressVM.districtName,
            'NeighborhoodName': addressVM.neighborhoodName,
            'StreetName': addressVM.streetName,
            'BuildingName': addressVM.buildingName,
            'FlatNumber': addressVM.flatNumber
          }));
    } catch (e) {
      print("error");
    }
  }

//Get id of existing address
  Future<void> getID() async {
    try {
      var url = "https://turksatsurvey.azurewebsites.net/api/surveyaddresses";
      final response = await http.get(url);
      final data = json.decode(response.body);
      id = data;
    } catch (e) {
      print("error");
    }
  }
}
