import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/landing_page.dart';

class TextBoxController extends GetxController {
  var control1 = TextEditingController();
  var control2 = TextEditingController();

  void submit() {
    TaskData data = Get.find();
    int total = data.tasks.length + 1;
    RxMap<String, dynamic> newMap = RxMap({
      "title": control1.text,
      "description": control2.text,
      "date": total,
      "icon": Icons.favorite_border,
    });
    data.tasks.add(newMap);
    Get.back();
  }
}

class TaskData {
  RxList<RxMap<String, dynamic>> tasks = RxList([
    RxMap({
      "title": "Gym",
      "description": "go to the gym",
      "date": "1",
      "icon": Icons.favorite_border
    }),
    RxMap({
      "title": "School day",
      "description": "go to the college",
      "date": "2",
      "icon": Icons.favorite_border
    }),
    RxMap({
      "title": "Work day",
      "description": "go to the Skybase",
      "date": "3",
      "icon": Icons.favorite_border
    }),
  ]);
}
