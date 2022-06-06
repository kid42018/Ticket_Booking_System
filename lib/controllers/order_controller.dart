import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/models/order.dart';
import 'package:final_project/models/order_api.dart';
import 'package:final_project/models/price_details.dart';
import 'package:final_project/models/travelers.dart';
import 'package:final_project/models/trips.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'date_controller.dart';
import 'trips_controller.dart';

class OrderController extends GetxController {
  var bookParams;

  void getParams(TravelersClass newParams) {
    bookParams = newParams;
    update();
  }

  var isLoading = true;
  late Map<String, dynamic> newOrder;

  late FlightOrder result;
  late PriceDetails price;

  void fetchOrder() async {
    try {
      isLoading = true;
      var order = await OrderApi.fetchOrder(bookParams);
      if (order != null) {
        newOrder = order;
        result = FlightOrder.fromJson(order['data']);
        price = PriceDetails.fromJson(order['data']['flightOffers'][0]);

        Get.find<TripsController>().addTrip(
          TripsCardModel(
            id: result.id,
            reference: result.associatedRecords![0].reference,
            originIata: Get.find<PassengerController>().originAirport!.iataCode,
            originCity: Get.find<PassengerController>().originAirport!.city,
            destinationIata: Get.find<PassengerController>().destinationAirport!.iataCode,
            destinationCity: Get.find<PassengerController>().destinationAirport!.city,
            departureDate: Get.find<DateController>().departDate,
            returnDate: Get.find<DateController>().returnDate,
            bookingTime: DateTime.now(),
            isOneWay: Get.find<PassengerController>().isOneWay,
          )
        );
      }
    }catch(e){
      print('$e ----');
    }
     finally {
      isLoading = false;
    }
    update();
  }
}

// print(Get.find<OrderController>().result.id);

// TripsCardModel tr = TripsCardModel(id:'2', originCity: 'addis');
// Get.find<TripsController>().addTrip(tr);
// print(Get.find<TripsController>().tripsBox.read('trips')[0].reference);