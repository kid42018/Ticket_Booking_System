import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CabinChoiceBtn extends StatefulWidget {
  const CabinChoiceBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<CabinChoiceBtn> createState() => _CabinChoiceBtnState();
}

class _CabinChoiceBtnState extends State<CabinChoiceBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text('Cabin'),
        GetBuilder<PassengerController>(builder: (_) {
          return TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () async {
                        Navigator.pop(context);
                        return true;
                      },
                      child: StatefulBuilder(builder: (context, setState) {
                        return SizedBox(
                            height: 250.0.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Cabin Class',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              padding: const EdgeInsets.all(0),
                                              minimumSize: Size.zero,
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SelectCabin(
                                    val: 1,
                                    label: 'Economy',
                                    groupValue: _.cabinValue,
                                    onTouch: (value) => setState(
                                      () {
                                        // _groupVal = value;
                                        _.setCabin('Economy', value);
                                      },
                                    ),
                                  ),
                                  SelectCabin(
                                    val: 2,
                                    label: 'Business',
                                    groupValue: _.cabinValue,
                                    onTouch: (value) => setState(
                                      () {
                                        _.setCabin('Business', value);
                                      },
                                    ),
                                  ),
                                  SelectCabin(
                                    val: 3,
                                    label: 'First',
                                    groupValue: _.cabinValue,
                                    onTouch: (value) => setState(
                                      () {
                                        _.setCabin('First', value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                    );
                  });
            },
            child: Row(
              children: [
                Icon(Icons.airline_seat_recline_extra),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Text(_.cabin,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            style: TextButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          );
        })
      ],
    );
  }
}

class SelectCabin extends StatefulWidget {
  const SelectCabin({
    Key? key,
    required this.val,
    required this.label,
    required this.groupValue,
    required this.onTouch,
  }) : super(key: key);

  final int val;
  final String label;
  final int groupValue;
  final ValueChanged onTouch;

  @override
  State<SelectCabin> createState() => _SelectCabinState();
}

class _SelectCabinState extends State<SelectCabin> {
  @override
  Widget build(BuildContext context) {
    bool _selected = widget.val == widget.groupValue;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              widget.onTouch(widget.val);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                Icon(_selected ? Icons.check_outlined : null),
              ],
            ),
          ),
          Divider(
            height: 1.h,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
