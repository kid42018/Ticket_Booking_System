import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberForm extends StatelessWidget {
  const PhoneNumberForm({
    Key? key, required this.onPhoneChange,
  }) : super(key: key);

  final Function(String dialcode, String phoneNo) onPhoneChange;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      spaceBetweenSelectorAndTextField: 0,
      // textAlignVertical: TextAlignVertical.bottom,
      onInputChanged: (PhoneNumber number) {
        onPhoneChange(number.dialCode!, number.phoneNumber!);
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        showFlags: false,
        leadingPadding: 10,
        setSelectorButtonAsPrefixIcon: true
      ),
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: PhoneNumber(isoCode: 'ET'),
      formatInput: false,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Phone Number',
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.w)),
      ),
      // inputBorder: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(10.w)),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }
}
