import 'package:final_project/constants.dart';
import 'package:final_project/controllers/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({Key? key, required this.oneWay}) : super(key: key);

  final bool oneWay;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  // DateRangePickerController _datePickerController = DateRangePickerController();
  bool selection = false;
  DateTime _departDate = DateTime.now().subtract(const Duration(days: 2));
  DateTime _returnDate = DateTime.now().subtract(const Duration(days: 2));

// DateFormat('dd, MMMM yyyy').format(DateTime.now())

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20.w,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18.sp,
          ),
        ),
        title: Text(
          widget.oneWay
              ? 'Select departure date'
              : 'Select departure and return date',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,),
        ),
      ),
      body: Stack(
        children: [
          SfDateRangePicker(
            selectionShape: DateRangePickerSelectionShape.rectangle,
            headerHeight: 60.h,
            showNavigationArrow: true,
            navigationDirection: DateRangePickerNavigationDirection.vertical,
            navigationMode: DateRangePickerNavigationMode.scroll,
            enableMultiView: true,
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 356)),
            selectionMode: widget.oneWay
                ? DateRangePickerSelectionMode.single
                : DateRangePickerSelectionMode.range,
            selectionColor: Color(primaryColor).withOpacity(0.8),
            todayHighlightColor: Color(primaryColor),
            startRangeSelectionColor: Color(primaryColor).withOpacity(0.8),
            endRangeSelectionColor: Color(primaryColor).withOpacity(0.8),
            rangeSelectionColor: Color(secondaryColor).withOpacity(0.5),
            selectionTextStyle: const TextStyle(color: Colors.white),
            monthViewSettings: DateRangePickerMonthViewSettings(
              viewHeaderHeight: 40.h,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: TextStyle(
                    fontSize: 14.h,
                    fontWeight: FontWeight.bold,
                    color: Color(primaryColor)),
              ),
            ),
            // controller: _datePickerController,
            onSelectionChanged: _onSelectionChanged,
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 50.h,
            child: !selection
                ? Container()
                : Center(
                    child: GetBuilder<DateController>(
                        init: DateController(),
                        builder: (_) {
                          return TextButton(
                            onPressed: () {
                              if (widget.oneWay) {
                                Get.find<DateController>()
                                    .changeDepartDate(_departDate);
                              } else {
                                Get.find<DateController>()
                                    .changeDepartDate(_departDate);
                                Get.find<DateController>()
                                    .changeReturnDate(_returnDate);
                              }
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 16.sp),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(primaryColor),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100.w, vertical: 13.h),
                              fixedSize: Size(330.w, 50.h)
                            ),
                          );
                        }),
                  ),
          )
        ],
      ),
    );
  }

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      if (widget.oneWay) {
        if (dateRangePickerSelectionChangedArgs.value == null) {
          selection = false;
        } else {
          selection = true;
          _departDate = dateRangePickerSelectionChangedArgs.value;
          Get.find<DateController>().changeDepartDate(_departDate);
        }
      } else {
        if (dateRangePickerSelectionChangedArgs.value.endDate == null) {
          selection = false;
        } else {
          selection = true;
          _departDate = dateRangePickerSelectionChangedArgs.value.startDate;
          _returnDate = dateRangePickerSelectionChangedArgs.value.endDate;
        }
      }
    });
  }
}
