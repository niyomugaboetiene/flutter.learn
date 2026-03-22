// ~ We will learn Container, Stack, Padding, Margin, Alignment in this second part
// 1. Container

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
      appBar: AppBar(title: const Text("Layout Example")),

      body: Container(
        width: 200,
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,

        child: const Text(
          'Container Example',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    ));
  }
}
