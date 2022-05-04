import 'package:flutter/material.dart';
import 'package:homework/constants/colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool last;
  List<Map<String, dynamic>>? description;

  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.description,
      this.last = false});
  static List<Task> generateTask() {
    return [
      Task(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: kYellowLight,
          btnColor: kYellow,
          iconColor: kYellowDark,
          left: 1,
          done: 1,
          description: [
            {'title': 'Stress less', 'bgColor': kYellowLight},
            {'title': 'Read 20 pages', 'bgColor': kYellowLight}
          ]),
      Task(
          iconData: Icons.cases_rounded,
          title: 'University',
          bgColor: kBlueLight,
          btnColor: kBlue,
          iconColor: kBlueDark,
          left: 1,
          done: 1,
          description: [
            {'title': 'Study ICM', 'bgColor': kBlueLight},
            {'title': 'Do TQS Work', 'bgColor': kBlueLight},
          ]),
      Task(
          iconData: Icons.favorite_sharp,
          title: 'Health',
          bgColor: kRedLight,
          btnColor: kRed,
          iconColor: kRedDark,
          left: 3,
          done: 0,
          description: [
            {'title': 'Go to the gym', 'bgColor': kRedLight},
            {'title': 'Walk 12.000 steps', 'bgColor': kRedLight},
            {'title': 'Drink 2 litres of water', 'bgColor': kRedLight},
          ]),
      Task(
        iconData: Icons.people,
        title: 'Social',
        bgColor: kGreenLight,
        btnColor: kGreen,
        iconColor: kGreenDark,
        left: 1,
        done: 0,
      ),
      Task(last: true)
    ];
  }
}
