class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json["wind"]["speed"];
    deg = json["wind"]["deg"];
  }
}
