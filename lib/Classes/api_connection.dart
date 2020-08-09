import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConnection {
  Future<void> getCities(Map cities) async {
    var url = "http://10.0.2.2:60065/api/cities";
    final response = await http.get(url);
    final data = json.decode(response.body);
    data.forEach((element) {
      cities = {'id': element['id'], 'cityName': element['cityName']};
    });
    print(data);
    //cities = {'id': data.id, 'cityName': data.cityName};
    //data.forEach((cityName) {
    //  cities.add(cityName);
    //});
  }

  Future<void> getDistricts(int id, Map districts) async {
    var url = "http://10.0.2.2:60065/api/districts/$id";
    final response = await http.get(url);
    final data = json.decode(response.body);
    districts = {'id': data.id, 'districtName': data.districtName};
  }

  Future<void> getStreets(int id, Map streets) async {
    var url = "http://10.0.2.2:60065/api/streets/$id";
    final response = await http.get(url);
    final data = json.decode(response.body) as List;
  }

  Future<void> getNeighrborhoods(int id, Map neighrborhoods) async {
    var url = "http://10.0.2.2:60065/api/neighborhoods/$id";
    final response = await http.get(url);
    final data = json.decode(response.body) as List;
  }

  Future<void> getBuildings(int id, Map buildings) async {
    var url = "http://10.0.2.2:60065/api/buildings/$id";
    final response = await http.get(url);
    final data = json.decode(response.body) as List;
  }

  Future<void> getFlats(int id, Map flats) async {
    var url = "http://10.0.2.2:60065/api/flats/$id";
    final response = await http.get(url);
    final data = json.decode(response.body) as List;
  }
}
