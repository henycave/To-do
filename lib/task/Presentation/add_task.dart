import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_river/task/Application/task_services.dart';
import 'package:to_do_river/task/Application/task_services.dart';
import 'package:to_do_river/task/Domain/task.dart';


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
  String description = "";
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
    int index = ref.watch(taskServiceProvider).colorIndex;
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
        const Text("Task Description"),
        TextField(
          onChanged: (description) {
            this.description = description;
          },
        ),
        MaterialButton(
          onPressed: () async {
            Task task = Task(
              title: title,
              person: person,
              time: DateTime.now(),
              color: colors[index],
              description: description,
            );


          await  ref.read(taskServiceProvider.notifier).addTask(task);
            if (index < 2) {
              ref.read(taskServiceProvider).setColorIndex = index + 1;
            } else {
               ref.read(taskServiceProvider).setColorIndex = 0;
            }
            Navigator.pop(context);
          },
          child:  ref.watch(taskServiceProvider).isLoading ?
          CircularProgressIndicator.adaptive() :

           Text("Add Task"),
        )
      ],
    );
  }
}
