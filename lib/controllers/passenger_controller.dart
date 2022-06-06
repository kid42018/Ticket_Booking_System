import 'package:final_project/models/airport.dart';
import 'package:get/get.dart';

class PassengerController extends GetxController {
  int adultCount = 1;
  int childCount = 0;
  int infantCount = 0;

  int adult = 1;
  int child = 0;
  int infant = 0;

  bool isOneWay = false;
  int btnValue = 1;

  String cabin = 'Economy';
  int cabinValue = 1;

  Airport? originAirport;
  Airport? destinationAirport;

  void addAdult() {
    if (adultCount + childCount + infantCount < 9) {
      adultCount += 1;
    } else {
      adultCount = adultCount;
    }
    update();
  }

  void removeAdult() {
    if (adultCount > 1) {
      if (infantCount >= adultCount) {
        adultCount -= 1;
        infantCount -= 1;
      } else {
        adultCount > 1 ? adultCount -= 1 : adultCount = adultCount;
      }
    } else {
      adultCount = adultCount;
    }
    update();
  }

  void addChild() {
    if (adultCount + childCount + infantCount < 9) {
      childCount += 1;
    } else {
      childCount = childCount;
    }
    update();
  }

  void removeChild() {
    childCount > 0 ? childCount -= 1 : childCount = childCount;
    update();
  }

  void addInfant() {
    if (adultCount + childCount + infantCount < 9 && infantCount < adultCount) {
      infantCount += 1;
    } else {
      infantCount = infantCount;
    }
    update();
  }

  void removeInfant() {
    infantCount > 0 ? infantCount -= 1 : infantCount = infantCount;
    update();
  }

  void setVariables(){
    adult = adultCount;
    child = childCount;
    infant = infantCount;
    update();
  }

  void removeVariables(){
    adultCount = adult;
    childCount = child;
    infantCount = infant;
    update();
  }

  void oneWay(int newValue){
    isOneWay = true;
    btnValue = newValue;
    update();
  }

  void roundTrip(int newValue){
    isOneWay = false;
    btnValue = newValue;
    update();
  }

  void setCabin(String newCabin, int newValue){
    cabin = newCabin;
    cabinValue = newValue;
    update();
  }

  void setOriginAirport(Airport newOriginAirport){
    originAirport = newOriginAirport;
    update();
  }

  void setDestinationAirport(Airport newDestinationAirport){
    destinationAirport = newDestinationAirport;
    update();
  }

  void swapAirports() {
    var temp = destinationAirport;
    destinationAirport = originAirport;
    originAirport = temp;
    update();
  }
}
