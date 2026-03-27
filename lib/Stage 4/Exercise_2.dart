//     • Home screen: List of tasks
// • Add Task screen: Enter new tasks and pass back to home.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  final String? task;
  const HomeScreen({super.key, required this.task});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List task")),
      body: Column(
        children: [
          Container(
            child: const Text("Task today $task"),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

// * Second screen to add Task
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState => _Second();
}

class _Second extends State<SecondScreen> {

  final TextInputControl nameController = TextInputControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Column(
        children: [
          
        ],
      ),
    )
  }
}
