import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/controllers/date_controller.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/models/flight_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Get.find<PassengerController>().isOneWay
            ? Column(
                children: [
                  CardDetails(index: index, isReturn: false),
                  CardBottom(index: index)
                ],
              )
            : Column(
                children: [
                  CardDetails(index: index, isReturn: false),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CardDetails(index: index, isReturn: true),
                  ),
                  CardBottom(index: index)
                ],
              ),
      ),
    );
  }
}

class LineDesign extends StatelessWidget {
  const LineDesign({
    Key? key,
    required this.stop,
  }) : super(key: key);

  final int stop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.airplanemode_active,
              size: 16.sp,
              color: Color(primaryColor),
            )),
        if (stop == 0) ...[
          straightLine(200)
        ] else if (stop == 1) ...[
          straightLine(95),
          circle(false),
          straightLine(95),
        ] else if (stop == 2) ...[
          straightLine(85),
          circle(false),
          straightLine(10),
          circle(false),
          straightLine(85)
        ] else ...[
          straightLine(75),
          circle(false),
          straightLine(10),
          circle(false),
          straightLine(10),
          circle(false),
          straightLine(75)
        ],
        circle(true)
      ],
    );
  }

  Container circle(bool isSolid) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: isSolid
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(primaryColor),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(color: Color(primaryColor))),
    );
  }

  Container straightLine(double wid) {
    return Container(
      width: wid.w,
      height: 1.5.h,
      color: Color(primaryColor),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key, required this.isReturn, required this.index})
      : super(key: key);

  final bool isReturn;
  final int index;

  @override
  Widget build(BuildContext context) {
    var pc = Get.find<PassengerController>();
    // var dc = Get.find<DateController>();
    return GetBuilder<FlightController>(builder: (_) {
      int stops =
          _.result[index].itineraries![isReturn ? 1 : 0].segments!.length - 1;
      String? duration = _
          .result[index].itineraries![isReturn ? 1 : 0].duration!
          .replaceAll(RegExp('PT'), '')
          .replaceAll(RegExp('H'), 'H ');

      String? dt = _.result[index].itineraries![isReturn ? 1 : 0].segments![0]
          .departure!.at;
      String? at = _.result[index].itineraries![isReturn ? 1 : 0]
          .segments![stops].arrival!.at;
      DateTime depTime = DateTime.parse(dt!);
      DateTime arrTime = DateTime.parse(at!);

      String? oriIata = _.result[index].itineraries![isReturn ? 1 : 0].segments![0]
          .departure!.iataCode;
      String? desIata = _.result[index].itineraries![isReturn ? 1 : 0].segments![stops]
          .arrival!.iataCode;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 35.w,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    oriIata!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ),
                LineDesign(stop: stops),
                Container(
                  width: 35.w,
                  alignment: Alignment.centerRight,
                  child: Text(
                    desIata!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isReturn
                            ? pc.destinationAirport!.city
                            : pc.originAirport!.city,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.black54),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            duration,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black45),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              stops == 0 ? 'Non Stop' : '${stops} Stop',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        isReturn
                            ? pc.originAirport!.city
                            : pc.destinationAirport!.city,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.black54),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // '9:00 AM' 'hh:mm, a',
                    DateFormat('HH:mm').format(depTime).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  Text(
                    DateFormat('dd MMM, EEE').format(depTime).toString(),
                    // depTime!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black45),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('HH:mm').format(arrTime).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  Text(
                    DateFormat('dd MMM, EEE').format(arrTime).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black45),
                  )
                ],
              )
            ],
          ),
        ],
      );
    });
  }
}

class CardBottom extends StatelessWidget {
  const CardBottom({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GetBuilder<FlightController>(builder: (_) {
        // var gt = double.parse(_.result[index].price!.grandTotal!);
        // var total = NumberFormat.gt(locale: "en_US",symbol: "");
        String? price =
            '${_.result[index].price!.currency} ${_.result[index].price!.grandTotal}';
        String? carrierCode =
            _.result[index].itineraries![0].segments![0].carrierCode;

        late String carrierName, carrierLogo;

        for (var item in _.airlinesList) {
          if (carrierCode == item.airlineCode) {
            carrierName = item.name;
            carrierLogo = item.logo;
          }
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(
                color: Color(primaryColor),
                height: 1,
                thickness: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // CachedNetworkImage(
                    //   imageUrl: 'https://picsum.photos/250?image=9',
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        child: Image.network(carrierLogo, fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(carrierName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
