// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustomeMaterialButton extends StatefulWidget {
  const CustomeMaterialButton({
    super.key,
    required this.buttonActio,
    required this.text,
    required this.color,
    required this.textColor, required this.hight, required this.width,
  });

  final VoidCallback buttonActio;
  final String text;
  final Color color;
  final Color textColor;
  final double hight;
  final double width;
  @override
  State<CustomeMaterialButton> createState() => _CustomeMaterialButtonState();
}

class _CustomeMaterialButtonState extends State<CustomeMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: MaterialButton(
        onPressed: widget.buttonActio,
        child: Text(widget.text, style: TextStyle(color: widget.textColor)),
        color: widget.color,
        height: widget.hight,
        minWidth:widget.width,
      ),
    );
  }
}
