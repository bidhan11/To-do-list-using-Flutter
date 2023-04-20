import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/tasks_tiles.dart';
import 'package:todo/utility/controllers.dart';

class Favourtie extends StatelessWidget {
  Favourtie({super.key});
  static const String routename = "/favourite";
  var isFav = true.obs;
  @override
  Widget build(BuildContext context) {
    TaskData data = Get.find();
    RxList<RxMap<String, dynamic>> tasks = data.tasks;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Favourites')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var iconname = tasks[index]["icon"];
                final faviconname = Icons.favorite;

                if (iconname != faviconname) {
                  return Container();
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5,
                          color: Color.fromARGB(255, 104, 102, 102)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(TaskView.routename,
                            arguments: tasks[index]);
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
                }
                ;
              }),
        ));
  }
}

  // var iconname = tasks[0]["icon"];
            // var faviconname = Icons.favorite;
            // print(faviconname);
            // print(iconname);
            // print(tasks.length);
