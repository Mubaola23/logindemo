import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget with ChangeNotifier {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    decideNavigation() {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen())));
      notifyListeners();
    }

    oninitial() {
      decideNavigation();

      notifyListeners();
    }

    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
