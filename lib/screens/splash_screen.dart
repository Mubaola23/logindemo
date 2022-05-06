import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  decideNavigaion() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  void initState() {
    super.initState();
    decideNavigaion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen())),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              FlutterLogo(
                size: 100,
              ),
              Text(
                "Dribble",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
