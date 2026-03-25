import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _MyExercise();
}

class _MyExercise extends State<Exercise2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int count = 0;
  String? name;
  String? age;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reminding"),
        ),
        // body: Center(child: Text("$count")),
        // floatingActionButton: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: FloatingActionButton(
        //     onPressed: () => {increment()},
        //     child: const Icon(Icons.add),
        //   ),
        // )
        body: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Name", hintText: "Enter your name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                  hintText: "Enter your age", labelText: "Age"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = nameController.text;
                    age = ageController.text;
                  });
                },
                child: const Text("Submit")),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(children: [
                Text("Your Name ${nameController.text}"),
                Text("Your Age ${ageController.text}")
              ]),
            )
          ],
        ));
  }
}
