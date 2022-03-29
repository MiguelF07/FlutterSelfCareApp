import 'package:flutter/material.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';
import './ThirdScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primaryColor:
          ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 41, 60, 172),
            title: Text('Self Care'),
            bottom: TabBar(
              indicatorColor: Colors.grey,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.access_alarm_rounded), text: "Focus"),
                Tab(icon: Icon(Icons.article_rounded), text: "Journal"),
                Tab(icon: Icon(Icons.account_circle_rounded), text: "About Me")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
