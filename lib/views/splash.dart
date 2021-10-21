import 'dart:async';

import 'package:flutter/material.dart';
import 'package:witweather_flutter/views/cities/all_cities.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
  static String routeNamed = "/FirstPage";
}

Widget footer() {
  return Text("v1.0.1");
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, MainPage.routeNamed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            child: Image.asset(
              "assets/images/bg_text.png",
              fit: BoxFit.cover,
            ),
            onTap: () {
              print("object");
            },
          ),
        ],
      ),
      // bottomNavigationBar: ,
    );
  }
}
