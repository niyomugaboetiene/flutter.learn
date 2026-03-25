import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _MyExercise();
}

class _MyExercise extends State<Exercise2> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminding"),
      ),
      body: Center(child: Text("$count")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {increment()},
        child: const Text("Increment"),
      ),
    );
  }
}
