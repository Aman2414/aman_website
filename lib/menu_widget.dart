import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final String title;
  final bool isHovered;

  const MenuWidget(
      {Key? key,
      this.onTap,
      this.onHover,
      required this.title,
      required this.isHovered})
      : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color:
            !widget.isHovered ? Colors.black : Theme.of(context).primaryColor,
      ),
      height: 30,
      width: screenSize.width,
      child: InkWell(
        onTap: widget.onTap,
        onHover: widget.onHover,
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
