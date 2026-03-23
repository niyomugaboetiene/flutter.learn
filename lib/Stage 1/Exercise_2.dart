import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Example'),
        ),

        body: Container(
          width: 250, height: 250, color: Colors.grey,
        ),
    );
  }
}
