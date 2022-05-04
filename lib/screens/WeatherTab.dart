import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'WeatherData.dart';

class WeatherTab extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherTab> {
  late Future<WeatherData> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchWeather();
  }

  Future<WeatherData> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.ipma.pt/open-data/forecast/meteorology/cities/daily/1010500.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherData>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return Text(snapshot.data!.date);
          return SingleChildScrollView(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Weather Statistics for Today",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))
              ]),
              Row(
                children: [
                  Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Country:  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.country,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Region:  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.region,
                                      // "Aveiro",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Date:  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.date,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Precipitation (%)  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.probPrec,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Min (ºC)  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.tMin,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Max (ºC)  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.tMax,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Wind Direction  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      snapshot.data!.windDir,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                              ]),
                            ],
                          ))),
                ],
              )
            ]),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
