import 'package:final_project/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (_) {
        int passengerCount = _.price.travelerPricings!.length;

        String currency = '';

        double total = 0;
        double airfare = 0;
        double taxes = 0;
        for (var passenger in _.price.travelerPricings!) {
          currency = passenger.price!.currency!;

          total += double.parse(passenger.price!.total!);
          airfare += double.parse(passenger.price!.base!);

          for (var t in passenger.price!.taxes!) {
            taxes += double.parse(t.amount!);
          }
        }

        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.grey[200],
              border: Border.all(color: Colors.black12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 5.h),
                child: Text('Summary of charges',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const Divider(
                    color: Colors.black12, height: 1, thickness: 1),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Service',
                                style: TextStyle(fontSize: 14.sp)),
                            Text('$passengerCount Passenger',
                                style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                      ),
                      const Divider(
                          color: Colors.black12,
                          height: 1,
                          thickness: 1),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Airfare',
                                style: TextStyle(fontSize: 14.sp)),
                            Text('$currency ${airfare.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                      ),
                      const Divider(
                          color: Colors.black12,
                          height: 1,
                          thickness: 1),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Taxes and fees',
                                style: TextStyle(fontSize: 14.sp)),
                            Text('$currency ${taxes.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                  color: Colors.black12, height: 1, thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total price',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text('$currency ${total.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}