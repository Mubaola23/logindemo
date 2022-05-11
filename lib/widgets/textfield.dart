import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AppTextField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
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
            errorStyle: TextStyle(color: Colors.yellow),
            filled: true,
            fillColor: Colors.pink.shade200,
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
