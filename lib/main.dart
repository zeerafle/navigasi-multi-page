import 'package:flutter/material.dart';

import 'landing_page.dart';
import 'main_page.dart';
import 'form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xff333333),
              displayColor: Color(0xff333333),
              fontFamily: "PoppinsSemiBold")),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/main': (context) => const MainPage(),
        '/form': (context) => const FormPage(),
      },
    );
  }
}

