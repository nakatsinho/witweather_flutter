class City {
  final String? name;
  final String? countryCode;
  final String? max;
  final String? min;
  final String? imgPath;

  City({this.name, this.countryCode, this.max, this.min, this.imgPath});

  static List<City> suggestedCities = [
    new City(name: "MAPUTO", countryCode: "MOZ",),
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
}


//Visto que Londres nao mais faz parte da Uniao Europeia, coloquei apenas como 'country code' - LD;
//Mas como esta' como requisito,adicionei
