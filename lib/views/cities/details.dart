import 'package:flutter/material.dart';

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

  @override
  Widget infoCard(String cardTitle, String info, String unit) {
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
                child: Icon(Icons.ac_unit_sharp,
                    color:
                        cardTitle == selected ? Colors.white : Colors.black)),
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
                  Text("unit" + unit)
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
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text("Detalhes da Cidade"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                  child: Text(
                widget.cityName + ", " + widget.coutryCode,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30)),
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
                      "Max: 29 C",
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
                          "Raining",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 25.0,
                          width: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.amber),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Min: "), Text("18 C")],
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
                          infoCard("SUNRISE", "2.0083", "W"),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0)),
                          infoCard("SUNSET", "2.0083", "S"),
                          infoCard("PRESSURE", "2.0083", "P")
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
                                  fontSize: 16.0, fontWeight: FontWeight.w300)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
