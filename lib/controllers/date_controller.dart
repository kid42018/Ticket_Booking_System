import 'package:get/get.dart';

class DateController extends GetxController {
  DateTime departDate = DateTime.now().subtract(const Duration(days: 2));
  DateTime returnDate = DateTime.now().subtract(const Duration(days: 2));

  void changeDepartDate(DateTime newDepartDate) {
    departDate = newDepartDate;
    update();
  }

  void changeReturnDate(DateTime newReturnDate) {
    returnDate = newReturnDate;
    update();
  }

  void resetReturnDate(){
    returnDate = DateTime.now().subtract(const Duration(days: 2));
    update();
  }
}