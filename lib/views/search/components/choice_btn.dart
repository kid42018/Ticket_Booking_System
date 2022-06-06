import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceBtn extends StatefulWidget {
  const ChoiceBtn({
    Key? key,
    required this.val,
    required this.groupValue,
    required this.onTouch,
    required this.label,
  }) : super(key: key);

  final int val;
  final String label;
  final int groupValue;
  final ValueChanged onTouch;

  @override
  State<ChoiceBtn> createState() => _ChoiceBtnState();
}

class _ChoiceBtnState extends State<ChoiceBtn> {
  @override
  Widget build(BuildContext context) {
    bool _selected = widget.val == widget.groupValue;
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              if (widget.groupValue == widget.val) {
                widget.onTouch(widget.val);
              } else {
                widget.onTouch(widget.val);
              }
            },
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
              splashFactory: NoSplash.splashFactory,
              animationDuration: const Duration(milliseconds: 300),
              primary: _selected ? Colors.black : Colors.black54,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // alignment: Alignment.centerLeft
              minimumSize: Size.zero
            ),
          ),
          _selected ? Container(
            margin: EdgeInsets.only(top: 3.h),
            width: 25.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.w),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
