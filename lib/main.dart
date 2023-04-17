import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Center(child: Text('To Do List'))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tiles(),
        ),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  Tiles({
    super.key,
  });
  bool isFav = true;
  RxList<RxMap<String, dynamic>> tasks = RxList([
    RxMap({
      "title": "Gym",
      "description": "go to the gym",
      "date": "1",
      "icon": Icons.favorite
    }),
    RxMap({
      "title": "School day",
      "description": "go to the gym",
      "date": "2",
      "icon": Icons.favorite
    }),
    RxMap({
      "title": "Work day",
      "description": "go to the gym",
      "date": "3",
      "icon": Icons.favorite
    }),
  ]);

  @override
  Widget build(BuildContext context) {
    var isFav = true.obs;
    return ListView.builder(
        itemExtent: 100,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: Color.fromARGB(255, 104, 102, 102)),
              ),
              child: ListTile(
                minVerticalPadding: 20,
                leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 175, 206, 232),
                    child: Text(
                      tasks[index]["date"],
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
                            ? Icons.favorite
                            : Icons.favorite_border);
                    print(tasks);
                  },
                  icon: Obx(() => Icon(tasks[index]["icon"])),
                ),
              ));
        });
  }
}
