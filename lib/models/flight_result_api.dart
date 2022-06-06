import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:http/http.dart' as http;

import 'flight_result.dart';

class FlightApi{
  // static var client = http.Client();

  static const api = 'http://127.0.0.1:8000';

  static Future<List> fetchFlights(SearchFlight sea) {
    return http.post(Uri.parse(apiAddress + '/api/v1/flight/flight-offers/'), body: sea.toJson()).then((data) async{
      final jsonResult = await json.decode(data.body);
      
      return jsonResult;
    });
  }
}