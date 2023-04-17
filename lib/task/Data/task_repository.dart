import 'package:to_do_river/task/Domain/task.dart';




class TaskRepository{
  Future<List<Task>> getTasks() async {
   await Future.delayed(const Duration(seconds: 1));

    /// It could be API
   return dummyTasks;
  }
}