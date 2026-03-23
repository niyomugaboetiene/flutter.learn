// Buttons (Elevated, TextButton, IconButton)

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Center(
      //  ElevatedButton(
      //   onPressed: () => {},
      //   child: const Text("Click me"),
      //   style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.blue, padding: const EdgeInsets.all(20)),
      // ),
      child: TextButton(
        onPressed: () => {},
        child: const Text("Cancel", style: TextStyle(color: Colors.red)),

      )
    )
    );
  }
}
