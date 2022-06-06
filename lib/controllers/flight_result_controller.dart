import 'package:final_project/models/airport.dart';
import 'package:final_project/models/flight_result.dart';
import 'package:final_project/models/flight_result_api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FlightController extends GetxController {
  var searchParams;

  void getParams(SearchFlight newParams) {
    searchParams = newParams;
    update();
  }

  var isLoading = true;

  var airlinesList = [];

  var flightList = <String, dynamic>{};
  final result = <FlightResult>[];

  late int selectedIndex;

  void fetchFlights() async {
    try {
      isLoading = true;
      var flights = await FlightApi.fetchFlights(searchParams);
      if (flights != null) {
        flightList = flights[0];
        result.clear();
        for (var item in flights[0]['data']) {
          result.add(FlightResult.fromJson(item));
          update();
        }

        airlinesList.clear();
        for (var item in flights[1]['airline_details']) {
          final airline = Airlines(
            airlineCode: item['airline_code'],
            name: item['name'],
            logo: item['logo'],
          );
          airlinesList.add(airline);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    update();
  }

  void clearSearch(){
    airlinesList.clear();
    flightList.clear();
    result.clear();
    selectedIndex = 0;

    update();
  }

  void selectFlight(int newIndex) {
    selectedIndex = newIndex;
    update();
  }

  var cities = [];
  void selectCities(List newCities) {
    cities = newCities;
    update();
  }
}
