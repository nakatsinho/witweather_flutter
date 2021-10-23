import 'dart:convert';

import 'package:witweather_flutter/models/coords.dart';
import 'package:witweather_flutter/models/daily.dart';
import 'package:witweather_flutter/models/temperature.dart';
import 'package:witweather_flutter/models/weather.dart';
import 'package:witweather_flutter/models/wind.dart';
import 'package:witweather_flutter/utils/env.dart';
import 'package:http/http.dart' as http;

class WeatherCallApiClient {
  Future<Temperature>? getTemperatureModel(String? cityName) async {
    var request =
        Uri.parse("https://" + APP_URL + "$cityName" + API_KEY + UNITS);
    var response = await http.get(request);
    var json = jsonDecode(response.body);
    // print(json.temp.toString());
    return Temperature.fromJson(json);
  }

  Future<Wind>? getWindModel(String? cityName) async {
    var request =
        Uri.parse("https://" + APP_URL + "$cityName" + API_KEY + UNITS);
    var response = await http.get(request);
    var json = jsonDecode(response.body);
    return Wind.fromJson(json);
  }

  Future<Daily>? getDailyModel(String? cityName) async {
    var request =
        Uri.parse("https://" + APP_URL + "$cityName" + API_KEY + UNITS);
    var response = await http.get(request);
    var json = jsonDecode(response.body);
    return Daily.fromJson(json);
  }

  Future<Weather>? getWeatherModel(String? cityName) async {
    var request =
        Uri.parse("https://" + APP_URL + "$cityName" + API_KEY + UNITS);
    var response = await http.get(request);
    var json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }

  Future<Coord>? getCoordModel(String? cityName) async {
    var request =
        Uri.parse("https://" + APP_URL + "$cityName" + API_KEY + UNITS);
    var response = await http.get(request);
    var json = jsonDecode(response.body);
    return Coord.fromJson(json);
  }
}
