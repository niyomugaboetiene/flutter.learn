//     • Home screen: List of tasks
// • Add Task screen: Enter new tasks and pass back to home.

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? task;
  const HomeScreen({super.key, required this.task});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List task")),
      body: Container(
        child: Text(
          "Task today $task"
        ),
      ),
    );
  }
}
