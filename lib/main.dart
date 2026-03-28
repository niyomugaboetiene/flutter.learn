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
import 'package:flutter_concepts/Stage 3/2.dart';
// import 'package:flutter_concepts/Stage 3/Exercise_2.dart';
// import 'package:flutter_concepts/Stage 4/1.dart';
// import 'package:flutter_concepts/Stage 4/Exercise_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      initialRoute: '/',
      routes: {
        '/add': () =>  TextFields()
      },
       title: 'My App',
      //  home:  HomeScreen(),   
    );
  }
}
