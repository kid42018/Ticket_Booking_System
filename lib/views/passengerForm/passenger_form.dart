import 'dart:convert';

import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/order_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/models/travelers.dart';
import 'package:final_project/views/booking/booking_page.dart';
import 'package:final_project/views/booking/payment_page_booking.dart';
import 'package:final_project/views/passengerForm/components/dob_form.dart';
import 'package:final_project/views/passengerForm/components/select_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'components/phone_number_form.dart';

import 'dart:developer' as developer;

class PassengerForm extends StatefulWidget {
  const PassengerForm({Key? key}) : super(key: key);

  @override
  _PassengerFormState createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final OrderController orderCont = Get.put(OrderController());

  final int _count = Get.find<PassengerController>().adult +
      Get.find<PassengerController>().child +
      Get.find<PassengerController>().infant;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> _values = [];

  String firstName = '';
  String lastName = '';
  String? email = '';
  String phoneNumber = '';
  String countryCode = '';
  List<Map<String, dynamic>> _d = [];
  List<Map<String, dynamic>> _title = [];
  List<Map<String, dynamic>> newVal = [];

  // int _count = 0;

  @override
  Widget build(BuildContext context) {
    // for (int i=0; i<_values.length; i++) {
    //   newVal.add({
    //     ..._title[i],
    //     ..._values[i],
    //     ..._d[i],
    //     });
    // }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Color(secondaryColor),
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 1,
        title: Text(
          'Trip Details',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                color: Colors.black12,
                child: Text(
                  'PASSENGER DETAILS',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Get.find<PassengerController>().adult,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Text(
                                'Passenger ${index + 1} (Adult)',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _form(index + 1),
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Get.find<PassengerController>().child,
                      itemBuilder: (context, index) {
                        var c = Get.find<PassengerController>().adult;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Text(
                                'Passenger ${c + 1} (Child)',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _form(c + 1)
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Get.find<PassengerController>().infant,
                      itemBuilder: (context, index) {
                        var inf = Get.find<PassengerController>().adult +
                            Get.find<PassengerController>().child;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Text(
                                'Passenger ${inf + 1} (Infant)',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _form(inf + 1)
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                color: Colors.black12,
                child: Text(
                  'BOOKING CONTACT DETAILS',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _contact(),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        print('fail form');
                      } else if (_d.length + 1 < _count || _d.isEmpty) {
                        print('fail dob');
                      } else {
                        _formKey.currentState!.save();
                        // print('$_title $_d $email ${phoneNumber.replaceAll(countryCode, '')}');
                        newVal.clear();
                        for (int i = 0; i < _values.length; i++) {
                          newVal.add({
                            ..._title[i],
                            ..._values[i],
                            ..._d[i],
                          });
                        }

                        TravelersClass passengers = TravelersClass();

                        List<Travelers> passengersList = [];

                        passengersList.clear();
                        for (var item in newVal) {
                          Name traName = Name(
                              firstName: item['first'], lastName: item['last']);
                          Phones traPhone = Phones(
                              deviceType: 'MOBILE',
                              countryCallingCode:
                                  countryCode.replaceAll('+', ''),
                              number: phoneNumber.replaceAll(countryCode, ''));
                          Contact traContact =
                              Contact(emailAddress: email, phones: [traPhone]);
                          Travelers passenger = Travelers(
                            id: item['id'].toString(),
                            dateOfBirth:
                                DateFormat('yyyy-MM-dd').format(item['dob']),
                            name: traName,
                            gender: item['title'],
                            contact: traContact,
                          );

                          passengersList.add(passenger);
                        }
                        var flightChoosen = Map<String, dynamic>.from(Get.find<FlightController>()
                                    .flightList['data']
                                [Get.find<FlightController>().selectedIndex]);
                        passengers = TravelersClass(
                            flightOffers: flightChoosen,
                            travelers: passengersList);

                        Get.find<OrderController>().getParams(passengers);
                        Get.find<OrderController>().fetchOrder();
                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentPageBooking()));

                        String jsonPassengers = jsonEncode(passengers);

                        // Get.find<OrderController>().getParams(jsonPassengers);
                        // Get.find<OrderController>().fetchOrder();
                        // Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               const BookingPage()));


                        // String jsonPassengers = jsonEncode(passengers);
                        // print(Get.find<FlightController>().flightList['data'][Get.find<FlightController>().selectedIndex].runtimeType);
                        // print(passengers);
                        // developer.log(jsonPassengers);
                        // print(jsonPassengers.runtimeType);
                      }
                    },
                    child: Text(
                      'Book',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(primaryColor),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _contact() {
    return Column(
      children: [
        PhoneNumberForm(
          onPhoneChange: (dialCode, phone) {
            countryCode = dialCode;
            phoneNumber = phone;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
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
            onSaved: (val) {
              email = val;
            },
          ),
        ),
      ],
    );
  }

  _form(int key) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SelectTitle(
            onTitleChange: (String title) => setState(() {
              int foundKey = -1;
              for (var map in _title) {
                if (map.containsKey('id')) {
                  if (map['id'] == key) {
                    foundKey = key;
                    break;
                  }
                }
              }
              if (-1 != foundKey) {
                _title.removeWhere((map) {
                  return map['id'] == foundKey;
                });
              }
              Map<String, dynamic> json = {'id': key, 'title': title};
              _title.add(json);
              // _d.add({'id': key, 'dob': dob}
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'First Name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name is required';
              }
              return null;
            },
            onSaved: (val) {
              _onUpdate(key, val!, 'first');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Last Name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name is required';
              }
              return null;
            },
            onSaved: (val) {
              _onUpdate(key, val!, 'last');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: DobForm(
            onDateChange: (DateTime? dob) => setState(() {
              if (dob != null) {
                int foundKey = -1;
                for (var map in _d) {
                  if (map.containsKey('id')) {
                    if (map['id'] == key) {
                      foundKey = key;
                      break;
                    }
                  }
                }
                if (-1 != foundKey) {
                  _d.removeWhere((map) {
                    return map['id'] == foundKey;
                  });
                }
                Map<String, dynamic> json = {'id': key, 'dob': dob};
                _d.add(json);
              }
              // _d.add({'id': key, 'dob': dob}
            }),
          ),
        )
      ],
    );
  }

  _onUpdate(int key, String val, String lbl) {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          foundKey = key;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map['id'] == foundKey;
      });
    }
    lbl == 'first' ? firstName = val : lastName = val;
    Map<String, dynamic> json = {
      'id': key,
      'first': firstName.toUpperCase(),
      'last': lastName.toUpperCase()
    };
    _values.add(json);
  }
}
