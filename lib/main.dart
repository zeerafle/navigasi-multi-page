import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_way_navigation/booking_list_page.dart';
import 'package:two_way_navigation/form_page.dart';
import 'package:two_way_navigation/landing_page.dart';
import 'package:two_way_navigation/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Booking Antrian Dokter",
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xff333333),
              displayColor: const Color(0xff333333),
              fontFamily: "PoppinsSemiBold")),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/main': (context) => const MainPage(),
        '/form': (context) => FormPage(),
        '/booking': (context) => BookingPage(),
      },
    );
  }
}
