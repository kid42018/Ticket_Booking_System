import 'package:final_project/constants.dart';
import 'package:final_project/controllers/order_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/main.dart';
import 'package:final_project/views/booking/components/price_summary.dart';
import 'package:final_project/views/booking/components/single_journey.dart';
import 'package:final_project/views/trips/components/terms_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ADD WILLPOPSCOPE
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Color(secondaryColor),
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Confirmation',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              print(Get.find<OrderController>().result.id);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              'Done',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
                primary: Colors.green[600],
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          )
        ],
      ),
      body: GetBuilder<OrderController>(builder: (_) {
        return _.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        size: 80.sp,
                        color: Colors.green,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          'Your Booking is Now \nConfirmed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Thank you, your booking refrence is ',
                                style: TextStyle(fontSize: 16.sp)),
                            Text(_.result.associatedRecords![0].reference!,
                                // _.result.associatedRecords![0].reference!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: const Divider(
                            height: 1, thickness: 1, color: Colors.black26),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Get.find<PassengerController>().isOneWay
                            ? const SingleJourney(isReturn: false)
                            : Column(
                                children: [
                                  const SingleJourney(isReturn: false),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: const SingleJourney(isReturn: true),
                                  ),
                                ],
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: const PriceSummary(),
                      ),
                      const TermsAndConditionsExpTile(),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            child: Text('Done',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(primaryColor),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
