import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/utility/controllers.dart';

class TaskAdd extends StatelessWidget {
  TaskAdd({super.key});
  static const String routename = "/taskadd";
  final TextBoxController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add a task')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controller.control1,
              autofocus: true,
              decoration: InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controller.control2,
              autofocus: true,
              decoration: InputDecoration(
                  label: Text('Description'),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              maxLines: 5,
              minLines: 1,
            ),
          ),
          SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 21, 141, 238)),
                  onPressed: () {
                    controller.submit();
                  },
                  child: Text("Add Task"))),
        ],
      ),
    );
  }
}
