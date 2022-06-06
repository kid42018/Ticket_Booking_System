import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DobForm extends StatefulWidget {
  const DobForm({
    Key? key, required this.onDateChange,
  }) : super(key: key);

  final Function(DateTime?) onDateChange;

  @override
  State<DobForm> createState() => _DobFormState();
}

class _DobFormState extends State<DobForm> {
  DateTime? dob;

  Widget getText() {
    if (dob == null) {
      return const Text('Select Date');
    } else {
      return Text('${dob!.day} / ${dob!.month} / ${dob!.year}',
          style: const TextStyle(color: Colors.black));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final newDob = await showDatePicker(
          context: context,
          initialDate: dob ?? DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 100),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Color(primaryColor),
                  onPrimary: Colors.white,
                  surface: Color(secondaryColor),
                  onSurface: Colors.black
                )
              ),
              child: child!,
            );
          },
        );

        if (newDob == null) {
        } else {
          setState(() {
            dob = newDob;
          });
        }

        widget.onDateChange(dob);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [getText(), Icon(Icons.keyboard_arrow_down, size: 28.sp)],
      ),
      style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(double.infinity, 50.h),
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Colors.white,
          primary: Colors.black54,
          textStyle: TextStyle(fontSize: 16.sp, fontFamily: 'Roboto'),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          side: const BorderSide(color: Colors.black54),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w))),
    );
  }
}
