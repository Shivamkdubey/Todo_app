import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/tasks_list.dart';
import 'add_task_screen.dart';

List<Tasks> tasks = [];

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddTaskScreen((newTask) {
                setState(() {
                  tasks.add(Tasks(name: newTask));
                  print('123$newTask');
                });
                Navigator.pop(context);
              }),
            );
          },
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                    Text(
                      '${tasks.length}  Tasks',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: TasksList(tasks),
                ),
              ),
            ],
          ),
        ));
  }
}

class Tasks {
  String name;
  bool isDone;
  Tasks({this.name, this.isDone = false});
  void toggle() {
    isDone = !isDone;
  }
}
