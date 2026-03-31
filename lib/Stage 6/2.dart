// Hive = fast, lightweight NoSQL database for Flutter/Dart
// flutter pub add hive:^2.2.3

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// the other configuration are done in maain.dart
void hiveOperatiob() async {
  var box =
      await Hive.box('MyBox'); // box is storage which will store your data
  // Basic operation
  // 1. Save data
  box.put('name', 'etiene');
  box.put('age', 2);

  // 2. load the data
}
