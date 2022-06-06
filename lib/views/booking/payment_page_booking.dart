import 'package:final_project/constants.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/passenger_controller.dart';
import 'package:final_project/views/booking/booking_page.dart';
import 'package:final_project/views/booking/components/bank_btn_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankBooking {
  final String name;
  final String img;
  final bool isBank;

  BankBooking({required this.name, required this.img, required this.isBank});
}

class PaymentPageBooking extends StatelessWidget {
  PaymentPageBooking({Key? key}) : super(key: key);

  List<BankBooking> banks = [
    BankBooking(name: 'CBE', img: 'assets/images/CBE.png', isBank: true),
    BankBooking(name: 'Abyssinia Bank', img: 'assets/images/Abyssinia.png', isBank: true),
    BankBooking(name: 'Tele Birr', img: 'assets/images/TeleBirr.jpg', isBank: true),
    BankBooking(name: 'Dashen Bank', img: 'assets/images/DashenBank.jpg', isBank: true),
    BankBooking(name: 'Amole', img: 'assets/images/Amole.jpg', isBank: true),
    BankBooking(name: 'Awash Bank', img: 'assets/images/AwashBank.jpg', isBank: true),
    BankBooking(name: 'Visa', img: 'assets/images/Visa.png', isBank: true),
    BankBooking(name: 'Master', img: 'assets/images/Master.png', isBank: true),
    BankBooking(name: 'PayPal', img: 'assets/images/PayPal.png', isBank: true),
    BankBooking(name: 'UnionPay', img: 'assets/images/UnionPay.png', isBank: true),
    BankBooking(name: 'Stripe', img: 'assets/images/Stripe.png', isBank: true),
    BankBooking(name: 'American Express', img: 'assets/images/AmEx.png', isBank: true),
    BankBooking(name: 'Payoneer', img: 'assets/images/Payoneer.png', isBank: true),
    BankBooking(name: 'Pay Later', img: '', isBank: false),
  ];

  @override
  Widget build(BuildContext context) {
    var flightCont = Get.find<FlightController>();
    var passCont = Get.find<PassengerController>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: 70.h,
            backgroundColor: Color(secondaryColor),
            foregroundColor: Colors.black,
            centerTitle: false,
            elevation: 1,
            title: Text('Payment',
                style:
                    TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold))),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                          BorderSide(color: Color(secondaryColor), width: 2))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${passCont.originAirport!.iataCode} ',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        Icon(passCont.isOneWay ? Icons.arrow_right_alt : Icons.swap_horiz),
                        Text(' ${passCont.destinationAirport!.iataCode}',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text('${flightCont.result[flightCont.selectedIndex].price!.currency} ${flightCont.result[flightCont.selectedIndex].price!.grandTotal}',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Text('Please select payment option',
                  style: TextStyle(fontSize: 16.sp)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.count(
                childAspectRatio: MediaQuery.of(context).size.height / 800,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(banks.length, (index) {
                  return Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w)
                      ),
                      onTap: () {
                        if(banks[index].isBank == false){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingPage()));
                        }
                      },
                      child: BankBtnBooking(bank: banks[index]),
                    ),
                  );
                }),
              ),
            )
          ],
        ));
  }
}
