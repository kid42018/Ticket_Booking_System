import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeCity extends StatelessWidget {
  const TimeCity({
    Key? key, required this.timeCity, required this.city,
  }) : super(key: key);

  final String timeCity;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(timeCity, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(city, style: TextStyle(fontSize: 14.sp)),
        )
      ],
    );
  }
}

class OriginDestination extends StatelessWidget {
  const OriginDestination({
    Key? key, required this.origin, required this.destination,
  }) : super(key: key);

  final String origin;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destination,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            'from $origin',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    Key? key, required this.dateToShow,
  }) : super(key: key);

  final String dateToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.w)),
      child: Text(
        dateToShow,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp),
      ),
    );
  }
}

class StopDisplay extends StatelessWidget {
  const StopDisplay({
    Key? key,
    required this.stop,
  }) : super(key: key);

  final int stop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (stop == 0) ...[
          Icon(Icons.remove, size: 18.sp),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text('Non-stop',
                style: TextStyle(fontSize: 14.sp)),
          )
        ] else ...[
          Icon(Icons.circle, size: 12.sp, color: Colors.red),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text('${stop.toString()} stop',
                style: TextStyle(fontSize: 14.sp)),
          )
        ]
      ],
    );
  }
}

class TimeIcon extends StatelessWidget {
  const TimeIcon({
    Key? key,
    required this.timeTotal,
    required this.isCard,
  }) : super(key: key);

  final String timeTotal;
  final bool isCard;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timelapse,
            size: 18.sp, color: isCard ? Colors.black45 : Colors.black),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(timeTotal,
              style: isCard
                  ? TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 14.sp)),
        )
      ],
    );
  }
}