import 'package:witweather_flutter/models/city.dart';

class Daily {
  String? sunrise;
  String? sunset;
  String? country;

  Daily({this.sunrise, this.sunset, this.country});

  Daily.fromJson(Map<String, dynamic> json) {
    sunrise = json["sys"]["sunrise"];
    sunset = json["sys"]["sunset"];
    country = json["sys"]["country"];
  }
}
