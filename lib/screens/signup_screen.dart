import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/services/api_services.dart';
import 'package:logindemo/widgets/textfield.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  //Using frebase Auth
  final _auth = FirebaseAuth.instance;

  //Usin api service

  final _apiService = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  // const AppTextField(
                  //   title: "Name",
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const AppTextField(
                  //   title: "UserName",
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value!.isEmpty) return " pls enter a valid email";
                    },
                    title: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value!.isEmpty) return "password cannot be empty";
                    },
                    controller: passwordController,
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
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await _apiService.postRequest("/register", {
                                "email": emailController.text,
                                "password": passwordController.text
                              }).then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen())));

                              // await _auth
                              //     .createUserWithEmailAndPassword(
                              //         email: emailController.text.trim(),
                              //         password: passwordController.text)
                              //     .then((value) => Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const LoginScreen())));
                              emailController.clear();
                              passwordController.clear();
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Incorrect details"),
                                backgroundColor: Colors.black,
                              ));
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
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
      ),
    );
  }
}
