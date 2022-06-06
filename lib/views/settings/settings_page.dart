import 'package:final_project/constants.dart';
import 'package:final_project/views/booking/booking_page.dart';
import 'package:final_project/views/passengerForm/passenger_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/currency_btn.dart';
import 'components/settings_btn.dart';
import 'components/terms_and_conditions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: Color(secondaryColor),
          foregroundColor: Colors.black,
          centerTitle: false,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Text(
                    'Currency',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: CurrencyButton(),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.black26),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Text(
                    'Others',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                const SettingsButton(wid: TermsAndConditions(), name: 'Terms and Conditions'),
                const Divider(height: 1, thickness: 1, color: Colors.black26),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const SettingsButton(wid: TermsAndConditions(), name: 'Privacy Policy'),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.black26),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: SettingsButton(wid: TermsAndConditions(), name: 'About Us'),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.black26),
              ],
            )));
  }
}
