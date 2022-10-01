import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String token;
  const HomeScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(child: Text(token)),
    );
  }
}
