// ListView & GridView


import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Center(
     
      child:  ListView(
        children: [
            const Text('List 1'),
            const Text('List 2'),
            const Text('List 3'),
            const Text('List 4'),
            const Text('List 5'),
        ],
      )
    )
    );
  }
}
