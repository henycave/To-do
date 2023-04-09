import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';
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
              const SizedBox(height: 20,),
              OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0,)
                  )),
                ),
                child: const Text("Sweet Home", style: TextStyle(color: Color(0xff343C13)),),
              ),
              const SizedBox(height: 20,),
              const Text("Grocery \nShopping", style: TextStyle(fontSize: 80),),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Time Left"),
                  Text("Assignee"),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("2h 45m", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                      Text("Dec 12,2022"),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 30.0,
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              const Text("Additional Description"),
              const SizedBox(height: 10,),
              const Text("We Have to Buy some fresh bread, fruit and vegetables."
                  " supply of Water is running out.", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
              const SizedBox(height: 30,),
              const Text("Created"),
              const SizedBox(height: 10,),
              Row(
                children: const [
                  Text("Dec 10, by Matt", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                  SizedBox(width: 5,),
                  CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 15.0,
                  ),
                ],
              ),
              const SizedBox(height: 60,),
              Align(
                alignment: Alignment.center,
                child: ActionSlider.standard(
                  height: 70,
                  toggleColor: Colors.white,
                    icon: const Icon(Icons.check),
                    child: const Text('Set as Done', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                    backgroundColor: const Color(0xff111C2F),
                    action: (controller) async {
                      controller.loading(); //starts loading animation
                      await Future.delayed(const Duration(seconds: 3));
                      controller.success(); //starts success animation
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
