import 'package:final_project/constants.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PassengersExpTile extends StatelessWidget {
  const PassengersExpTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<TripsController>(builder: (_) {
        List passengers = [];
        for (var passenger in _.result.travelers!) {
          passengers
              .add('${passenger.name!.firstName} ${passenger.name!.lastName}');
        }
        return Container(
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExpansionTile(
              textColor: Color(primaryColor),
              iconColor: Color(primaryColor),
              title: Text(
                'Passenger(s)',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: passengers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        passengers[index],
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
