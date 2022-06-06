import 'package:final_project/constants.dart';
import 'package:final_project/controllers/settings_controller.dart';
import 'package:final_project/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrencyButton extends StatelessWidget {
  CurrencyButton({
    Key? key,
  }) : super(key: key);

  final SettingsController setCont = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) {
        return TextButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SettingsSearchDelegate(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Currency', style: TextStyle(fontSize: 16.sp)),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        '${_.box.read('currency') ?? 'ETB'}',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 18.sp)
              ],
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.only(right: 20.w, bottom: 10.h, top: 10.h),
              primary: Colors.black,
            ));
      }
    );
  }
}

class SettingsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        // brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        elevation: 0,
        toolbarHeight: 80.h,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: TextStyle(fontSize: 17.sp),
            border: InputBorder.none,
          ),
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.h),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color(secondaryColor), width: 2.w)))),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final currencyList = loadCurrency();

    List<Currency> matchQuery = [];
    for (int i = 0; i < currencyList.length; i++) {
      final Currency al = currencyList[i];
      if (al.short.toLowerCase().contains(query.toLowerCase()) ||
          al.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(al);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Container(
            height: 50.h,
            padding: EdgeInsetsDirectional.only(bottom: 10.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.black26))
            ),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Color(secondaryColor).withOpacity(0.4)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(result.short,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(result.name, style: TextStyle(fontSize: 16.sp)),
                )
              ],
            ),
          ),
          onTap: () {
            Get.find<SettingsController>().changeCurrency(result.short);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
