class Weather {
  String? main;
  String? description;
  String? icon;

  Weather({this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json["weather"][0]["main"];
    description = json["weather"][0]["description"];
    icon = json["weather"][0]["icon"];
  }
}
