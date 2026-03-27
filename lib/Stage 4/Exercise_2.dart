//     • Home screen: List of tasks
// • Add Task screen: Enter new tasks and pass back to home.

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.task});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List task")),
      body: Column(
        children: [
          IconButton(
              onPressed: () async {
                final newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );

                if (newTask != null) {
                  setState(() {
                    task = newTask;
                  });
                }
              },
              icon: const Icon(Icons.add)),
          Container(
            child: Text("Task today $task"),
          ),
        ],
      ),
    );
  }
}

// * Second screen to add Task
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _Second();
}

class _Second extends State<SecondScreen> {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(
                hintText: "Enter your task today", labelText: "Task"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  task: taskController.text
                );
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
