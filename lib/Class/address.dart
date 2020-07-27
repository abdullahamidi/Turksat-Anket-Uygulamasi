import 'package:flutter/material.dart';

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
}
