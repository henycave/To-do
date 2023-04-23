import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_river/task/Data/task_repository.dart';
import 'package:to_do_river/task/Domain/task.dart';

final taskServiceProvider = ChangeNotifierProvider<TaskService>((ref) {
  return TaskService();
});

class TaskService extends ChangeNotifier {
  final TaskRepository _taskRepo = TaskRepository();

  List<Task> _tasks = [];
  int _colorIndex = 0;
  bool _isLoading = false;

  int get colorIndex => _colorIndex;
  set setColorIndex(int index) {
    _colorIndex = index;
    notifyListeners();
  }

  List<Task> get tasks => _tasks;
  set setTasks(List<Task> tasks) {
    _tasks = tasks;

    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> getTasks() async {
    setIsLoading = true;

    final tasks = await _taskRepo.getTasks();

    if (tasks.isNotEmpty) {
      setTasks = tasks;
    }

    setIsLoading = false;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    setIsLoading = true;

    await _taskRepo.addTask();

    /// send the new task to backend

    _tasks.add(task);

    setIsLoading = false;

    notifyListeners();
  }

  void updateTask(Task task) {
     final tasks = _tasks.map((t) {
       final checkedTask =  t == task ? task.copyWith(
           isDone: true
       ) : t;

       //print(checkedTask.isDone.toString());

       return checkedTask;
      }).toList();

      setTasks = tasks;

      notifyListeners();
  }
}
