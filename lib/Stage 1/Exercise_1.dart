import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Layout'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: SizedBox(
            width: 200,
            child: Column(children: [
              Image.asset('assets/images/3079588.jpg'),
              const SizedBox(height: 20),
              Text('Machine Learning',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              const SizedBox(height: 20),
              Text('Machine learning allow computer to learn from the pattern',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
        ),
      ),
    );
  }
}
