import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dashbord/app_bar/app_bar_widget.dart';
import 'package:dashbord/constaints.dart';
import 'package:dashbord/drawer/drawer_page.dart';
import 'package:dashbord/panel_center/panel_center_page.dart';
import 'package:dashbord/panel_left/panel_left_page.dart';
import 'package:dashbord/panel_right/panel_right_page.dart';
import 'package:dashbord/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;
  List<Widget> _icons = [
    Icon(
      Icons.add,
      size: 30,
    ),
    Icon(
      Icons.list,
      size: 30,
    ),
    Icon(
      Icons.compare_arrows,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWidget()),
        preferredSize: Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? PanelLeftPage()
            : currentIndex == 1
                ? PanelCenterPage()
                : PanelRight(),
        tablet: Row(
          children: [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelRight(),
            ),
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRight(),
            ),
          ],
        ),
        computer: Row(
          children: [
            Expanded(
              child: DrawerPage(),
            ),
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRight(),
            ),
          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              items: _icons,
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}
