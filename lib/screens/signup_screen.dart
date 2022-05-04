import 'package:flutter/material.dart';
import 'package:logindemo/widgets/textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 100,
                ),
                const Text(
                  "Dribble",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const Text(
                  "Join the Dribble Community",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppTextField(
                  title: "Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppTextField(
                  title: "UserName",
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppTextField(
                  title: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppTextField(
                  obscureText: true,
                  title: "Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Create account",
                          style: TextStyle(color: Colors.pink),
                        ),
                        style: ButtonStyle(
                          // textStyle:
                          //     MaterialStateProperty.all(TextStyle(color: Colors.pink)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                    ),
                    const Expanded(
                      child: Text(
                        "By clicking on this , you agree to our terms and condition",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Or Signup  with",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.blueAccent,
                      child: Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: Text(
                        "Twitter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.green,
                      child: Text(
                        "Google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
