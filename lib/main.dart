import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/utility/controllers.dart';
import 'package:todo/utility/routes.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: LandingPage.routename,
      initialBinding: BindingsBuilder(() {
        Get.put(TaskData());
      }),
      getPages: routes,
    );
  }
}
