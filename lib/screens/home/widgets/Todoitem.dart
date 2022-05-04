import 'package:flutter/material.dart';
import 'package:homework/screens/home/widgets/todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    // ignore: prefer_const_constructors
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        radius: 15,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 99, 104, 151),
        child: Icon(Icons.brightness_1_rounded),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}
