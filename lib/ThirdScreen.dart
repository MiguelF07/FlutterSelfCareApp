// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.blue,
                      Color.fromARGB(255, 20, 77, 175)
                    ])),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/147/147144.png",
                          ),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Miguel",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Journal Entries",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 77, 175),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Photos",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 77, 175),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Start Date",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 77, 175),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "21/02/2022",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Motto of Life:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 77, 175),
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Live and let live.",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "About Myself:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 77, 175),
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent

                        children: <TextSpan>[
                          new TextSpan(
                            text: 'Name:',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 20, 77, 175),
                                fontWeight: FontWeight.bold),
                          ),
                          new TextSpan(
                              text: ' Miguel',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent

                        children: <TextSpan>[
                          new TextSpan(
                            text: 'Age:',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 20, 77, 175),
                                fontWeight: FontWeight.bold),
                          ),
                          new TextSpan(
                              text: ' 22',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
