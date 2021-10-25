class City {
  String? name;
  String? countryCode;
  double? max;
  double? min;
  String? imgPath;
  int? dateTime;
  int? timezone;

  City(
      {this.name,
      this.countryCode,
      this.max,
      this.min,
      this.imgPath,
      this.dateTime,
      this.timezone});

  static List<City> suggestedCities = [
    new City(
      name: "MAPUTO",
      countryCode: "MOZ",
    ),
    new City(name: "LISBOA", countryCode: "PRT"),
    new City(name: "MADRID", countryCode: "ESP"),
    new City(name: "PARIS", countryCode: "FRA"),
    new City(name: "BERLIM", countryCode: "DEU"),
    new City(name: "COPENHAGA", countryCode: "DNK"),
    new City(name: "ROMA", countryCode: "ITA"),
    new City(name: "LONDRES", countryCode: "LD"),
    new City(name: "DUBLIN", countryCode: "IRL"),
    new City(name: "PRAGA", countryCode: "CHE"),
    new City(name: "VIENA", countryCode: "AUT"),
  ];

  City.fromJson(Map<String, dynamic> json) {
    max = json["main"]["temp_max"];
    min = json["main"]["temp_min"];
    imgPath = json["weather"][0]["icon"];
    timezone = json["timezone"];
    dateTime = json["dt"];
  }
}


//Visto que Londres nao mais faz parte da Uniao Europeia, coloquei apenas como 'country code' - LD;
//Mas como esta' como requisito,adicionei
