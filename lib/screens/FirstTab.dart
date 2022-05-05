import 'package:flutter/material.dart';
import 'package:homework/constants/colors.dart';
import 'package:homework/database_helper.dart';
import 'package:homework/screens/Profile.dart';
import 'package:homework/screens/home/widgets/your_goals.dart';
import 'package:homework/screens/home/widgets/tasks.dart';
import 'taskpage.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key, required this.dbHelper}) : super(key: key);
  final DatabaseHelper dbHelper;
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YourGoals(),
          Flexible(
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Your daily goals:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          Flexible(
            flex: 5,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Taskpage()),
                      ));
                },
                child: Tasks()),
          ),
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
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.more_vert),
          highlightColor: kYellowDark,
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile(dbHelper: widget.dbHelper)),
            );
          },
        ),
      ],
    );
  }
}
