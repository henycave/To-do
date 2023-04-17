import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do_river/task/Domain/task.dart';
import 'package:to_do_river/task/Presentation/task_detail.dart';

class TaskCard extends ConsumerWidget {
  final Task task;
  const TaskCard({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetail(task: task,)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        //color: const Color(0xff9DECFF),
        child: Padding(
          padding: const EdgeInsets.all(15.0).copyWith(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 25.0,
                  ),
                  Row(
                    children: [
                      Text(DateFormat('yyyy-MM-dd – kk:mm').format(task.time).toString(), textAlign: TextAlign.center,),
                      const SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        backgroundColor: task.isDone? Colors.teal: const Color(0xff172741),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Text(task.person),
              Text(task.title, style: TextStyle(fontSize: 25, decoration: task.isDone? TextDecoration.lineThrough:null),),
            ],
          ),
        ),
        color: task.color,
      ),
    );
  }
}
