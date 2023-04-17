import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final taskListProvider = StateProvider<List<Task>>((_){
//   return [
//     Task(person: "My self", time: DateTime.now(), title: "Walk My Dog", color: const Color(0xff9DECFF), description: "go to the street where we always go and walk my dog"),
//     Task(person: "My self", time: DateTime.now(), title: "Go To Work", color: const Color(0xffFEF970), description: "got to hustling for a living which i so passionatly"),
//     Task(person: "My self", time: DateTime.now(), title: "Read A Book", color: const Color(0xffFFFFFF), description: "read the book i started last time i think i stopped at page 67"),
//   ];
// });

// final colorIndexProvider = StateProvider<int>((_){
//   return 0;
// });

List<Task> dummyTasks = [
  Task(
      person: "My self",
      time: DateTime.now(),
      title: "Walk My Dog",
      color: const Color(0xff9DECFF),
      description: "go to the street where we always go and walk my dog"),
  Task(
      person: "My self",
      time: DateTime.now(),
      title: "Go To Work",
      color: const Color(0xffFEF970),
      description: "got to hustling for a living which i so passionatly"),
  Task(
      person: "My self",
      time: DateTime.now(),
      title: "Read A Book",
      color: const Color(0xffFFFFFF),
      description:
          "read the book i started last time i think i stopped at page 67"),
];

class Task {
  bool isDone;
  String person;
  String title;
  DateTime time;
  Color color;
  String description;

  Task(
      {required this.title,
      required this.person,
      required this.time,
      required this.color,
      required this.description,
      this.isDone = false});

  Task copyWith({
    bool? isDone,
    String? person,
    String? title,
    DateTime? time,
    Color? color,
    String? description,
  }) {
    return Task(
        isDone: isDone ?? this.isDone,
        person: person ?? this.person,
        title: title ?? this.title,
        time: time ?? this.time,
        color: color ?? this.color,
        description: description ?? this.description);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.isDone == isDone &&
        other.person == person &&
        other.description == description &&
        other.title == title &&
        other.color == color &&
        other.time == time;
  }

  @override
  int get hashCode {
    return isDone.hashCode ^
        person.hashCode ^
        description.hashCode ^
        title.hashCode ^
        color.hashCode ^
        time.hashCode;
  }
}
