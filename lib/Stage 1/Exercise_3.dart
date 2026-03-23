import 'package:flutter/material.dart';

class ButtonsExercise extends StatelessWidget {
  const ButtonsExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => {},
            child:  Text("Elevated button"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(20)),
          ),
          TextButton(
              onPressed: () => {},
              child: const Text(
                "Text Button",
                style: TextStyle(color: Colors.red),
              )),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
