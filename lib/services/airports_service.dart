import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:final_project/models/airport.dart';
import 'package:final_project/models/airports_api.dart';
import 'package:http/http.dart' as http;

class AirportsService {
  static const api = 'http://127.0.0.1:8000';
  // static const api = 'http://0.0.0.0:8000';

  Future<AirportsApi<List<Airport>>> getAirportsList() {
    return http.get(Uri.parse(apiAddress + '/api/v1/flight/airports/')).then((data) {
      final jsonData = json.decode(data.body);
      final airports = <Airport>[];
      for (var item in jsonData) {
        final airport = Airport(
            id: item['id'],
            name: item['name'],
            city: item['city'],
            country: item['country'],
            iataCode: item['iata_code']);
        airports.add(airport);
      }
      return AirportsApi<List<Airport>>(data: airports);
    });
  }
}
