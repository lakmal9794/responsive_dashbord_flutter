import 'package:dashbord/constaints.dart';
import 'package:dashbord/panel_right/wiggle_graph.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  bool enable;
  Product({
    required this.name,
    this.enable = true,
  });
}

class PanelRight extends StatefulWidget {
  const PanelRight({Key? key}) : super(key: key);

  @override
  _PanelRightState createState() => _PanelRightState();
}

class _PanelRightState extends State<PanelRight> {
  List<Product> _products = [
    Product(name: "Bulb", enable: true),
    Product(name: "Porteble Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Tempory Tattos", enable: true),
    Product(name: "Laptop bag", enable: true),
    Product(name: "Travel bag", enable: true),
    Product(name: "Computer keybord", enable: true),
    Product(name: "Web cam", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Bookends", enable: true),
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
                      "Net Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "11.6% of sales Avg",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r"$32,100",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample1(),
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
                    _products.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        _products[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _products[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          _products[index].enable = newValue;
                        });
                      },
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
