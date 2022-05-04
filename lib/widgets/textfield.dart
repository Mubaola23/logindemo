import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final bool obscureText;
  const AppTextField({Key? key, required this.title, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: obscureText,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.pink.shade200,
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
