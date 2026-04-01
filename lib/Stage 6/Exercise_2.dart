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
  bool? isDone;

  Task({required this.title, required this.description, required this.isDone});
}

class HiveTask extends StatefulWidget {
  const HiveTask({super.key});

  @override
  State<HiveTask> createState() => _HiveTaskState();
}

class _HiveTaskState extends State<HiveTask> {
  var task = Hive.box<Task>('MyTasks');

}
