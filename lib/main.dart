import 'package:flutter/material.dart';
import 'screens/FirstTab.dart';
import 'screens/SecondTab.dart';
import 'screens/ThirdTab.dart';
import 'screens/FourthTab.dart';
import 'screens/WeatherTab.dart';
import 'database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BetterYou',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'BetterYou'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> l = <Widget>[
      FirstTab(dbHelper: dbHelper),
      SecondTab(dbHelper: dbHelper),
      WeatherTab(),
      ThirdTab(),
      FourthTab(),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Focus',
            ),
            BottomNavigationBarItem(
              //icon: Icon(Icons.map),
              icon: Icon(Icons.directions_run),
              label: 'Exercise',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: l[_selectedIndex]);
  }
}
