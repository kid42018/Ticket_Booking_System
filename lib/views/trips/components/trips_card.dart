import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:final_project/models/trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TripsCard extends StatelessWidget {
  TripsCard({
    Key? key, required this.index,
  }) : super(key: key);

  final int index;

  final TripsController settingsCont = Get.put(TripsController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<TripsController>(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Booking Reference: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: jsonDecode(_.tripsBox.read('trips'))[index]['reference'],
                                  style:
                                      TextStyle(color: Color(primaryColor)),
                                ),
                              ]),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 14.sp)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Divider(
                        color: Color(primaryColor), height: 1, thickness: 1),
                  ),
                  // Text('Abebe Kebede',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold, fontSize: 16.sp)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(jsonDecode(_.tripsBox.read('trips'))[index]['originIata'], style: TextStyle(fontSize: 20.sp)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Text(jsonDecode(_.tripsBox.read('trips'))[index]['originCity'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Text(DateFormat('E, dd MMM, yyyy').format(DateTime.parse(jsonDecode(_.tripsBox.read('trips'))[index]['departureDate'])),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        color: Colors.black45)),
                              )
                            ],
                          ),
                        ),
                        jsonDecode(_.tripsBox.read('trips'))[index]['isOneWay'] ? Icon(Icons.arrow_right_alt, size: 40.sp, color: Color(primaryColor)) : Icon(Icons.swap_horiz, size: 40.sp, color: Color(primaryColor)),
                        Container(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(jsonDecode(_.tripsBox.read('trips'))[index]['destinationIata'], style: TextStyle(fontSize: 20.sp)),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Text(jsonDecode(_.tripsBox.read('trips'))[index]['destinationCity'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: jsonDecode(_.tripsBox.read('trips'))[index]['isOneWay'] ? Container() : Text(DateFormat('E, dd MMM, yyyy').format(DateTime.parse(jsonDecode(_.tripsBox.read('trips'))[index]['returnDate'])),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        color: Colors.black45)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.h),
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Text(
                  //       'ETB 12,500',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18.sp,
                  //           color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Divider(
                        color: Color(primaryColor), height: 1, thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booked : ${DateFormat('dd MMM, yyyy').format(DateTime.parse(jsonDecode(_.tripsBox.read('trips'))[index]['bookingTime']))}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp)),
                        Container(
                          height: 20.h,
                          width: 1.w,
                          color: Color(primaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            // _.getParams(jsonDecode(_.tripsBox.read('trips'))[index]['id']);
                            // _.fetchTrip();
                            // _.isLoading ? print('loading') : print(_.result.associatedRecords![0].reference);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Remove Flight'),
                              Icon(Icons.close, size: 18.sp)
                            ],
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            fixedSize: Size(125.w, 20.h)
                          )
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
      );
  }
}