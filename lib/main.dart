import 'package:flutter/material.dart';
import 'package:quotely/screens/detail_page.dart';
import 'package:quotely/screens/homepage.dart';
import 'package:quotely/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_page',
      routes: {
        '/': (context) => const HomePage(),
        'splash_page': (context) => const SplashPage(),
        'detailpage': (context) => const DetailPage(),
      },
    ),
  );
}
