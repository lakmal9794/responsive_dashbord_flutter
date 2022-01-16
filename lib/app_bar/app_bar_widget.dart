import 'package:dashbord/constaints.dart';
import 'package:dashbord/responsive_layout.dart';
import 'package:flutter/material.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _curntSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: Image.asset("images/mapp.png"),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30,
              color: Colors.white,
              icon: Icon(Icons.menu),
            ),
          SizedBox(
            width: Constants.kPadding,
          ),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _curntSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                          color: _curntSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(Constants.kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: _curntSelectedButton == index
                              ? LinearGradient(
                                  colors: [
                                    Constants.redDark,
                                    Constants.otangeDark
                                  ],
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_curntSelectedButton],
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Constants.redDark, Constants.otangeDark],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Spacer(),
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                iconSize: 30,
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.otangeDark,
                radius: 30,
                child: Image.asset("images/profile.png"),
              ),
            ),
        ],
      ),
    );
  }
}
