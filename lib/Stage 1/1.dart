// We will learn Text, Image, Icons Here

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page')
      ),
      
      // body:  Center(
      //  child: Text('Welcome to home page'),
      //  child: Image.network('https://via.placeholder.com/150'),
      //  child: Image.asset('SRC'),
      //  child:  Icon(Icons.heart_broken),
        
      // ),

     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/images/3079588.jpg', width: 120, height: 120)),
        Text('Hello'),
        Icon(Icons.home, size: 12,)
      ],
     ),
    );
  }
}
