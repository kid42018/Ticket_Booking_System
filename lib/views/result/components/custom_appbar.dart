import 'package:final_project/constants.dart';
import 'package:final_project/controllers/date_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pc = Get.find<PassengerController>();
    return AppBar(
      backgroundColor: Color(secondaryColor),
      foregroundColor: Colors.black,
      elevation: 1,
      toolbarHeight: 60.h,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        splashRadius: 25.w,
        padding: EdgeInsets.zero,
      ),
      title: Text(
          '${pc.originAirport!.city} - ${pc.destinationAirport!.city}',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h), child: const AppBarBottom()),
    );
  }
}

class AppBarBottom extends StatelessWidget {
  const AppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dc = Get.find<DateController>();
    var pc = Get.find<PassengerController>();
    int passengers = pc.adult + pc.child + pc.infant;

    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.event_rounded, size: 18.sp),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      pc.isOneWay
                          ? DateFormat('dd MMM')
                              .format(dc.departDate)
                              .toString()
                          : '${DateFormat('dd MMM').format(dc.departDate).toString()} - ${DateFormat('dd MMM').format(dc.returnDate).toString()}',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Container(
                      height: 30,
                      width: 1.5,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.people, size: 18.sp),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      passengers.toString(),
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: Container(
                      height: 30,
                      width: 1.5,
                      color: Colors.black45,
                    ),
                  ),
                  Icon(Icons.airline_seat_recline_extra, size: 18.sp),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      pc.cabin,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}