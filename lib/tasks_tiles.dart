import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:todo/utility/controllers.dart';

class TaskView extends StatelessWidget {
  final task = Get.arguments;
  TaskView({super.key});

  static const String routename = "/taskview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Center(child: (Text("Task Details")))),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "TITLE:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  task["title"],
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "DESCRIPTION:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  task["description"],
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "TASK NUMBER:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  task["date"].toString(),
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton.icon(
                    onPressed: () {
                      TaskData data = Get.find();

                      //print(task["date"]);
                      data.tasks
                          .removeWhere((map) => map["date"] == task["date"]);
                      Get.back();
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    label: Text(
                      "Mark as complete",
                    )),
              ),
            )
          ],
        ));
  }
}
