// Hive = fast, lightweight NoSQL database for Flutter/Dart
// flutter pub add hive:^2.2.3

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part '2.g.dart'; // used for code generation -> it is like translator which convert your model class into format hive can store;

// * storing object: you will need a model class and TypeAdapter
@HiveType(typeId: 0) // unique typeId for this model class
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  Task({required this.title, this.isDone = false});
}

// the other configuration are done in maain.dart
void hiveOperatiob() async {
  var box =
      await Hive.box('MyBox'); // box is storage which will store your data
  // Basic operation
  // 1. Save data
  box.put('name', 'etiene');
  box.put('age', 2);

  // 2. load the data
  var name = box.get('name');
  var age = box.get('age');

  // delete data
  box.delete('name');
  box.deleteAt(0); // delete the value of first index
  box.clear(); // removes everything in the box

// Object
  var taskBox = Hive.box<Task>('tasks');
  var task = Task(title: 'Learn Hive');

  taskBox.add(task);

  // get task
  var taskList = taskBox.values.toList();
  for (var t in taskList) {
    print(t.title);
  }

// update task
  var singleTask = taskBox.getAt(0);
  singleTask!.isDone = true;
  taskBox.putAt(0, singleTask);

  // delete the task

  taskBox.deleteAt(0);
}

// flutter packages pub run build_runner build: this command generate .g.dart file
// dart run build_runner build --delete-conflicting-outputs: generate the .g.dart file with the same folder of your  model
