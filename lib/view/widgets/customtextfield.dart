import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text1,
    required this.maxLines,
    required this.controller,
  });

  final String text1;
  final int maxLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      cursorWidth: 2,
      cursorColor: Colors.white,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: text1),
      maxLines: maxLines,
    );
  }
}
