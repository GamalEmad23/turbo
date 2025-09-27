import 'package:flutter/material.dart';

class CustomeFooter extends StatefulWidget {
  const CustomeFooter({super.key, required this.fText, required this.sText, required this.buttonAction});

 final String fText;
 final String sText;
 final VoidCallback buttonAction;
  @override
  State<CustomeFooter> createState() => _CustomeFooterState();
}

class _CustomeFooterState extends State<CustomeFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.fText,style: TextStyle(color: Colors.grey,fontSize: 17),),
        GestureDetector(
          onTap:widget.buttonAction ,
          child: Text(widget.sText,style: TextStyle(color: Colors.blue.shade600,fontSize: 17),)),
        ]
      );
  }
}
