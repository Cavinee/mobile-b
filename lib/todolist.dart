import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List tasks = [
    ["Task 1", "This is Task 1", false],
    ["Task 2", "This is Task 2", false],
    ["Task 3", "This is Task 3", false],
    ["Task 4", "This is Task 4", false],
  ];

  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();

  void changeStatus(int index) {
    setState(() {
      List task = tasks[index];
      task[2] = !task[2];
    });
  }

  void addTask(String taskName, String taskDesc) {
    setState(() {
      tasks.add([taskName, taskDesc, false]);
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("To-Do List") 
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          List task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task[2],
              onChanged: (value) {
                changeStatus(index);
              },
            ),
            title: (task[2]) ? Text(task[0], style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)) : Text(task[0]),
            subtitle: (task[2]) ? Text(task[1], style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)) : Text(task[1]),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                removeTask(index);
              },
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          return showDialog(
            context: context,
            builder:(context) {
              return AlertDialog(
                title: const Text("Add New Task"),
                content: SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      TextField(
                        controller: taskNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        )
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: taskDescController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        )
                      )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      addTask(taskNameController.text, taskDescController.text);
                      taskNameController.clear();
                      taskDescController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Add Task")
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}