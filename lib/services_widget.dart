import 'package:flutter/material.dart';

class ServicesWidget extends StatefulWidget {
  final String imageUrl;
  final String title1, title2;
  final double height;
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final bool isHovered;
  final Color? titleColor;

  const ServicesWidget({
    Key? key,
    required this.title1,
    required this.title2,
    required this.imageUrl,
    this.onTap,
    this.onHover,
    required this.isHovered,
    required this.height,
    this.titleColor,
  }) : super(key: key);

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.isHovered ? Colors.transparent : Colors.grey.shade200,
        ),
      ),
      child: InkWell(
        onHover: widget.onHover,
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imageUrl,
                height: 80,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.title1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: widget.titleColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.title2,
                style: TextStyle(
                  fontSize: 18,
                  color: widget.titleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
