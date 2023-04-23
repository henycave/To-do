import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do_river/task/Application/task_services.dart';
import 'package:to_do_river/task/Domain/task.dart';

class TaskDetail extends ConsumerStatefulWidget {
  final Task task;

  const TaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  ConsumerState<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends ConsumerState<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    Task task = widget.task;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.03).copyWith(top: 3),
        color: task.color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    30.0,
                  ))),
                ),
                child: const Text(
                  "Sweet Home",
                  style: TextStyle(color: Color(0xff343C13)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Text(
                task.title,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.08,
                    decoration:
                        task.isDone ? TextDecoration.lineThrough : null),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Time Left"),
                  Text("Assignee"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${task.time.hour}h ${task.time.minute}m",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      Text(DateFormat.yMMMMd().format(task.time)),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 30.0,
                  ),
                ],
              ),
             SizedBox(
                height: MediaQuery.of(context).size.height*0.04,
              ),
              const Text("Additional Description"),
             SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Text(
                task.description,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.04,
              ),
              const Text("Created"),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.015,
              ),
              Row(
                children: [
                  Text(
                    "${DateFormat.MMMd().format(task.time)}, by ${task.person}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 15.0,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
              ),
              task.isDone
                  ? Container()
                  : Align(
                      alignment: Alignment.center,
                      child: ActionSlider.standard(
                          height: MediaQuery.of(context).size.height*0.1,
                          toggleColor: Colors.white,
                          icon: const Icon(Icons.check),
                          child: const Text(
                            'Set as Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          backgroundColor: const Color(0xff111C2F),
                          action: (controller) async {
                            controller.loading(); //starts loading animation
                            //    List<Task> tasks = ref.read(taskListProvider);
                            //  tasks[widget.taskIndex].isDone = true;

                            ref.read(taskServiceProvider.notifier).updateTask(task);
                            await Future.delayed(const Duration(seconds: 2));
                            controller.success();
                            await Future.delayed(const Duration(seconds: 1));
                            // ref.read(taskListProvider.notifier).state = tasks.toList();
                            //starts success animation
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
