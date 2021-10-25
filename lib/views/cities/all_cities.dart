import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:witweather_flutter/models/city.dart';
import 'package:witweather_flutter/views/cities/details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
  static String routeNamed = "/MainPage";
}

final List<City> cities = City.suggestedCities;

class _MainPageState extends State<MainPage> {
  String imageUrl(String urlPath) {
    return "https://openweathermap.org/img/wn/$urlPath@4x.png";
  }

  Widget cityItem(String cityName, String countryCode, String imagePath) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                        tag: imagePath,
                        child: Image(
                          height: 75.0,
                          width: 75.0,
                          fit: BoxFit.cover,
                          image: AssetImage(imagePath),
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            cityName + " - " + countryCode,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20.0),
                          ),
                          Text(
                            "Min: " + " - " + "Max:",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.yellowAccent),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CityDetails(
                            cityName: cityName,
                            coutryCode: countryCode,
                            tagHero: imagePath,
                          )));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ))
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CityDetails(
                    cityName: cityName,
                    coutryCode: countryCode,
                    tagHero: imagePath,
                  )));
          // Navigator.of(context).pushNamed(CityDetails.routeNamed);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1d7df3"),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg_light.png",
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 10.0, left: 10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //           onPressed: () {},
              //           icon: FaIcon(
              //             FontAwesomeIcons.windowClose,
              //             color: Colors.white,
              //           )),
              //       Container(
              //         width: 125.0,
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: FaIcon(
              //                   FontAwesomeIcons.thermometer,
              //                   color: Colors.white,
              //                 )),
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: FaIcon(
              //                   FontAwesomeIcons.search,
              //                   color: Colors.white,
              //                 )),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  "Lista de Cidades",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                decoration: BoxDecoration(
                  // color: HexColor("#0536AD"),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                ),
                height: MediaQuery.of(context).size.height - 85.0,
                child: ListView(
                  padding: EdgeInsets.only(right: 20.0, left: 25.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 48.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 100,
                        child: ListView.builder(
                          itemCount: cities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return cityItem(
                                cities[index].name.toString(),
                                cities[index].countryCode.toString(),
                                "assets/images/logo.png");
                          },
                          // children: [
                          //Text(cities[index].name.toString())
                          //   cityItem("MAPUTO", "MZ", "assets/images/logo.png"),
                          // ],
                        ),
                      ),
                    ),
                  ],
                  primary: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
