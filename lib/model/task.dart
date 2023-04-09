import 'package:flutter/material.dart';

class Task {
  final String person;
  final String title;
  final DateTime time;
  final Color color;
  Task({required this.title, required this.person, required this.time, required this.color});

  static List<Task> tasks = [
    Task(person: "My self", time: DateTime.now(), title: "Walk My Dog", color: const Color(0xff9DECFF)),
    Task(person: "My self", time: DateTime.now(), title: "Go To Work", color: const Color(0xffFEF970)),
    Task(person: "My self", time: DateTime.now(), title: "Read A Book", color: const Color(0xffFFFFFF)),
    Task(person: "My self", time: DateTime.now(), title: "Exercise", color: const Color(0xff9DECFF)),
  ];
}