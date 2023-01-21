import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    super.key,
    required this.text,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });
  bool isPassword;
  String text;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool showPassword = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: showPassword,
      cursorColor: Colors.black,
      onChanged: (value) {},
      validator: widget.validator,
    );
  }
}
