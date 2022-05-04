import 'package:flutter/material.dart';

class GoalsForTheDay extends StatelessWidget {
  final Map<String, dynamic> detail;
  GoalsForTheDay(this.detail);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detail['title'].isNotEmpty
                        ? _buildCard(detail['bgColor'], detail['title'])
                        : Container(
                            color: Colors.white,
                          )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildCard(Color bgColor, String title) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: TextStyle(fontSize: 15))],
      ),
    );
  }
}
