class Address {
  //Veritabanından çekilecek adreslerin depolanacağı map.
  /*List<Map<String, Object>> address = [
    {'addressText': 'City', 'values': []},
    {'addressText': 'District', 'values': []},
    {'addressText': 'Neighborhood', 'values': []},
    {'addressText': 'Street', 'values': []},
    {'addressText': 'Building', 'values': []},
    {'addressText': 'Flat', 'values': []}
  ];*/

  /* Map<String, Object> cities = {'id': [], 'values': []};
  Map<String, Object> districts = {'id': [], 'values': []};
  Map<String, Object> neighborhoods = {'id': [], 'values': []};
  Map<String, Object> streets = {'id': [], 'values': []};
  Map<String, Object> buildings = {'id': [], 'values': []};
  Map<String, Object> flats = {'id': [], 'values': []};
*/

  Map cities = {'id': [], 'cityName': []};
  Map districts = {};
  Map neighborhoods = {};
  Map streets = {};
  Map buildings = {};
  Map flats = {};

  Address();
}

//return cities;
