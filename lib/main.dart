import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  List<String> task1 = ["Gym", "College", "Home", "Work"];
  List<String> tast2 = [
    "Leg day",
    "Presentation on list view",
    "Grab breakfast",
    "Go to work"
  ];
  List<String> date1 = [
    "1",
    "2",
    "4",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Center(child: Text('To Do List'))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: tiles(task1: task1, date1: date1, tast2: tast2),
        ),
      ),
    );
  }
}

class tiles extends StatelessWidget {
  const tiles({
    super.key,
    required this.task1,
    required this.date1,
    required this.tast2,
  });

  final List<String> task1;
  final List<String> date1;
  final List<String> tast2;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 100,
        itemCount: task1.length,
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
                  child: Text(date1[index])),
              title: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  task1[index],
                  style: TextStyle(fontSize: 25),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(tast2[index]),
              ),
              trailing: Icon(Icons.favorite),
            ),
          );
        });
  }
}
