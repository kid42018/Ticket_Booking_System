import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key, required this.onEmailChange,
  }) : super(key: key);

  final Function(String) onEmailChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          fillColor: Colors.white,
          filled: true,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.w))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
        return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (val){
        onEmailChange(val!);
      },
    );
  }
}