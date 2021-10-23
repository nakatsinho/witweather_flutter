class Temperature {
  double? temp;
  double? feelsLike;
  double? tempMax;
  double? tempMin;
  int? pressure;
  int? humidity;

  Temperature(
      {this.temp,
      this.feelsLike,
      this.tempMax,
      this.tempMin,
      this.pressure,
      this.humidity});

  Temperature.fromJson(Map<String, dynamic> json) {
    temp = json["main"]["temp"];
    feelsLike = json["main"]["feels_like"];
    tempMax = json["main"]["temp_max"];
    tempMin = json["main"]["temp_min"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
  }
}
