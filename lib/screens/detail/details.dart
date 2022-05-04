/* import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:homework/models/task.dart';

IMPROVEMENT!!!! 

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  final Task task;

  _DetailsPageState createState() => _DetailsPageState(this.task);
}

class _DetailsPageState extends State<DetailsPage> {
  final Task task;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  _DetailsPageState(this.task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TableCalendar(
                firstDay: DateTime.utc(2021, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              )
            ]),
          ))
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new),
        iconSize: 20,
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
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
                'You have ${task.left} tasks for today!',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ]),
      ),
    );
  }
}
 */