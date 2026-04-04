import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part '3.g.dart';
// Create a table structure
class Task extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
}

// run: flutter pub run build_runner build:  to generate all database helper
// flutter pub run build_runner build --delete-conflicting-outputs
// create a database class
@DriftDatabase(tables: [Task])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Perform crud Operation
Future<void> insetTask(TaskCompanion task) => into(task).insert(task);

