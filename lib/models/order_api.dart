import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:final_project/models/travelers.dart';
import 'package:http/http.dart' as http;

class OrderApi{
  // static var client = http.Client();

  static const api = 'http://127.0.0.1:8000';

  static Future<Map<String, dynamic>> fetchOrder(TravelersClass search) {
    return http.post(Uri.parse(apiAddress + '/api/v1/flight/flight-create-order/'),headers: {'Content-Type': 'application/json'}, body: jsonEncode(search.toJson())).then((data) async{
      final jsonResult = await json.decode(data.body);
      
      return jsonResult;
    });
  }

  // static Future<Map<String, dynamic>> fetchOrder(String search) {
  //   return http.post(Uri.parse(apiAddress + '/api/v1/flight/flight-create-order/'),headers: {'Content-Type': 'application/json'}, body: search).then((data) async{
  //     final jsonResult = await json.decode(data.body);
      
  //     return jsonResult;
  //   });
  // }
}