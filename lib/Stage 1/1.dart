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

    //  body: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Center(child: Image.asset('assets/images/3079588.jpg', width: 120, height: 120)),
    //     Text('Hello'),
    //     Icon(Icons.home, size: 12,)
    //   ],
    //  ),

    body: Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),

        child: SizedBox(
          width: 150,

          child: Column(
            children: [
              Image.asset(
                'assets/images/3079588.jpg', scale: 1,
                height: 150, width: 150, fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              const Text(
                'Etiene Niyomugabo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               const SizedBox(height: 5),

               const Text(
                'FLutter Learner and Developer',
                style: TextStyle(fontSize: 16, color: Colors.green),
               )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
