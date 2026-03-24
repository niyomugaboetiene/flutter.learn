import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextState();
}

class _TextState extends State<TextFields> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text State")),
      // body: const TextField(
      //   decoration: InputDecoration(
      //     hintText: 'Enter your name',
      //     labelText: 'Name'
      //   ),
      // ),

      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                hintText: "Enter your name"
            ),
         ),

         ElevatedButton(
          onPressed: () {
            print("Nmae ${nameController.text}");
          }, 
          child: const Text("Submit")
        )
        ],  
      )
    );
  }
}
