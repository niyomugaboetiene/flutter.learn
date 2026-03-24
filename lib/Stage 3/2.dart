import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextState();
}

class _TextState extends State<TextFields> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text State")),
      body: TextField(
        decoration: InputDecoration(
         hintText: 'Enter your name',
         label: 'Name'
        ),
      ),
    )
  }
}
