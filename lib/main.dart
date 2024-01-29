import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkingapps/mainPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ParkingApps());

}
class ParkingApps extends StatelessWidget {
  const ParkingApps({super.key});



  @override

  Widget build(BuildContext context) {
    MaterialColor mycolor = MaterialColor(0xFFFFC436, <int, Color>{
      50: Color(0xFFFFC436),
      100: Color(0xFFFFC436),
      200: Color(0xFFFFC436),
      300: Color(0xFFFFC436),
      400: Color(0xFFFFC436),
      500: Color(0xFFFFC436),
      600: Color(0xFFFFC436),
      700: Color(0xFFFFC436),
      800: Color(0xFFFFC436),
      900: Color(0xFFFFC436),
    },
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: mycolor
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
  