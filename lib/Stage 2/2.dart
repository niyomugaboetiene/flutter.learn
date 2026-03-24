import 'package:flutter/material.dart';

class Flexble extends StatelessWidget {
  const Flexble({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flexbile & Expanded")),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.blue),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.green),
          )
        ],
      ),
    );
  }
}
