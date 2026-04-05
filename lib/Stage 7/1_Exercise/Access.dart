import 'package:flutter/material.dart';
import 'package:flutter_concepts/Stage%207/1_Exercise/Provider.dart';
import 'package:provider/provider.dart';

class Access extends StatelessWidget {
  const Access({super.key});

  @override
  Widget build(BuildContext context) {
    final inputName = context.watch<InputFieldModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Input Field + Provider"),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          TextField(
            onChanged: (value) {
              context.read<InputFieldModel>().updateName(value);
            },
          )
        ],
      ),
    )
  }
}
