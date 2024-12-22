import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class ToDoListProvider extends StatefulWidget {
  const ToDoListProvider({super.key});

  @override
  State<ToDoListProvider> createState() => _ToDoListProviderState();
}

class _ToDoListProviderState extends State<ToDoListProvider> {
  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();

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
      body: Consumer<Task>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              List task = provider.tasks[index];
              return ListTile(
                leading: Checkbox(
                  value: task[2],
                  onChanged: (value) {
                    provider.changeStatus(index);
                  },
                ),
                title: (task[2]) ? Text(task[0], style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)) : Text(task[0]),
                subtitle: (task[2]) ? Text(task[1], style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)) : Text(task[1]),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    provider.removeTask(index);
                  },
                )
              );
            },
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
                      Provider.of<Task>(context, listen: false).addTask(taskNameController.text, taskDescController.text);
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