import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsExpTile extends StatelessWidget {
  const TermsAndConditionsExpTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10.w),
          color: Colors.grey[200]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ExpansionTile(
            title: Text(
              'Terms and Conditions',
              style:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Description',
                  style: TextStyle(fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}