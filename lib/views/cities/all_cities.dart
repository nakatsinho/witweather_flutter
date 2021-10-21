import 'package:flutter/material.dart';
import 'package:witweather_flutter/views/cities/details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
  static String routeNamed = "/MainPage";
}

class _MainPageState extends State<MainPage> {
  Widget cityItem(String cityName, String countryCode, String imagePath) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
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
                  Column(
                    children: [
                      Text(
                        cityName + " - " + countryCode,
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
                  )
                ],
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg_light.png",
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        )),
                    Container(
                      width: 125.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  "Lista de Cidades",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(
                //       topRight: Radius.circular(30.0),
                //       topLeft: Radius.circular(30.0)),
                // ),
                height: MediaQuery.of(context).size.height - 185.0,
                child: ListView(
                  padding: EdgeInsets.only(right: 20.0, left: 25.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 48.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(
                          children: [
                            cityItem("MAPUTO", "MZ", "assets/images/logo.png"),
                            cityItem("LISBOA", "PT", "assets/images/logo.png"),
                            cityItem("MADRID", "ES", "assets/images/logo.png"),
                            cityItem("PARIS", "FR", "assets/images/logo.png"),
                            cityItem("BERLIM", "NR", "assets/images/logo.png"),
                          ],
                        ),
                      ),
                    ),

                    //TODO:: I was tryning to add more fetures on Main Page, like Settings, DarkMode, etc
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         width: 60.0,
                    //         height: 50.0,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(
                    //                 color: Colors.red,
                    //                 style: BorderStyle.solid,
                    //                 width: 1),
                    //             borderRadius: BorderRadius.circular(14.0)),
                    //         child: Center(
                    //           child: Icon(Icons.ac_unit_sharp),
                    //         ),
                    //       ),
                    //       Container(
                    //         width: 60.0,
                    //         height: 50.0,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(
                    //                 color: Colors.red,
                    //                 style: BorderStyle.solid,
                    //                 width: 1),
                    //             borderRadius: BorderRadius.circular(14.0)),
                    //         child: Center(
                    //           child: Icon(Icons.ac_unit_sharp),
                    //         ),
                    //       ),
                    //       Container(
                    //         width: 60.0,
                    //         height: 50.0,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(
                    //                 color: Colors.red,
                    //                 style: BorderStyle.solid,
                    //                 width: 1),
                    //             borderRadius: BorderRadius.circular(14.0)),
                    //         child: Center(
                    //           child: Icon(Icons.ac_unit_sharp),
                    //         ),
                    //       ),
                    //     ],
                    //   )
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
