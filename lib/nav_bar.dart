import 'package:flutter/material.dart';

import 'menu_widget.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopNavBar();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return DesktopNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}

class DesktopNavBar extends StatefulWidget {
  const DesktopNavBar({Key? key}) : super(key: key);

  @override
  State<DesktopNavBar> createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  List hoverValue = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: () {},
            onHover: (val) {
              setState(() {
                hoverValue[0] = val;
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hoverValue[0]
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              duration: Duration(milliseconds: 400),
              child: Text(
                "Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {},
            onHover: (val) {
              setState(() {
                hoverValue[1] = val;
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hoverValue[1]
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              duration: Duration(milliseconds: 400),
              child: Text(
                "Blog",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {},
            onHover: (val) {
              setState(() {
                hoverValue[2] = val;
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: hoverValue[2]
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              duration: Duration(milliseconds: 400),
              child: Text(
                "Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatefulWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  State<MobileNavBar> createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  bool isTapped = false;
  var hoverList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          color: Colors.white,
          height: isTapped ? 200 : 60,
          duration: Duration(
            milliseconds: 500,
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "MENU",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 0,
          right: 0,
          child: Column(
            children: [
              MenuWidget(
                title: 'Work',
                isHovered: hoverList[0],
                onTap: () {},
                onHover: (val) {
                  setState(() {
                    hoverList[0] = val;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Blog',
                isHovered: hoverList[1],
                onTap: () {},
                onHover: (val) {
                  setState(() {
                    hoverList[1] = val;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Contact',
                isHovered: hoverList[2],
                onTap: () {},
                onHover: (val) {
                  setState(() {
                    hoverList[2] = val;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
