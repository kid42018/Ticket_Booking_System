import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({
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

      // Duration d = Duration(minutes: arrTime.difference(depTime).inMinutes);
      // String durationHrs = '${d.inHours}H';
      // String durationMin = '${d.inMinutes.remainder(60)}M';


      String? duration = _
          .result[_.selectedIndex].itineraries![isReturn ? 1 : 0].segments![index].duration!
          .replaceAll(RegExp('PT'), '')
          .replaceAll(RegExp('H'), 'H ');

      // String durationHrs = duration.replaceAll('', replace);
      // String durationMin = '${d.inMinutes.remainder(60)}M';


      String? depIata = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![index].departure!.iataCode;
      String? arrIata = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
          .segments![index].arrival!.iataCode;
      late String depCity, arrCity;

      for (var item in _.cities) {
        if (depIata == item.iataCode) {
          depCity = item.city;
        }
        if (arrIata == item.iataCode) {
          arrCity = item.city;
        }
      }
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
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.w),
                  topLeft: Radius.circular(10.w)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(secondaryColor),
                  border:
                      const Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Row(
                    children: [
                      Text( '$depCity ', style: TextStyle(fontSize: 16.sp),),
                      Text( '($depIata)  ', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                      Text( ' to  $arrCity ', style: TextStyle(fontSize: 16.sp),),
                      Text( '($arrIata)', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                    ],
                  )
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
                      Text(flightNumber,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      Text(Get.find<PassengerController>().cabin, style: TextStyle(fontSize: 14.sp)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Table(
                        border: TableBorder(
                            horizontalInside:
                                BorderSide(width: 1.5.w, color: Colors.black12),
                            verticalInside:
                                BorderSide(width: 1.5.w, color: Colors.black12),
                            left: BorderSide(
                                width: 1.5.w, color: Colors.black12)),
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 5.h, bottom: 5.h),
                                child: Text('Departing',
                                    style: TextStyle(fontSize: 14.sp)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 5.h, bottom: 5.h),
                                child: Text('Arriving',
                                    style: TextStyle(fontSize: 14.sp)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 5.h, bottom: 5.h),
                                child: Text('Duration',
                                    style: TextStyle(fontSize: 14.sp)),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 10.h, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(DateFormat('hh:mm a').format(depTime).toString(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text(DateFormat('EEEE').format(depTime).toString(),
                                        style: TextStyle(fontSize: 14.sp)),
                                    Text(DateFormat('dd MMM').format(depTime).toString(),
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 10.h, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(DateFormat('hh:mm a').format(arrTime).toString(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text(DateFormat('EEEE').format(arrTime).toString(),
                                        style: TextStyle(fontSize: 14.sp)),
                                    Text(DateFormat('dd MMM').format(arrTime).toString(),
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 5.w, top: 10.h, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(duration,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)),
                                    // Text(durationMin,
                                    //     style: TextStyle(fontSize: 14.sp)),
                                    Text('Non-stop',
                                        style: TextStyle(fontSize: 14.sp)),
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
    });
  }
}
