import 'dart:convert';

import 'package:final_project/models/flight_result.dart';
import 'package:final_project/models/trips.dart';
import 'package:final_project/models/trips_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TripsController extends GetxController {
  final tripsBox = GetStorage('trips');

  List<TripsCardModel> trips = [];

  void addTrip(TripsCardModel newTrip){
    // trips = tripsBox.read(jsonDecode('trips'));
    trips.add(newTrip);
    tripsBox.write('trips', jsonEncode(trips));
    update();
  }

  late String id;

  void getParams(String newId) {
    id = newId;
    update();
  }

  var isLoading = true;

  var airlinesList = [];

  late TripsDetailModel result;

  void fetchTrip() async {
    try {
      isLoading = true;
      var trip = await TripApi.fetchTrip(id);
      if (trip != null) {
        result = TripsDetailModel.fromJson(trip['data']);

        // airlinesList.clear();
        // for (var item in trip[1]['airline_details']) {
        //   final airline = Airlines(
        //     airlineCode: item['airline_code'],
        //     name: item['name'],
        //     logo: item['logo'],
        //   );
        //   airlinesList.add(airline);
        // }
      }
    } finally {
      isLoading = false;
    }
    update();
  }

  void removeTrip(TripsCardModel newTrip){
    // // trips = tripsBox.read(jsonDecode('trips'));
    // trips.add(newTrip);
    // tripsBox.write('trips', jsonEncode(trips));
    update();
  }
}