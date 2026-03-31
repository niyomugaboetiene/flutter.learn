// Hive = fast, lightweight NoSQL database for Flutter/Dart
// flutter pub add hive:^2.2.3

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// the other configuration are done in maain.dart
var box = Hive.box('MyBox'); // box is storage which will store your data