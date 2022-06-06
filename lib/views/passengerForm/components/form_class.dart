// import 'package:final_project/views/passengerForm/passenger_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'custom_form.dart';
// import 'dob_form.dart';
// import 'select_title.dart';

// class FormClass extends StatefulWidget {
//   final TestClass? passenger;
//   final int? count;
//   final state = _FormClassState();

//   FormClass({
//     Key? key,
//     this.passenger,
//     this.count,
//   }) : super(key: key);

//   @override
//   State<FormClass> createState() => state;

//   // bool isValid() => state.validate();
// }

// class _FormClassState extends State<FormClass> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget.count == 0
//               ? const SizedBox()
//               : Padding(
//                   padding: EdgeInsets.only(left: 20.w, top: 20.h),
//                   child: Text('Passenger ${widget.count} (Adult)',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16.sp)),
//                 ),
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 20.h),
//                 child: const SelectTitle(isAdult: true),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 20.h),
//                 child: TextFormField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                       hintText: 'First Name',
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.w))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'First Name is required';
//                     }
//                     return null;
//                   },
//                   onSaved: (val) {
//                     widget.passenger!.firstName = val!;
//                   },
//                 ),
//               ),
//               // Padding(
//               //   padding: EdgeInsets.only(top: 20.h),
//               //   child: CustomFormField(
//               //       hint: 'First Name', holder: widget.passenger!),
//               // ),
//               Padding(
//                 padding: EdgeInsets.only(top: 20.h),
//                 child: TextFormField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                       hintText: 'Last Name',
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.w))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Last Name is required';
//                     }
//                     return null;
//                   },
//                   onSaved: (val) {
//                     widget.passenger!.lastName = val!;
//                   },
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.only(top: 20.h), child: const DobForm()),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // bool validate() {
//   //   var valid = _formKey.currentState!.validate();
//   //   if (valid) _formKey.currentState!.save();
//   //   return valid;
//   // }
// }
