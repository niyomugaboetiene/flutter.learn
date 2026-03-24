import 'package:flutter/material.dart';

class Flexble extends StatelessWidget {
  const Flexble({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flexbile & Expanded")),
      body: Row(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Container(color: Colors.amberAccent),
          // ),
          // Expanded(
          //   flex: 1,
          //   child: Container(color: Colors.green),
          // )

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.cyan,
              child: const Text("Box 1"),
            )
          ),

          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              child: const Text("Box 2"),
            )
          ),

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.brown,
              child: const Text("Box 3"),
            )
          ),
        ],
      ),
    );
  }
}
