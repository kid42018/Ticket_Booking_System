import 'package:final_project/constants.dart';
import 'package:final_project/views/booking/payment_page_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankBtnBooking extends StatelessWidget {
  const BankBtnBooking({
    Key? key, required this.bank,
  }) : super(key: key);

  final BankBooking bank; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: bank.isBank ? Image.asset(
              bank.img,
              fit: BoxFit.contain,
            ) : Icon(Icons.pause_circle_outline, size: 36.sp, color: Color(primaryColor)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(bank.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          )
        ],
      ),
    );
  }
}
