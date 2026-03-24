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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Counter")),
        body: Center(
          floatingActionBUtton: FloatingActionButton(onPressed: increase, child: Icon(Icon.add)),
        )
      );
  }
}
