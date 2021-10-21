import 'package:flutter/widgets.dart';
import 'package:witweather_flutter/views/cities/all_cities.dart';
import 'package:witweather_flutter/views/cities/details.dart';
import 'package:witweather_flutter/views/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeNamed: (context) => new SplashScreen(),
  MainPage.routeNamed: (context) => new MainPage(),
  CityDetails.routeNamed: (context) => new CityDetails(
        cityName: "Pretoria",
        coutryCode: "ZA",
        tagHero: "RAS",
      )
};
