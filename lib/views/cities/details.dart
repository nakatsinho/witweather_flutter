import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:witweather_flutter/controllers/weathercallapi.dart';
import 'package:witweather_flutter/models/coords.dart';
import 'package:witweather_flutter/models/daily.dart';
import 'package:witweather_flutter/models/temperature.dart';
import 'package:witweather_flutter/models/weather.dart';
import 'package:witweather_flutter/models/wind.dart';

class CityDetails extends StatefulWidget {
  final cityName;
  final coutryCode;
  final tagHero;

  const CityDetails({Key? key, this.cityName, this.coutryCode, this.tagHero})
      : super(key: key);

  @override
  _CityDetailsState createState() => _CityDetailsState();
  static String routeNamed = "/DetailsPage";
}

class _CityDetailsState extends State<CityDetails> {
  var selected = "Weight";
  // bool cardTitle = false;

  WeatherCallApiClient request = WeatherCallApiClient();
  Temperature? fetchTemp;
  Wind? fetchWind;
  Weather? fetchWeather;
  Daily? fetchDaily;
  Coord? fetchCoords;

  Future<void> fetchedDataTemp() async {
    fetchTemp = await request.getTemperatureModel(widget.cityName);
  }

  Future<void> fetchedDataWind() async {
    fetchWind = await request.getWindModel(widget.cityName);
  }

  Future<void> fetchedDataWeather() async {
    fetchWeather = await request.getWeatherModel(widget.cityName);
  }

  Future<void> fetchedDataDaily() async {
    fetchDaily = await request.getDailyModel(widget.cityName);
  }

  Future<void> fetchedDataCoord() async {
    fetchCoords = await request.getCoordModel(widget.cityName);
  }

  @override
  Widget infoCard(String cardTitle, String info, String unit, Icon icon) {
    return InkWell(
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: cardTitle == selected ? Colors.indigo : Colors.grey.shade200,
            border: Border.all(
                color: cardTitle == selected
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 0.75)),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                cardTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: cardTitle == selected ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: cardTitle == selected
                            ? Colors.white
                            : Colors.black),
                  ),
                  Text(unit)
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        selectCard(cardTitle);
      },
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selected = cardTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1d7df3"),
      appBar: AppBar(
        title: Text("Detalhes da Cidade"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: Future.wait(
            [fetchedDataTemp(), fetchedDataWind(), fetchedDataWeather()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                Stack(
                  children: [
                    Center(
                        child: Text(
                      widget.cityName + ", " + widget.coutryCode,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white38),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 82.0,
                      color: Colors.transparent,
                    ),
                    Positioned(
                        top: 75.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30)),
                              color: Colors.white),
                        )),
                    Positioned(
                        top: 30.0,
                        left: (MediaQuery.of(context).size.width / 2) - 100.0,
                        child: Hero(
                          tag: widget.tagHero,
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.tagHero),
                                    fit: BoxFit.cover)),
                          ),
                        )),
                    Positioned(
                      right: 25.0,
                      left: 25.0,
                      top: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max: ${fetchTemp!.temp}\u00B0 C",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${fetchWeather!.description}".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 25.0,
                                width: 1,
                                color: HexColor("#3555ff"),
                              ),
                              Container(
                                width: 125.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.amber),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Min: "),
                                    Text("${fetchTemp!.tempMin}\u00B0")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 150.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                infoCard("WIND", "${fetchWind!.speed}", "KM/H",
                                    Icon(Icons.ac_unit_outlined)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                infoCard("SUNRISE", "${fetchDaily!.sunrise}",
                                    "S", Icon(Icons.person)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                infoCard("SUNSET", "${fetchDaily!.sunset}", "P",
                                    Icon(Icons.ac_unit_outlined)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                infoCard("PRESSURE", "${fetchTemp!.pressure}",
                                    "P", Icon(Icons.ac_unit_outlined)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                infoCard("HUMIDITY", "${fetchTemp!.humidity}",
                                    "P", Icon(Icons.ac_unit_outlined)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Text("Quinta Feira, 21 de Outubro 2021",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
