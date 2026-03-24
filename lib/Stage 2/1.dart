// ListView & GridView

import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lists')),
        body: Center(
            //   child:  ListView(
            //     children: [
            //         const ListTile(title: Text('List 1')),
            //         const ListTile(title: Text('List 2')),
            //         const ListTile(title: Text('List 3')),
            //         const ListTile(title: Text('List 4')),
            //         const ListTile(title: Text('List 5')),
            //     ],
            //   )

            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text("Item $index"),
            //       );
            //     },
            //   ),

            child:
                //  GridView.count(
                //     crossAxisCount: 2, // 2 column
                //     children: [
                //         Container(color: Colors.red),
                //         Container(color: Colors.green),
                //         Container(color: Colors.blue)
                //     ],
                // ),

                // GridView.builder(
                //     itemCount: 8,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2),
                //     itemBuilder: (context, index) {
                //       return Container(
                //         margin: const EdgeInsets.all(10),
                //         color: Colors.blue,
                //         child: Center(
                //           child: Text("Item $index"),
                //         ),
                //       );
                //     }
                //    )

                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 20; i ++)
                         Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          color: Colors.blue,
                          child: Text("Item $i"),
                         )
                    ],
                  ),
                  )
                 )
                );
  }
}
