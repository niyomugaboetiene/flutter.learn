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

  Tasks({required this.title, required this.description, this.isDone = true});
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
  Tasks? editingTask;
  int? editingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive + Text fields'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text("To Do App", style: TextStyle(color: Colors.blue, fontSize: 20)),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: title,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task title",
                labelText: "Title"),
          ),
          const SizedBox(
            height: 15,
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
                editingTask!.title = titleTask;
                editingTask!.description = descriptionTask;

                if (titleTask.isEmpty || descriptionTask.isEmpty) return;

                if (editingTask != null && editingIndex != null) {
                  editingTask!.title = titleTask;
                  editingTask!.description = descriptionTask;

                  taskBox.putAt(editingIndex!, editingTask!);

                  editingIndex = null;
                  editingTask = null;
                } else {
                  taskBox.add(
                      Tasks(title: titleTask, description: descriptionTask));
                }
                
                description.clear();
                title.clear();
                setState(() {});
              },
              child: Text(editingTask != null ? "Update" : "Save")),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Recents",
            style: TextStyle(color: Colors.blue, fontSize: 20, wordSpacing: 12),
          ),
          const SizedBox(
            height: 12,
          ),
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black12,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            value: task?.isDone ?? false,
                            onChanged: (value) {
                              if (task != null) {
                                task.isDone = value ?? false;
                                box.putAt(index, task);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task?.title ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: (task?.isDone ?? false)
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                task?.description ?? "",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: (task?.isDone ?? false)
                                ? Colors.green
                                : Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            (task?.isDone ?? false) ? "Done" : "Pending",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        IconButton(
                          onPressed: () {
                            box.deleteAt(index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {
                            if (task != null) {
                              title.text = task.title ?? "";
                              description.text = task.description ?? "";

                              editingTask = task;
                              editingIndex = index;
                            }
                          },
                          icon: const Icon(Icons.edit, color: Colors.green),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
