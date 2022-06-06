// import 'package:final_project/views/passengerForm/passenger_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomFormField extends StatelessWidget {
//   const CustomFormField({
//     Key? key,
//     required this.hint, required this.holder,
//   }) : super(key: key);

//   final String hint;
//   final TestClass holder;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.name,
//       decoration: InputDecoration(
//           hintText: hint,
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
//           fillColor: Colors.white,
//           filled: true,
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(10.w))),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return '$hint is required';
//         }
//         return null;
//       },

//       onSaved: (val){
//         hint == 'First Name' ? holder.firstName = val! : holder.lastName = val!;
//       },
//     );
//   }
// }