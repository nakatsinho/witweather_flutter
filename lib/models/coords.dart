class Coord {
  String? lon;
  String? lat;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json["coord"]["lon"];
    lat = json["coord"]["lat"];
  }
}
