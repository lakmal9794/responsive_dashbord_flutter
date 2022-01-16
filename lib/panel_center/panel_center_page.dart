import 'package:dashbord/constaints.dart';
import 'package:dashbord/panel_center/linear_graph.dart';
import 'package:flutter/material.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  List<Person> _persons = [
    Person(name: "Lakmal Vimukthi", color: Constants.orangLight),
    Person(name: "Shaveen", color: Constants.redLight),
    Person(name: "Vimukthi", color: Constants.blueLight),
    Person(name: "Chamara", color: Constants.orangLight),
    Person(name: "Akila", color: Constants.greenLight),
    Person(name: "Hansana", color: Constants.orangLight),
    Person(name: "Anjana", color: Constants.blueLight),
    Person(name: "Prabath", color: Constants.redLight),
    Person(name: "Chamara", color: Constants.greenLight),
    Person(name: "Danura", color: Constants.orangLight),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  child: ListTile(
                    title: Text(
                      "Product Available",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "45% Products Available",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        "18,100",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        child: Text(
                          _persons[index].name.substring(0, 1),
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: _persons[index].color,
                      ),
                      title: Text(
                        _persons[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
