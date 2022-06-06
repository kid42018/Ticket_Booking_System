import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../payment_page.dart';

class BankBtn extends StatelessWidget {
  const BankBtn({
    Key? key, required this.bank,
  }) : super(key: key);

  final Bank bank; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Image.asset(
              bank.img,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(bank.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          )
        ],
      ),
    );
  }
}
