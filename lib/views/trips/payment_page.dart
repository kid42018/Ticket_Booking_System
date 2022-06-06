import 'package:final_project/constants.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/bank_btn.dart';

class Bank {
  final String name;
  final String img;

  Bank({required this.name, required this.img});
}

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);

  List<Bank> banks = [
    Bank(name: 'CBE', img: 'assets/images/CBE.png'),
    Bank(name: 'Abyssinia Bank', img: 'assets/images/Abyssinia.png'),
    Bank(name: 'Tele Birr', img: 'assets/images/TeleBirr.jpg'),
    Bank(name: 'Dashen Bank', img: 'assets/images/DashenBank.jpg'),
    Bank(name: 'Amole', img: 'assets/images/Amole.jpg'),
    Bank(name: 'Awash Bank', img: 'assets/images/AwashBank.jpg'),
    Bank(name: 'Visa', img: 'assets/images/Visa.png'),
    Bank(name: 'Master', img: 'assets/images/Master.png'),
    Bank(name: 'PayPal', img: 'assets/images/PayPal.png'),
    Bank(name: 'UnionPay', img: 'assets/images/UnionPay.png'),
    Bank(name: 'Stripe', img: 'assets/images/Stripe.png'),
    Bank(name: 'American Express', img: 'assets/images/AmEx.png'),
    Bank(name: 'Payoneer', img: 'assets/images/Payoneer.png'),
  ];

  @override
  Widget build(BuildContext context) {
    int len = Get.find<TripsController>().result.flightOffers![0].itineraries![0]
          .segments!.length - 1;
    String? depIata = Get.find<TripsController>().result.flightOffers![0].itineraries![0]
          .segments![0].departure!.iataCode;
    String? arrIata = Get.find<TripsController>().result.flightOffers![0].itineraries![0]
          .segments![len].arrival!.iataCode;
    
    String currency = '';
    double total = 0;

    for (var passenger in Get.find<TripsController>().result.flightOffers![0].travelerPricings!) {
      currency = passenger.price!.currency!;
      total += double.parse(passenger.price!.total!);
    }

    bool isOneWay = Get.find<TripsController>().result.flightOffers![0].itineraries!.length == 1 ? true : false;

    return Scaffold(
        appBar: AppBar(
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
                        Text(depIata!,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        Icon(isOneWay ? Icons.arrow_right_alt : Icons.swap_horiz),
                        Text(arrIata!,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text('$currency ${total.toStringAsFixed(2)}',
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
                      onTap: () {},
                      child: BankBtn(bank: banks[index]),
                    ),
                  );
                }),
              ),
            )
          ],
        ));
  }
}
