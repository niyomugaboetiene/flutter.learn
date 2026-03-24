// * State: Data which can change
// * createState is lifecycle methood called when state is created

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyStatefullWidget();
}

class _MyStatefullWidget extends State<MyWidget> {
  int number = 0;

  void increase() {
    setState(() {
      number++;
    });
  } 
   void decrease() {
    setState(() {
      number--;
    });
  }  
  void reset() {
    setState(() {
      number = number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Counter")),
        body: Center(child: Text("$number")),
        floatingActionButton: FloatingActionButton(
          onPressed: increase,
          child: const Icon(Icons.add),
        ),
      );
  }
}
