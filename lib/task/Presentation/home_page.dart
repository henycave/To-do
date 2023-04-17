import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_river/task/Application/task_services.dart';
import 'package:to_do_river/task/Application/task_services.dart';
import 'package:to_do_river/task/Presentation/add_task.dart';
import 'package:to_do_river/task/Presentation/components/task_card.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

bool isTasksSelected = true;

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskServiceProvider).getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskServiceProvider).tasks;
    final isLoading = ref.watch(taskServiceProvider).isLoading;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTask());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        color: const Color(0xff111C30),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 45.0).copyWith(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                    radius: 30.0,
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xff172741),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xff172741),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Good\nMorning",
                style: TextStyle(
                  color: Color(0xff5E8BFF),
                  fontSize: 60,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Today's Monday",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "75% Done",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Dec 12,2022",
                    style: TextStyle(color: Color(0xff4F5B78)),
                  ),
                  Text(
                    "Completed Tasks",
                    style: TextStyle(color: Color(0xff4F5B78)),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  //color: Colors.blue,
                  //width: 200,
                  //height: 300,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        'Tasks',
                        style: GoogleFonts.rajdhani(
                            textStyle: const TextStyle(fontSize: 30),
                            color: const Color(0xffC0CFEE)),
                      ),
                      Text(
                        'Boards',
                        style: GoogleFonts.rajdhani(
                            textStyle: const TextStyle(fontSize: 30),
                            color: const Color(0xffC0CFEE)),
                      ),
                    ],
                    views: [
                      isLoading
                          ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,))
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueAccent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        padding: const EdgeInsets.only(
                                            right: 8,
                                            top: 3,
                                            bottom: 3,
                                            left: 3),
                                        child: Row(
                                          children: const <Widget>[
                                            CircleAvatar(
                                              child: Text(
                                                "0",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              backgroundColor:
                                                  Color(0xff5E8BFE),
                                              radius: 14,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Boards",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            color: const Color(0xff5E8BFF),
                                            onPressed: () {},
                                            child: const Text("Active"),
                                          ),
                                          MaterialButton(
                                            onPressed: null,
                                            child: const Text('Done',
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 1,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          )
                                          // MaterialButton(
                                          //   color: const Color(0xff111C30),
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius: BorderRadius.circular(20),
                                          //   ),
                                          //   onPressed: () {},
                                          //   child: const Text("Done", style: TextStyle(color: Colors.white),),
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Consumer(
                                    builder: (BuildContext context,
                                        WidgetRef ref, Widget? child) {
                                      return ListView.builder(
                                        padding: const EdgeInsets.all(0)
                                            .copyWith(top: 5),
                                        itemCount: tasks.length,
                                        itemBuilder: (context, index) {
                                          return TaskCard(
                                            task: tasks[index],
                                          );
                                        },
                                      );
                                    },
                                  ))
                                ],
                              ),
                            ),
                      Container()
                    ],
                    onChange: (index) => () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
