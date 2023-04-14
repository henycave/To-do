import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskListProvider = StateProvider<List<Task>>((_){
  return [
    Task(person: "My self", time: DateTime.now(), title: "Walk My Dog", color: const Color(0xff9DECFF), description: "go to the street where we always go and walk my dog"),
    Task(person: "My self", time: DateTime.now(), title: "Go To Work", color: const Color(0xffFEF970), description: "got to hustling for a living which i so passionatly"),
    Task(person: "My self", time: DateTime.now(), title: "Read A Book", color: const Color(0xffFFFFFF), description: "read the book i started last time i think i stopped at page 67"),
  ];
});

final colorIndexProvider = StateProvider<int>((_){
  return 0;
});



class Task {
  bool isDone;
  final String person;
  final String title;
  final DateTime time;
  final Color color;
  final String description;
  Task({required this.title, required this.person, required this.time, required this.color, required this.description, this.isDone = false});


}
