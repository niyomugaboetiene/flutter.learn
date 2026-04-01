import 'package:flutter/material.dart';
import 'package:flutter_concepts/Stage%206/2.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'Exercise_2.g.dart';

@HiveType(typeId: 0)
class Tasks {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  bool isDone;

  Tasks({required this.title, required this.description, this.isDone = false});
}

class HiveTask extends StatefulWidget {
  const HiveTask({super.key});

  @override
  State<HiveTask> createState() => _HiveTaskState();
}

class _HiveTaskState extends State<HiveTask> {
  var taskBox = Hive.box<Tasks>('MyTasks');
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive + Text fields'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: title,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task title",
                labelText: "Title"),
          ),
          TextField(
            controller: description,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task description",
                labelText: "Description"),
          ),
          ElevatedButton(
              onPressed: () {
                var titleTask = title.text;
               var descriptionTask = description.text;
                if (titleTask.isNotEmpty && descriptionTask.isNotEmpty) {
                  taskBox.add(
                    Tasks(
                    title: titleTask,
                    description: descriptionTask
                    ));
                }


                description.clear();
                title.clear();
                setState(() {});
              },
              child: const Text("Save")),

          Expanded(
              child: ValueListenableBuilder(
              valueListenable: taskBox.listenable(),
              builder: (context, Box<Tasks> box, _) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text("No task yet"),
                  );
              }

              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final task = box.getAt(index);

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(22),
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(task?.title ?? ""),
                        IconButton(
                            onPressed: () {
                              box.deleteAt(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  );
                },
              );
            },
          )
          )
        ],
      ),
    );
  }
}
