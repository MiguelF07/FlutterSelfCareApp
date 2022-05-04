// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class YourGoals extends StatelessWidget {
  const YourGoals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 89, 152, 184),
              borderRadius: BorderRadius.circular(20)),
          child: Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(249, 255, 182, 45),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.emoji_emotions,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Did you accomplished your daily goals?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Check in here!',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
