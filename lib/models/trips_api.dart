import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:http/http.dart' as http;

class TripApi{
  static const api = 'http://127.0.0.1:8000';

  static Future<Map<String, dynamic>> fetchTrip(String id) {
    return http.post(Uri.parse(apiAddress + '/api/v1/flight/flight-order-management/'), headers: {'Content-Type': 'application/json'}, body: jsonEncode({'id': id})).then((data) async{
      final jsonResult = await json.decode(data.body);
      
      return jsonResult;
    });
  }

  static Future<Map<String, dynamic>> removeTrip(String id) {
    return http.delete(Uri.parse(apiAddress + '/api/v1/flight/flight-order-remove/'), headers: {'Content-Type': 'application/json'}, body: jsonEncode({'id': id})).then((data) async{
      final jsonResult = await json.decode(data.body);
      
      return jsonResult;
    });
  }
}