import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'Exercise_2.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  bool? isDone = true;

  Task({required this.title, required this.description});
}

class HiveTask extends StatefulWidget {
  const HiveTask({super.key});

  @override
  State<HiveTask> createState() => _HiveTaskState();
}

class _HiveTaskState extends State<HiveTask> {
  var taskBox = Hive.box('MyTasks');
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive + Text fields'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: title,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task title",
                labelText: "Title"),
          ),
          TextField(
            controller: description,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task description",
                labelText: "Description"),
          ),
          ElevatedButton(
              onPressed: () {
                var titleTask = title.text;
                if (titleTask.isNotEmpty) {
                  taskBox.add(titleTask);
                }

                var descriptionTask = description.text;

                if (descriptionTask.isNotEmpty) {
                  taskBox.add(descriptionTask);
                }

                description.clear();
                title.clear();
                setState(() {});
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
