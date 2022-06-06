import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/models/airport.dart';
import 'package:final_project/models/airports_api.dart';
import 'package:final_project/services/airports_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'airport_search.dart';

class AirportChoiceBtn extends StatefulWidget {
  const AirportChoiceBtn({
    Key? key,
    required this.isOrigin,
  }) : super(key: key);

  final bool isOrigin;

  @override
  State<AirportChoiceBtn> createState() => _AirportChoiceBtnState();
}

class _AirportChoiceBtnState extends State<AirportChoiceBtn> {
  AirportsService get service => GetIt.I<AirportsService>();
  late AirportsApi<List<Airport>> _apiResponse;

  bool _isLoading = true;

  @override
  void initState() {
    _fetchairports();
    super.initState();
  }

  _fetchairports() async {
    try {
      _apiResponse = await service.getAirportsList();
    } catch (e) {
      print(e);
    }
    Get.find<FlightController>().selectCities(_apiResponse.data);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(widget.isOrigin, _apiResponse.data),
        );
      },
      child: GetBuilder<PassengerController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isOrigin) ...[
              const Text('From'),
              if (_.originAirport != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                  child: Text(_.originAirport!.city,
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold)),
                ),
                Text(_.originAirport!.iataCode)
              ] else ...[
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: Text(
                    'Select Origin',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ] else ...[
              const Text('To'),
              if (_.destinationAirport != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                  child: Text(_.destinationAirport!.city,
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold)),
                ),
                Text(_.destinationAirport!.iataCode)
              ] else ...[
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: Text(
                    'Select Destination',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ]
          ],
        );
      }),
      style: TextButton.styleFrom(
        primary: Colors.black,
        splashFactory: NoSplash.splashFactory,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
        minimumSize: Size(0, 80.h),
      ),
    );
  }
}
