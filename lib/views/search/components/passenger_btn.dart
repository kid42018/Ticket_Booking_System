import 'package:final_project/constants.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PassengerBtn extends StatelessWidget {
  const PassengerBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Passengers'),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () async {
                      Get.find<PassengerController>().removeVariables();
                      Navigator.pop(context);
                      return true;
                    },
                    child: StatefulBuilder(builder: (context, setState) {
                      return const PassengerModalWidget();
                    }),
                  );
                });
          },
          child: GetBuilder<PassengerController>(
            builder: (_) {
              return Row(
                  children: [
                    PassengerBtnLabel(passIcon: FontAwesomeIcons.userAlt, passCount: _.adult),
                    SizedBox(width: 10.w),
                    _.child > 0 ? PassengerBtnLabel(passIcon: FontAwesomeIcons.child, passCount: _.child) : Container(),
                    SizedBox(width: _.child > 0 ? 10.w : 0),
                    _.infant > 0 ? PassengerBtnLabel(passIcon: FontAwesomeIcons.baby, passCount: _.infant) : Container(),
                  ],
                );
            }
          ),
          style: TextButton.styleFrom(
              primary: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        )
      ],
    );
  }
}

class PassengerBtnLabel extends StatelessWidget {
  const PassengerBtnLabel({
    Key? key, required this.passIcon, required this.passCount,
  }) : super(key: key);

  final IconData passIcon;
  final int passCount;

  @override
  Widget build(BuildContext context) {
        return Row(
          children: [
            Icon(passIcon, size: 14.sp),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Text(
                '0$passCount',
                style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }
}

class PassengerModalWidget extends StatelessWidget {
  const PassengerModalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250.0.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Passengers',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.find<PassengerController>().removeVariables();
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size.zero,
                              splashFactory: NoSplash.splashFactory,
                              padding: const EdgeInsets.all(0),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w),
                            child: TextButton(
                              onPressed: () {
                                Get.find<PassengerController>().setVariables();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Color(primaryColor),
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.all(0),
                                splashFactory: NoSplash.splashFactory,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0.h),
                child: PassengerCount(
                  passengerType: Text('Adult', style: TextStyle(fontSize: 16.sp, color: Colors.black),),
                  passengerId: 1,
                ),
              ),
              PassengerCount(
                passengerType: RichText(
                  text: TextSpan(
                    text: 'Children ',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '(2-12 Years)',
                          style: TextStyle(color: Colors.black45)),
                    ],
                  ),
                ),
                passengerId: 2,
              ),
              PassengerCount(
                passengerType: RichText(
                  text: TextSpan(
                    text: 'Infant ',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '(< 2 Years)',
                          style: TextStyle(color: Colors.black45)),
                    ],
                  ),
                ),
                passengerId: 3,
              ),
            ],
          ),
        ));
  }
}

class PassengerCount extends StatefulWidget {
  const PassengerCount({
    Key? key,
    required this.passengerType,
    required this.passengerId,
  }) : super(key: key);

  final Widget passengerType;
  final int passengerId;

  @override
  State<PassengerCount> createState() => _PassengerCountState();
}

class _PassengerCountState extends State<PassengerCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.passengerType,
        StatefulBuilder(builder: (context, setState) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(50.w)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            height: 32.h,
            child: GetBuilder<PassengerController>(
                init: PassengerController(),
                builder: (_) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: TextButton(
                          onPressed: () {
                            if (widget.passengerId == 1) {
                              _.removeAdult();
                            } else if (widget.passengerId == 2) {
                              _.removeChild();
                            } else {
                              _.removeInfant();
                            }
                          },
                          child: Icon(Icons.remove, size: 18.sp),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red[100],
                            primary: Colors.black,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(2.w),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                          ),
                        ),
                      ),
                      Container(
                          width: 15.w,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                              child: Text(
                            widget.passengerId == 1
                                ? _.adultCount.toString()
                                : widget.passengerId == 2
                                    ? _.childCount.toString()
                                    : _.infantCount.toString(),
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: TextButton(
                          onPressed: () {
                            if (widget.passengerId == 1) {
                              _.addAdult();
                            } else if (widget.passengerId == 2) {
                              _.addChild();
                            } else {
                              _.addInfant();
                            }
                          },
                          child: Icon(Icons.add, size: 18.sp),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(secondaryColor),
                            primary: Colors.black,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(2.w),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          );
        }),
      ],
    );
  }
}
