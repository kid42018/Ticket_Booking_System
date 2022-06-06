import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightDetailsTable extends StatelessWidget {
  const FlightDetailsTable({
    Key? key, required this.isReturn, required this.index,
  }) : super(key: key);

  final bool isReturn;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripsController>(
      builder: (_) {
        String? carrierCode = _.result.flightOffers![0]
          .itineraries![isReturn ? 1 : 0].segments![index].carrierCode;
      // late String carrierName, carrierLogo;

      // for (var item in _.airlinesList) {
      //   if (carrierCode == item.airlineCode) {
      //     carrierName = item.name;
      //     carrierLogo = item.logo;
      //   }
      // }

      String? flightNumber =
          '$carrierCode${_.result.flightOffers![0].itineraries![isReturn ? 1 : 0].segments![index].number}';

      String? dt = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
          .segments![index].departure!.at;
      String? at = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
          .segments![index].arrival!.at;
      DateTime depTime = DateTime.parse(dt!);
      DateTime arrTime = DateTime.parse(at!);

      String? depIata = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
          .segments![index].departure!.iataCode;
      String? arrIata = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
          .segments![index].arrival!.iataCode;

      String? cabin = _.result.flightOffers![0].travelerPricings![0].fareDetailsBySegment![index].cabin;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.white,
            border: Border.all(color: Colors.black26),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.w),topLeft: Radius.circular(10.w)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(secondaryColor),
                    border:
                        const Border(bottom: BorderSide(color: Colors.black12)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Text('$depIata to $arrIata',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // Container(
                        //   width: 35.w,
                        //   height: 35.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.amber,
                        //   ),
                        // ),
                        Text('$flightNumber',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp)),
                        Text(cabin!, style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder(
                              horizontalInside: BorderSide(
                                  width: 1.5.w, color: Colors.black12),
                              verticalInside: BorderSide(
                                  width: 1.5.w, color: Colors.black12),
                              left: BorderSide(
                                  width: 1.5.w, color: Colors.black12)),
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 5.h, bottom: 5.h),
                                  child: Text('Departing', style: TextStyle(fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 5.h, bottom: 5.h),
                                  child: Text('Arriving', style: TextStyle(fontSize: 14.sp)),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(DateFormat('hh:mm a').format(depTime).toString(), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                      Text(DateFormat('EEE').format(depTime).toString(), style: TextStyle(fontSize: 14.sp)),
                                      Text(DateFormat('dd MMM').format(depTime).toString(), style: TextStyle(fontSize: 14.sp)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(DateFormat('hh:mm a').format(arrTime).toString(), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                      Text(DateFormat('EEE').format(arrTime).toString(), style: TextStyle(fontSize: 14.sp)),
                                      Text(DateFormat('dd MMM').format(arrTime).toString(), style: TextStyle(fontSize: 14.sp)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}