import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid View")),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //       return Container(
      //         color: Colors.blue,
      //         child: Center(
      //           child: Text("Box $index"),
      //         ),
      //       );
      //   }),

      body: GridView.builder(
          itemCount: 12,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
           return Center(
              child: Container(
                color: Colors.blue,
                child: Center(child: Text("Box $index")),
              ),
            );
          }),
    );
  }
}
