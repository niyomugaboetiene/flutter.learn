import 'package:flutter/material.dart';
// import 'package:flutter_concepts/Stage 1/1.dart';
// import 'package:flutter_concepts/Stage 1/Exercise_1.dart';
// import 'package:flutter_concepts/Stage 1/2.dart';
// import 'package:flutter_concepts/Stage 1/Exercise_2.dart';
// import 'package:flutter_concepts/Stage 1/3.dart';
// import 'package:flutter_concepts/Stage 1/Exercise_3.dart';
// import 'package:flutter_concepts/Stage 2/1.dart';
// import 'package:flutter_concepts/Stage 2/Exercise_1.dart';
// import 'package:flutter_concepts/Stage 2/2.dart';
// import 'package:flutter_concepts/Stage 3/1.dart';
// import 'package:flutter_concepts/Stage 3/2.dart';
// import 'package:flutter_concepts/Stage 3/Exercise_2.dart';
// import 'package:flutter_concepts/Stage 4/1.dart';
// import 'package:flutter_concepts/Stage 4/Exercise_2.dart';
// import 'package:flutter_concepts/Stage 5/1.dart';
// import 'Stage 5/WeatherApp.dart';
// import 'package:flutter_concepts/Stage 6/1.dart';
import 'package:flutter_concepts/Stage 6/Theme.dart';
import 'package:flutter_concepts/Stage%206/2.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// void main() {
//   runApp(const MyApp());
//   fetchPost(); // from API
// }
void main() async {
  // * Hive configuration

  WidgetsFlutterBinding
      .ensureInitialized(); // ensure flutter in fully initialized before the app runs

  await Hive.initFlutter(); // initialize Hive for flutter

  // await Hive.openBox('MyBox'); // open a box (storage)

  // Register my adapter
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/add': () =>  TextFields()
      // },
      title: 'My App',
      home: Themes(),
    );
  }
}


// then navigate
// Navigator.pushnamed(context, '/add)
// 