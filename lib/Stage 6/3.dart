import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part '3.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlit'));
    return NativeDatabase(file);
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
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Perform crud Operation
  // 1. insert
   Future<void> insetTask(TasksCompanion task) => into(tasks).insert(task);
  // 2. Select
  

}

