import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:final_project/views/trips/trip_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/trips_card.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTrip = jsonDecode(Get.find<TripsController>().tripsBox.read('trips')).length != 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Color(secondaryColor),
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text('My Trips',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold)),
        ),
      ),
      body: isTrip == true
          ? SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GetBuilder<TripsController>(
                    builder: (_) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonDecode(Get.find<TripsController>().tripsBox.read('trips')).length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: GestureDetector(
                                onTap: (){
                                  _.getParams(jsonDecode(_.tripsBox.read('trips'))[index]['id']);
                                  _.fetchTrip();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TripDetail()));
                                },
                                child: TripsCard(index: index),
                              ),
                            );
                          });
                    }
                  ),
                ),
              ],
            ),
          )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You don’t have any trips yet',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold)),
                  Text('Create a trip by adding a flight.',
                      style: TextStyle(fontSize: 18.sp)),
                  // TextButton(onPressed: (){print(jsonDecode(Get.find<TripsController>().tripsBox.read('trips')).length);}, child: Text('child'))
                ],
              ),
            ),
    );
  }
}
