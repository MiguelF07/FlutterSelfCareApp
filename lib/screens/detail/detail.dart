import 'package:flutter/material.dart';
import 'package:homework/models/task.dart';
import 'package:homework/screens/detail/widgets/datepicker.dart';
import 'package:homework/screens/detail/widgets/goalsday.dart';
import 'package:homework/screens/detail/widgets/task_title.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detailList = task.description;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: task.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [DatePicker(), TaskTitle()]),
              ),
            ),
            detailList == null
                ? SliverFillRemaining(
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          'No goals for today!',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ))))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (_, index) => GoalsForTheDay(detailList[index]),
                        childCount: detailList.length))
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        iconSize: 20,
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
          color: Colors.black,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${task.title} tasks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 5),
              Text(
                'You have these goals for today!',
                style: TextStyle(fontSize: 13, color: Colors.black),
              )
            ]),
      ),
    );
  }
}
