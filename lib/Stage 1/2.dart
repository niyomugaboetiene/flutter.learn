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

      body: Center(child: Container(
        width: 200,
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
            color: Colors.black12,
          )
          ]
        ),
      

        child: const Text(
          'Container Example',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        ) 
       ),
    ));
  }
}
