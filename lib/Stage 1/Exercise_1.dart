import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Layout'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: SizedBox(
            width: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/3079588.jpg', width: 120, height: 120),
                    const SizedBox(height: 20),

                    const Text('Machine learning allow computer to learn from the pattern',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),


                const SizedBox(height: 20),
                const Text('Machine Learning',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
