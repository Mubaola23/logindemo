import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/model/loginResponse.dart';
import 'package:logindemo/screens/home_screen.dart';
import 'package:logindemo/screens/signup_screen.dart';
import 'package:logindemo/widgets/textfield.dart';

import '../services/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;
  String? token;
  final _apiService = ApiServices();
  LoginResponse? _loginResponse;
  onDispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const img = "assets/demo.jpg";
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
                  // Image.asset(img,width: 50,),
                  const Text(
                    "Dribble",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const Text(
                    "Welcome back to Dribble",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
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

                              await _apiService.postRequest("/login", {
                                "email": emailController.text,
                                "password": passwordController.text
                              }).then((value) {
                                setState(() {
                                  token = _loginResponse?.token!;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              });
                              // await _auth
                              //     .signInWithEmailAndPassword(
                              //         email: emailController.text.trim(),
                              //         password: passwordController.text)
                              //     .then((value) => Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const HomeScreen())));
                              emailController.clear();
                              passwordController.clear();
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Incorrect login details"),
                                backgroundColor: Colors.black,
                              ));
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Login",
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
                      const Text(
                        "Remember me",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Remember me",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen())),
                            child: const Text(
                              "Sig Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Or sigin in with",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
