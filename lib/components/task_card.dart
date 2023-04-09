import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_river/screens/task_detail.dart';
import '../model/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(8.0).copyWith(bottom: 15),
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
                      const CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xff172741),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Text(task.person),
              Text(task.title, style: const TextStyle(fontSize: 25),),
            ],
          ),
        ),
        color: task.color,
      ),
    );
  }
}
