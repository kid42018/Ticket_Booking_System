import 'package:final_project/controllers/date_controller.dart';
import 'package:final_project/controllers/flight_result_controller.dart';
import 'package:final_project/controllers/trips_controller.dart';
import 'package:final_project/services/airports_service.dart';
import 'package:final_project/views/search/search_page.dart';
import 'package:final_project/views/settings/settings_page.dart';
import 'package:final_project/views/trips/trips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'controllers/passenger_controller.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => AirportsService());
}
void main() async {
  setupLocator();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ligaba Travel',
          theme: ThemeData(
            primaryColor: Color(primaryColor),
            fontFamily: 'Roboto'
          ),
          home: const HomePage(),
        ),
        designSize: const Size(390, 844)
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pages = [
    const SearchPage(),
    const TripsPage(),
    const SettingsPage(),
  ]; 

  final DateController dcInit = Get.put(DateController());
  final PassengerController pcInit = Get.put(PassengerController());
  final TripsController tripsInit = Get.put(TripsController());

  @override
  Widget build(BuildContext context) {
    Get.delete<FlightController>();
    return WillPopScope(
      onWillPop: ()=> Future<bool>.value(false),
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          iconSize: 22,
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.flight, size: 24),
              label: 'Search'
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.suitcase),
              label: 'Trips'
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cog),
              label: 'Settings'
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        )
      ),
    );
  }
}