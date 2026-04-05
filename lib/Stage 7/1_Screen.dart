
import 'package:flutter/material.dart';
import 'package:flutter_concepts/Stage%207/1_Provider.dart';
import 'package:provider/provider.dart';

class ConsumerScreen extends StatelessWidget {
  const ConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter + Provider"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(child: Text('${counter.count}')),
      
      floatingActionButton: Column(
        children: [
             FloatingActionButton(
               onPressed: () {
               context.read<CounterModel>().increment();
             },
              child: Text("Add"),
             ),
         ],
      )
    );
  }
}
