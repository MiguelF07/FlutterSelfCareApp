// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';

class SecondTab extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              search(),
              _space(50.0),
              prettyContainer('Day 16/03/2022',
                  'What a great day. Met someone really cool.'),
              _space(40.0),
              prettyContainer('Day 14/03/2022', 'Feeling kinda tired :/'),
              _space(40.0),
              prettyContainer('Day 10/03/2022', 'Starting a new journey'),
              _space(50.0)
            ],
          ),
        ));
  }

  @override
  Widget search() => Column(children: [
        Container(
            child: Container(
                width: double.infinity,
                height: 150.0,
                child: Center(
                  child: Text(
                    "My Journal",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ))),
        Container(
            width: 550.0,
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'What are you thinking about today?',
            ))),
      ]);
}

Widget _space(double x) {
  return SizedBox(height: x);
}

Widget _text() {
  return Text("lksdajf");
}

Widget prettyContainer(String tit, String sub) {
  return FancyContainer(
    onTap: () {},
    color1: Color.fromARGB(255, 255, 255, 255),
    color2: Color.fromARGB(255, 255, 255, 255),
    title: tit,
    textcolor: Colors.black,
    subtitle: sub,
    subtitlecolor: Colors.black,
    width: 600,
  );
}
