import 'package:flutter/material.dart';
import 'package:witweather_flutter/routes/app.dart';
import 'package:witweather_flutter/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WitWeather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme:
          ThemeData(accentColor: Colors.white, primaryColor: Colors.amber),
      initialRoute: SplashScreen.routeNamed,
      routes: routes,
    );
  }
}
