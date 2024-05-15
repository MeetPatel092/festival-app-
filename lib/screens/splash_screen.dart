import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotely/utills/utills.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff252525),
              Color(0xff744efd),
              Color(0xffffffff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1, 0.1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.white10,
                  ),
                ],
              ),
              child: Image(
                image: AssetImage(
                    'assets/fastivel_image/c018b4b8de46d67eb56f87e6811c1b6d-removebg-preview.png'),
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              ),
            ),
            Text(
              "Festify",
              style: TextStyalling.s_title,
            ),
          ],
        ),
      ),
    );
  }
}
