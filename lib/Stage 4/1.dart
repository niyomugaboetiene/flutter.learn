// Navigation: Moving from one screen to another

import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({ super.key });

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FIrst screen")),
      body: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
             builder:(context) => const SecondScreen();
            ),
           )
        },
      ),
    )
  }
}