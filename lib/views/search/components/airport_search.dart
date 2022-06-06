import 'package:final_project/constants.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/models/airport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final bool isDep;
  final List airports;

  CustomSearchDelegate(this.isDep, this.airports)
      : super(
            textInputAction: TextInputAction.search,
            searchFieldLabel: 'Search Airport, City or Country');

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        // brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        elevation: 0,
        toolbarHeight: 80.h,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: TextStyle(fontSize: 17.sp),
            border: InputBorder.none,
          ),
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.h),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color(secondaryColor), width: 2.w)))),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final cityList = loadAirports();

    List<Airport> matchQuery = [];
    for (int i = 0; i < airports.length; i++) {
      final Airport al = airports[i];
      if (al.iataCode.toLowerCase().contains(query.toLowerCase()) ||
          al.city.toLowerCase().contains(query.toLowerCase()) ||
          al.country.toLowerCase().contains(query.toLowerCase()) ||
          al.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(al);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        Airport resultAirport = Airport(
            id: result.id,
            name: result.name,
            city: result.city,
            country: result.country,
            iataCode: result.iataCode);
        // List resList = [result.iataCode, result.city, result.name];
        return ListTile(
          minVerticalPadding: 0,
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0.h),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: Color(secondaryColor).withOpacity(0.4)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Text(result.iataCode,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: result.city,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'Roboto'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ', ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: result.country,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 280.w,
                              child: Text(result.name,
                                  style: TextStyle(fontSize: 15.sp),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 1)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  height: 1.5.h,
                  color: Colors.black12,
                ),
              )
            ],
          ),
          onTap: () {
            // close(context, [result.iata, result.city, result.airport]);
            isDep
                ? Get.find<PassengerController>()
                    .setOriginAirport(resultAirport)
                : Get.find<PassengerController>()
                    .setDestinationAirport(resultAirport);
            // Get.find<Favs>().changeAirport(resList);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
