import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo/task_screen.dart';

class TasksList extends StatefulWidget {
  final List<Tasks> tasks;
  TasksList(this.tasks);
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          title: tasks[index].name,
          checkBoxCallback: (checkBoxState) {
            setState(() {
              tasks[index].toggle();
              print(123456);
            });
          },
          isChecked: tasks[index].isDone,
        );
      },
      itemCount: tasks.length,
    );
  }
}
