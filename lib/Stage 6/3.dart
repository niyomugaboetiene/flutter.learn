import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_privider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

// Create a table structure
class Task extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text();
  TextColumn get description => text();
  BoolColumn get 
}