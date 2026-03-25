// Form

import 'package:flutter/material.dart';

class FOrm extends StatefulWidget {
  const FOrm({super.key});

  @override
  State<FOrm> createState() => _FomrState();
}

class _FomrState extends State<FOrm> {
  final TextEditingController nameController = TextEditingController();
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Text State")),
        body: Form(
          key: _keyform,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Enter name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can not be null";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_keyform.currentState!.validate()) {
                      print("Name ${nameController.text}");
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        )
      );
  }
}
