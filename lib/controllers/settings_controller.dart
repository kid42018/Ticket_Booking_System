import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final box = GetStorage('currency');

  void changeCurrency(String newCurrency) {
    box.write('currency', newCurrency);
    update();
  }

  void getTermsAndConditions(){

  }
  void getPrivacyPolicy(){
    
  }
  void getAboutUs(){
    
  }
}