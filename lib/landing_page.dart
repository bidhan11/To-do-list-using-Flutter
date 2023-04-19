import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/add_task.dart';
import 'package:todo/favourties.dart';
import 'package:todo/main.dart';
import 'package:get/get.dart';
import 'package:todo/tasks_tiles.dart';
import 'package:todo/utility/controllers.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const String routename = "/landingpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('To Do List')),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Favourtie());
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 232, 107, 99),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(TaskAdd.routename);
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  Tiles({
    super.key,
  });

  bool isFav = true;

  @override
  Widget build(BuildContext context) {
    TaskData data = Get.find();
    RxList<RxMap<String, dynamic>> tasks = data.tasks;
    var isFav = true.obs;
    return Obx(
      () => ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: Color.fromARGB(255, 104, 102, 102)),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(TaskView.routename, arguments: tasks[index]);
                },
                child: ListTile(
                  minVerticalPadding: 20,
                  leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 175, 206, 232),
                      child: Text(
                        tasks[index]["date"].toString(),
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      tasks[index]["title"],
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Text(
                      tasks[index]["description"],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // isFav.value
                      //     ? tasks[index]["icon"] = Icons.favorite
                      //     : tasks[index]["icon"] = Icons.favorite;
                      // print(isFav.value);
                      isFav.value = !isFav.value;
                      tasks.value[index].update(
                          "icon",
                          (value) => isFav.value
                              ? Icons.favorite_border
                              : Icons.favorite);
                    },
                    icon: Obx(() => Icon(tasks[index]["icon"])),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
