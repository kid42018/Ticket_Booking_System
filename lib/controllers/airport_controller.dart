// import 'package:final_project/models/airport.dart';
// import 'package:final_project/models/airports_api.dart';
// import 'package:get/state_manager.dart';

// class AirportController extends GetxController{
//   @override
//   void onInit() {
//     fetchAirports();
//     super.onInit();
//   }

//   var airportList = [];

//   bool isLoading = true;

//   void fetchAirports() async {
//     try {
//       isLoading = true;
//       var airports = await AirportsApi.fetchAirports();
//       if (airports != null) {
//         airports.clear();
//         for (var item in airports) {
//           final airport = Airport(
//               id: item['id'],
//               name: item['name'],
//               city: item['city'],
//               country: item['country'],
//               iataCode: item['iata_code']);
//           airportList.add(airport);
//         }
//       }
//     } finally {
//       isLoading = false;
//     }
//     update();
//   }
// }