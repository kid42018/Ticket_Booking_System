import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'details_car_container.dart';
import 'small_widgets.dart';
import 'package:intl/intl.dart';

class OneTrip extends StatelessWidget {
  const OneTrip({
    Key? key,
    required this.isReturn,
  }) : super(key: key);

  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    var passCont = Get.find<PassengerController>();
    return GetBuilder<FlightController>(builder: (_) {
      int stop = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
              .segments!.length-1;
              
      String? dt = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![0].departure!.at;
      // String? at = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![stop].arrival!.at;
      DateTime depTime = DateTime.parse(dt!);
      // DateTime arrTime = DateTime.parse(at!);

      List connection = [];

      for(int i=0; i<stop; i++){
        String? aT = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![i].arrival!.at;
        String? dT = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![i+1].departure!.at;

        DateTime arr = DateTime.parse(aT!);
        DateTime dep = DateTime.parse(dT!);

        Duration conn = Duration(minutes: dep.difference(arr).inMinutes);
        String dur = '${conn.inHours}H ${conn.inMinutes.remainder(60)}M';

        connection.add(dur);
      }

      String? duration = _
          .result[_.selectedIndex].itineraries![isReturn ? 1 : 0].duration!
          .replaceAll(RegExp('PT'), '')
          .replaceAll(RegExp('H'), 'H ');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: OriginDestination(
                origin: isReturn
                    ? passCont.destinationAirport!.city
                    : passCont.originAirport!.city,
                destination: isReturn
                    ? passCont.originAirport!.city
                    : passCont.destinationAirport!.city),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: DateDisplay(dateToShow: DateFormat('EEEE, MMMM dd').format(depTime).toString()),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 10.w),
            child: Row(
              children: [
                TimeIcon(timeTotal: duration, isCard: false),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: StopDisplay(stop: stop),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stop+1,
              itemBuilder: (_, index) => DetailsCardContainer(isReturn: isReturn, index: index),
              separatorBuilder: (_, __) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(
                  children: [
                    TimeIcon(timeTotal: connection[__].toString(), isCard: false),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text('Connection in airport',
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
