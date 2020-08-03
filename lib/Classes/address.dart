import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Address {
  //Veritabanından çekilecek adreslerin depolanacağı map.
  List<Map<String, Object>> address = [
    {
      'addressText': 'City',
      'values': ['Ankara', 'İstanbul', 'İzmir']
    },
    {'addressText': 'District', 'values': []},
    {'addressText': 'Neighborhood', 'values': []},
    {'addressText': 'Street', 'values': []},
    {'addressText': 'Building', 'values': []},
    {'addressText': 'Flat', 'values': []}
  ];

  Address();

  void getCities(List<Object> cities) {
    var url = "https://localhost:44326/api/cities";
    final response = http.get(url);
    //cities = json.decode(response.body);
    print(response);
  }
}
