import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/controllers/date_controller.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/controllers/settings_controller.dart';
import 'package:final_project/models/flight_result.dart';
import 'package:final_project/views/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'components/airport_choice_btn.dart';
import 'components/cabin_choice_btn.dart';
import 'components/choice_btn.dart';
import 'components/date_picker_btn.dart';
import 'components/passenger_btn.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FlightController flightCont = Get.put(FlightController());
  final SettingsController settingsCont = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        Positioned(
          child: Container(
            width: 390.w,
            height: 342.h,
            color: Color(secondaryColor),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 20.w),
                    child: RichText(
                      text: TextSpan(
                        text: 'L',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Roboto'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'i',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(primaryColor),
                                fontSize: 18.sp),
                          ),
                          TextSpan(
                            text: 'gaba',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18.sp),
                          ),
                          TextSpan(
                            text: ' Travel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(primaryColor),
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h, left: 20.w),
                    child: Text(
                      'Book a Flight',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 20.w),
                    child: GetBuilder<PassengerController>(builder: (_) {
                      return Row(
                        children: [
                          ChoiceBtn(
                            val: 1,
                            groupValue: _.btnValue,
                            onTouch: (value) => setState(
                              () {
                                _.roundTrip(value);
                              },
                            ),
                            label: 'Round Trip',
                          ),
                          ChoiceBtn(
                            val: 2,
                            groupValue: _.btnValue,
                            onTouch: (value) => setState(
                              () {
                                _.oneWay(value);
                                Get.find<DateController>().resetReturnDate();
                              },
                            ),
                            label: 'One-Way',
                          )
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 184,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.w),
                        border: Border.all(color: const Color(0xffC1C1C1))),
                    width: 350.w,
                    height: 220.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.flight_takeoff,
                                size: 20.sp,
                                color: Color(primaryColor),
                              ),
                              DottedBorder(
                                dashPattern: const [2, 11],
                                strokeWidth: 2,
                                color: Color(primaryColor),
                                padding: EdgeInsets.zero,
                                child: SizedBox(
                                  width: 0,
                                  height: 82.h,
                                ),
                              ),
                              Icon(
                                Icons.flight_land,
                                size: 20.sp,
                                color: Color(primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AirportChoiceBtn(isOrigin: true),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                child: DottedBorder(
                                  dashPattern: const [5, 9],
                                  color: Color(primaryColor),
                                  padding: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: 226.w,
                                    height: 0,
                                  ),
                                ),
                              ),
                              const AirportChoiceBtn(isOrigin: false),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: TextButton(
                              onPressed: () {
                                Get.find<PassengerController>().swapAirports();
                              },
                              child: Icon(
                                Icons.cached,
                                size: 20.sp,
                              ),
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: const CircleBorder(),
                                  backgroundColor: Color(primaryColor),
                                  primary: Colors.white,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size.zero),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 30.w),
                  child: SizedBox(
                    width: 330.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (Get.find<PassengerController>().isOneWay) ...[
                              DatePickerBtn(
                                  isDepart: true,
                                  oneWay:
                                      Get.find<PassengerController>().isOneWay),
                            ] else ...[
                              DatePickerBtn(
                                  isDepart: true,
                                  oneWay:
                                      Get.find<PassengerController>().isOneWay),
                              DatePickerBtn(
                                  isDepart: false,
                                  oneWay:
                                      Get.find<PassengerController>().isOneWay)
                            ]
                          ],
                        ),
                        Divider(thickness: 2.h, color: Color(primaryColor)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [PassengerBtn(), CabinChoiceBtn()],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0.h),
                          child: GetBuilder<PassengerController>(builder: (_) {
                            return GetBuilder<DateController>(builder: (dc) {
                              return GetBuilder<FlightController>(
                                builder: (flightCont) {
                                  return TextButton(
                                    onPressed: () {
                                      if (_.isOneWay) {
                                        if (_.originAirport == null) {
                                        } else if (_.destinationAirport == null) {
                                        } else if (dc.departDate
                                            .isBefore(DateTime.now())) {
                                        } else {
                                          SearchFlight newParams = SearchFlight(
                                              originLocationCode:
                                                  _.originAirport!.iataCode,
                                              destinationLocationCode:
                                                  _.destinationAirport!.iataCode,
                                              departureDate: DateFormat('yyyy-MM-dd').format(dc.departDate),
                                              returnDate: DateFormat('yyyy-MM-dd').format(dc.returnDate),
                                              adults: _.adult.toString(),
                                              children: _.child.toString(),
                                              infants: _.infant.toString(),
                                              travelClass: _.cabin.toUpperCase(),
                                              currencyCode: Get.find<SettingsController>().box.read('currency') ?? 'ETB',
                                              isOneWay: 'true');
                                          flightCont.clearSearch();
                                          flightCont.getParams(newParams);
                                          flightCont.fetchFlights();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultPage()));
                                        }
                                      } else {
                                        if (_.originAirport == null) {
                                        } else if (_.destinationAirport == null) {
                                        } else if (dc.departDate
                                            .isBefore(DateTime.now())) {
                                        } else if (dc.returnDate
                                            .isBefore(DateTime.now())) {
                                        } else {
                                          SearchFlight newParams = SearchFlight(
                                              originLocationCode:
                                                  _.originAirport!.iataCode,
                                              destinationLocationCode:
                                                  _.destinationAirport!.iataCode,
                                              departureDate: DateFormat('yyyy-MM-dd').format(dc.departDate),
                                              returnDate: DateFormat('yyyy-MM-dd').format(dc.returnDate),
                                              adults: _.adult.toString(),
                                              children: _.child.toString(),
                                              infants: _.infant.toString(),
                                              travelClass: _.cabin.toUpperCase(),
                                              currencyCode: Get.find<SettingsController>().box.read('currency') ?? 'ETB',
                                              isOneWay: 'false');
                                          flightCont.clearSearch();
                                          flightCont.getParams(newParams);
                                          flightCont.fetchFlights();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultPage()));
                                        }
                                      }
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultPage()));
                                    },
                                    child: Text('Search',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Color(primaryColor),
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      padding: EdgeInsets.symmetric(vertical: 13.h),
                                      fixedSize: Size(330.w, 50.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.w),
                                      ),
                                    ),
                                  );
                                }
                              );
                            });
                          }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
