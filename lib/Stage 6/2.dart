// Hive = fast, lightweight NoSQL database for Flutter/Dart
// flutter pub add hive:^2.2.3

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart'; // used for code generation -> it is like translator which convert your model class into format hive can store;

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

 
}
 // * storing object: you will need a model class and TypeAdapter
  @HiveType(typeId: 0) // unique typeId for this model class
  class Task {
        @HiveField(0)
        String title;

        @HiveField(1)
        bool isDone;

        Task({ required this.title, this.isDone = false });
  }