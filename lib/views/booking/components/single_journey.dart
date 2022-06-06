import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/views/detail/components/small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'details_table.dart';

class SingleJourney extends StatelessWidget {
  const SingleJourney({Key? key, required this.isReturn}) : super(key: key);

  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightController>(
      builder: (_) {
        int stop = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
                .segments!.length -
            1;

        List connection = [];

        for (int i = 0; i < stop; i++) {
          String? aT = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
              .segments![i].arrival!.at;
          String? dT = _.result[_.selectedIndex].itineraries![isReturn ? 1 : 0]
              .segments![i + 1].departure!.at;

          DateTime arr = DateTime.parse(aT!);
          DateTime dep = DateTime.parse(dT!);

          Duration conn = Duration(minutes: dep.difference(arr).inMinutes);
          String dur = '${conn.inHours}H ${conn.inMinutes.remainder(60)}M';

          connection.add(dur);
        }
        return Column(
          children: [
            isReturn
                ? Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      'Returning',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                : Column(
                    children: [
                      Text('Your Journey', style: TextStyle(fontSize: 16.sp)),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          'Departing',
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
            Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stop+1,
              itemBuilder: (_, index) => DetailsTable(isReturn: isReturn, index: index),
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
      },
    );
  }
}
