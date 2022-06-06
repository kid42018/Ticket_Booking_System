import 'package:final_project/views/settings/components/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key, required this.name, required this.wid,
  }) : super(key: key);

  final String name;
  final Widget wid;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => wid));},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: 16.sp)),
          Icon(Icons.arrow_forward_ios, size: 18.sp)
        ],
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.only(right: 20.w, bottom: 15.h, top: 15.h),
        primary: Colors.black,
      )
    );
  }
}