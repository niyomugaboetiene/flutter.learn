// ListView & GridView

import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Buttons')),
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

          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Item $index"),
              );
            },
          ),
        ));
  }
}
