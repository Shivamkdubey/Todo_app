import 'package:flutter/material.dart';
import 'task_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    String task;
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757570),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.lightBlueAccent),
                ),
                TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      task = value;
                    }),
                FlatButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    addTaskCallback(task);
                    print(tasks[tasks.length - 1].name);
                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
