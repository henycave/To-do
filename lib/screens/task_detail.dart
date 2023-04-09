import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskDetail extends StatefulWidget {
  final Task task;

  const TaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: const Color(0xffFEF970),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.keyboard_arrow_down_sharp),
                    radius: 25.0,
                    backgroundColor: Color(0xff111C2F),
                  ),
                  CircleAvatar(
                    child: Icon(Icons.menu),
                    radius: 25.0,
                    backgroundColor: Color(0xff111C2F),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
