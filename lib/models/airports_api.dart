import 'dart:convert';

import 'package:http/http.dart' as http;

import 'flight_result.dart';

class AirportsApi<T>{
  final T data;
  // final bool error;
  // final String errorMessage;

  AirportsApi({required this.data});
}

// class FlightApi{
//   // static var client = http.Client();

//   static const api = 'http://127.0.0.1:8000';

//   static Future<List> fetchAirports(SearchFlight sea) {
//     return http.get(Uri.parse(api + '/api/v1/flight/airports/')).then((data) async{
//       final jsonResult = await json.decode(data.body);
      
//       return jsonResult;
//     });
//   }
// }