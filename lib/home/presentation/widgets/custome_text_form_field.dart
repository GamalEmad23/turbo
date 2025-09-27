import 'package:flutter/material.dart';

class CustomeTextFormField extends StatefulWidget {
  const CustomeTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.validate,
    this.secur,
    this.icon,
    this.buttonAction,
  });
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate;
  final VoidCallback? buttonAction;
  final bool? secur;
  final IconData? icon;

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      obscureText: widget.secur ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: widget.icon != null
            ? IconButton(
                onPressed:widget.buttonAction ,
                icon: Icon(widget.icon),
              )
            : null,
      ),
    );
  }
}
