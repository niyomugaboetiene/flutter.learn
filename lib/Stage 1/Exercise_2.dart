import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Example'),
        ),

        body: Container(
          width: 250, height: 250, color: Colors.grey,

          child: Stack(
            children: [
              Container(
                width: 250, height: 150, color: Colors.blue,
              ),
            
              const Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.heat_pump_rounded, color: Colors.red),
              ),

              const Align(
                 alignment: Alignment.topLeft,
                 child: Text('Hello this is Stack Example'),
              )
            ],
          ),
        ),
    );
  }
}
