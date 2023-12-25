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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextFormField(
            cursorColor: const Color.fromARGB(31, 78, 77, 77),
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: text1),
            maxLines: maxLines,
          ),
        ),
      ),
    );
  }
}
