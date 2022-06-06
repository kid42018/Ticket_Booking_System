import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/views/passengerForm/passenger_form.dart';
import 'package:final_project/views/result/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/one_trip.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var flightCont = Get.find<FlightController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Get.find<PassengerController>().isOneWay
                  ? const OneTrip(isReturn: false)
                  : Column(
                      children: [
                        const OneTrip(isReturn: false),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: const OneTrip(isReturn: true),
                        ),
                      ],
                    ),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.w),
                  border: Border.all(color: Colors.black26)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${flightCont.result[flightCont.selectedIndex].price!.currency} ${flightCont.result[flightCont.selectedIndex].price!.grandTotal}',
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PassengerForm()));
                      },
                      child: Text('Proceed', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(primaryColor),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                        fixedSize: Size(140.w, 45.h),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w))
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
