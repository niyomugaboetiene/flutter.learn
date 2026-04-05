import 'package:flutter/material.dart';
import 'package:flutter_concepts/Stage%207/1_Provider.dart';
import 'package:provider/provider.dart';
// Consumer for updating small part

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
        body: Center(
          child: Consumer<CounterModel>(
          builder: (context, value, child) {
          return Text('${value.count}');
        })
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterModel>().increment();
              },
              child: Text("Add"),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterModel>().reset();
              },
              child: Text("reset"),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterModel>().decrement();
              },
              child: Text("remove"),
            ),
          ],
        ));
  }
}
