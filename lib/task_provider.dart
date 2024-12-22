import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  final List _tasks = [
    ["Task 1", "This is Task 1", false],
    ["Task 2", "This is Task 2", false],
    ["Task 3", "This is Task 3", false],
    ["Task 4", "This is Task 4", false],
  ];

  List get tasks => _tasks;

  void changeStatus(int index) {
    List task = _tasks[index];
    task[2] = !task[2];
    notifyListeners();
  }

  void addTask(String taskName, String taskDesc) {
    _tasks.add([taskName, taskDesc, false]);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}