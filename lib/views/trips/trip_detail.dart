import 'package:final_project/constants.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:final_project/views/detail/components/small_widgets.dart';
import 'package:final_project/views/trips/components/passengers_exp.dart';
import 'package:final_project/views/trips/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/flight_details_table.dart';
import 'components/summary_table.dart';
import 'components/terms_expansion.dart';

class TripDetail extends StatelessWidget {
  const TripDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: Color(secondaryColor),
          foregroundColor: Colors.black,
          centerTitle: false,
          elevation: 1,
          title: Text('Trip Details',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold))),
      body: GetBuilder<TripsController>(builder: (_) {
        return _.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SafeArea(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Text(
                            'Please note that this booking is not ticketed.',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                color: Colors.white,
                                border: Border.all(color: Colors.black12)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Text('Booking Reference : ',
                                      style: TextStyle(fontSize: 16.sp)),
                                  Text(
                                    _
                                        .result
                                        .associatedRecords![
                                            _.result.associatedRecords!.length -
                                                1]
                                        .reference!,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color(primaryColor),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        PassengersExpTile(),
                        _.result.flightOffers![0].itineraries!.length == 1
                            ? const SingleJourneyTrips(isReturn: false)
                            : Column(
                                children: [
                                  const SingleJourneyTrips(isReturn: false),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: const SingleJourneyTrips(
                                        isReturn: true),
                                  ),
                                ],
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: const SummaryTable(),
                        ),
                        const TermsAndConditionsExpTile(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                            },
                            child: Text('Continue to payment', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}

class SingleJourneyTrips extends StatelessWidget {
  const SingleJourneyTrips({Key? key, required this.isReturn})
      : super(key: key);

  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripsController>(
      builder: (_) {
        int stop = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
                .segments!.length -
            1;

        List connection = [];

        for (int i = 0; i < stop; i++) {
          String? aT = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
              .segments![i].arrival!.at;
          String? dT = _.result.flightOffers![0].itineraries![isReturn ? 1 : 0]
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
                ? Text(
                    'Returning',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
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
                  ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stop + 1,
                itemBuilder: (_, index) =>
                    FlightDetailsTable(isReturn: isReturn, index: index),
                separatorBuilder: (_, __) => Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Row(
                    children: [
                      TimeIcon(
                          timeTotal: connection[__].toString(), isCard: false),
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
