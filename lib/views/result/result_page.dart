import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/custom_appbar.dart';
import 'components/result_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final FlightController flightCont = Get.put(FlightController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: const CustomAppBar(),
      ),
      body: GetBuilder<FlightController>(builder: (_) {
        if (_.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _.result.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                child: GestureDetector(
                  onTap: () {
                    _.selectFlight(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailPage()));
                  },
                  child: ResultCard(index: index),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
