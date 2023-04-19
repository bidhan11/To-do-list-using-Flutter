import 'package:get/get.dart';
import 'package:todo/add_task.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/tasks_tiles.dart';
import 'package:todo/favourties.dart';
import 'package:todo/add_task.dart';
import 'package:todo/utility/controllers.dart';

var routes = [
  GetPage(
    name: LandingPage.routename,
    page: () => LandingPage(),
  ),
  GetPage(
    name: TaskView.routename,
    page: () => TaskView(),
  ),
  GetPage(
    name: Favourtie.routename,
    page: () => Favourtie(),
  ),
  GetPage(
    name: TaskAdd.routename,
    page: () => TaskAdd(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => TextBoxController());
      },
    ),
  )
];
