import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part '3.g.dart';

// configure where and how to store database in the device
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory(); // get location where the db is stored
    final file = File(p.join(dbFolder.path, 'db.sqlite')); // create a file to store our database
    return NativeDatabase(file); // allows to perform query executor: INSERT, UPDATE,DELETE, ...
  });
}

// Create a table structure
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
}

// run: flutter pub run build_runner build:  to generate all database helper
// flutter pub run build_runner build --delete-conflicting-outputs

// create a database class
@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()); // allows you to parse the query executor

  @override
  int get schemaVersion => 1; // for managing database migration

  // Perform crud Operation
  // 1. insert
  // TasksCompanion is helper class allows you to pass data into tasks table from Tasks class
  Future<void> insetTask(TasksCompanion task) => into(tasks).insert(task);

  // 2. Select
  Future<List<Task>> getAllTask() => select(tasks).get();

  // 3. update
  Future<bool> updateTask(Task task) => update(tasks).replace(task);

  // 4. delete task
  // where is filter for deleting only specified id
  Future<int> deleteTask(int id) => (delete(tasks)..where((t) => t.id.equals(id))).go();
}

