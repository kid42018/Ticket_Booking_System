import 'package:final_project/controllers/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'date_range.dart';

class DatePickerBtn extends StatelessWidget {
  const DatePickerBtn({
    Key? key,
    required this.isDepart,
    required this.oneWay,
  }) : super(key: key);

  final bool isDepart;
  final bool oneWay;

  @override
  Widget build(BuildContext context) {
    // final DateController dc = Get.put(DateController());

    return Column(
      crossAxisAlignment:
          isDepart ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(isDepart ? 'Depart' : 'Return'),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DateRangePicker(
                          oneWay: oneWay,
                        )));
          },
          child: GetBuilder<DateController>(
            init: DateController(),
            builder: (_) {
              return Row(
                children: [
                  if(isDepart)...[
                    if (DateTime.now()
                        .isAfter(_.departDate)) ...[
                      Icon(
                        Icons.event,
                        size: 18.sp,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text('Choose Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black54)),
                      )
                    ] else ...[
                      Icon(
                        Icons.event,
                        size: 18.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text(
                          DateFormat('dd, MMM yyyy').format(_.departDate).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ]
                  ]else ...[
                    if (DateTime.now()
                        .isAfter(_.returnDate)) ...[
                      Icon(
                        Icons.event,
                        size: 18.sp,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text('Choose Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black54)),
                      )
                    ] else ...[
                      Icon(
                        Icons.event,
                        size: 18.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text(
                          DateFormat('dd, MMM yyyy').format(_.returnDate).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ]
                  ],
                ],
              );
            }
          ),
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.centerLeft,
              primary: Colors.black,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        )
      ],
    );
  }
}
