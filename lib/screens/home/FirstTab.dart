import 'package:flutter/material.dart';
import 'package:homework/api/weather_api.dart';
import 'package:homework/models/weather_forecast_hourly.dart';
import 'package:homework/screens/home/widgets/weather_widget.dart';
import 'package:homework/screens/home/widgets/your_goals.dart';
import 'package:homework/screens/home/widgets/tasks.dart';
import 'package:homework/widgets/main_screen_weather/main_screen_widget.dart';
import '../taskpage.dart';
import 'package:homework/widgets/main_screen_weather/main_screen_model.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  void mockFunction() {
    1 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YourGoals(),
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your daily goals:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Taskpage()),
                  ));
            },
            child: Tasks(),
          )),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, //noshadow
      title: Row(children: [
        Container(
          height: 45,
          width: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/carlota.jpeg'),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Hi, Carlota!',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        )
      ]),
      actions: const [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}
