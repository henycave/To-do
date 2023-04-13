import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/task.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  List<Color> colors = [
    const Color(0xff9DECFF),
    const Color(0xffFEF970),
    const Color(0xffFFFFFF)
  ];
  String person = "";
  String title = "";
  late DateTime pickedDate;

  selectDate(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        pickedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = ref.read(colorIndexProvider);
    return Column(
      children: [
        const Text("Person"),
        TextField(
          onChanged: (person) {
            this.person = person;
          },
        ),
        const Text("Task Title"),
        TextField(
          onChanged: (title) {
            this.title = title;
          },
        ),
        MaterialButton(
          onPressed: (){
            Task task = Task(
              title: title,
              person: person,
              time: DateTime.now(),
              color: colors[index],
            );

            List<Task> tasks = ref.read(taskListProvider);
            tasks.add(task);
            ref.read(taskListProvider.notifier).state = tasks.toList();
            if (index < 2) {
              ref.read(colorIndexProvider.notifier).state++;
            } else {
              ref.read(colorIndexProvider.notifier).state = 0;
            }
            Navigator.pop(context);
          },
          child: const Text("Add Task"),
        )
      ],
    );
  }
}
