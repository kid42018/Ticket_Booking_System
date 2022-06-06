import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTitle extends StatefulWidget {
  const SelectTitle({
    Key? key, required this.onTitleChange,
  }) : super(key: key);

  final Function(String) onTitleChange;

  @override
  State<SelectTitle> createState() => _SelectTitleState();
}

class _SelectTitleState extends State<SelectTitle> {
  String titleValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    List titleItems = ['MALE', 'FEMALE'];
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: 'Gender',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.w)),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        fillColor: Colors.white,
        filled: true
      ),
      icon: Icon(Icons.keyboard_arrow_down, size: 28.sp),
      // underline: const SizedBox(),
      validator: (value) {
            if (value == null) {
              return 'Title is required';
            }
            return null;
          },
      isExpanded: true,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black54,
        fontFamily: 'Roboto'
      ),
      // value: titleValue,
      onChanged: (String? newValue){
        setState(() {
          titleValue = newValue!;
        });
      },
      onSaved: (String? val){
        widget.onTitleChange(titleValue);
      },
      items: titleItems.map((valueItem){
        return DropdownMenuItem<String>(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}