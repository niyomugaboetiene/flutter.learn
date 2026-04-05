import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/Stage%207/1_Exercise/Provider.dart';
import 'package:provider/provider.dart';

class Access extends StatelessWidget {
  const Access({super.key});

  @override
  Widget build(BuildContext context) {
    final inputName = context.watch<InputFieldModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Input Field + Provider"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              context.read<InputFieldModel>().updateName(value);
            },

            decoration: InputDecoration(
              hintText: "Enter your name"
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [ BoxShadow(
                offset: Offset(2, 2),
                color: Colors.black,
                blurRadius: 5.0
              ) 
              ]
            ),
            child: Consumer<InputFieldModel>(builder: (_, provider, __) {
              return Text("Hello ${provider.name}");
            }),
          )
        ],
      ),
    );
  }
}
