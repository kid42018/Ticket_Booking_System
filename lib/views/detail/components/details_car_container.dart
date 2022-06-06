import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'small_widgets.dart';

class DetailsCardContainer extends StatelessWidget {
  const DetailsCardContainer({
    Key? key,
    required this.isReturn,
    required this.index,
  }) : super(key: key);

  final bool isReturn;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightController>(builder: (_) {
      String? carrierCode = _.result[_.selectedIndex]
          .itineraries![isReturn ? 1 : 0].segments![index].carrierCode;
      late String carrierName, carrierLogo;

      for (var item in _.airlinesList) {
        if (carrierCode == item.airlineCode) {
          carrierName = item.name;
          carrierLogo = item.logo;
        }
      }

      String? flightNumber =
          '$carrierCode${_.result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![index].number}';

      String? dt = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![index].departure!.at;
      String? at = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![index].arrival!.at;
      DateTime depTime = DateTime.parse(dt!);
      DateTime arrTime = DateTime.parse(at!);

      

      // String? d = _
      //     .result[index].itineraries![isReturn ? 1 : 0].segments![index].duration;

      String? duration = _
          .result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![index].duration!
          .replaceAll(RegExp('PT'), '')
          .replaceAll(RegExp('H'), 'H ');

      // String? duration = d!.replaceAll('PT', '').replaceAll('H', 'H ');

      String? depIata = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![index].departure!.iataCode;
      String? arrIata = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![index].arrival!.iataCode;
      late String depCity, arrCity;

      for (var item in _.cities) {
        if (depIata == item.iataCode) {
          depCity= item.city;
        }
        if (arrIata == item.iataCode){
          arrCity = item.city;
        }
      }
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
              border:
                  Border.all(color: Colors.black26, style: BorderStyle.solid)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(carrierName,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(flightNumber,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: Container(
                        height: 35.h,
                        width: 35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Image.network(carrierLogo, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, color: Colors.black26, height: 0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: Column(
                        children: [
                          Icon(Icons.circle,
                              size: 10.sp, color: Color(primaryColor)),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Container(
                                height: 50.h,
                                width: 1.5.w,
                                color: Color(primaryColor)),
                          ),
                          Icon(Icons.circle,
                              size: 10.sp, color: Color(primaryColor)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TimeCity(
                              timeCity: DateFormat('hh:mm, a').format(depTime).toString(), city: depCity),
                        ),
                        Container(
                            height: 1.h, width: 298.w, color: Colors.black26),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child:
                              TimeIcon(timeTotal: duration, isCard: true),
                        ),
                        Container(
                            height: 1.h, width: 298.w, color: Colors.black26),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TimeCity(
                              timeCity: DateFormat('hh:mm, a').format(arrTime).toString(), city: arrCity),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }
}
