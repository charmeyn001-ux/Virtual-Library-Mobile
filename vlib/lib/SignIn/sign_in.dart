import 'package:flutter/material.dart';
import 'package:vlib/Animation/fade_animation.dart';
import 'package:vlib/Home/home_page.dart';
import 'package:vlib/SignUp/sign_up.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // method for API
import 'package:get/get.dart'; // method for API

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LogIn()));

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Map<String, String> header = {'Content-Type': 'application/json'}; //API

  Future<void> vlibraryLoginMethod(String username, String password) async {
    try {
      Map data = {'username': username, 'password': password};
      String body = json.encode(data);

      var url = Uri.parse("192.168.1.7"); // Not sure if ipadd

      var patient = await http.post(
        Uri.parse("$url/api/GetLogin"),
        body: body,
        headers: header,
      );

      var response = json.decode(patient.body);

      if (response['data'] != null) {
        if (patient.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (patient.statusCode == 400) {
          Get.snackbar(
            'Error',
            'No Patient Username Found!',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Record Found!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
// until here


  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;
  String? usernameError;
  String? passwordError;

  bool isPasswordVisible = false;

  void validateFields() {
    setState(() {
      isButtonEnabled =
          usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 3, 28, 99),
              const Color.fromARGB(255, 6, 17, 122),
              const Color.fromARGB(255, 6, 20, 148),
              const Color.fromARGB(255, 46, 59, 173),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        1,
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      FadeAnimation(
                        1.3,
                        Text(
                          "Welcome Back to VLibrary",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 211, 209, 209),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          FadeAnimation(
                            1.4,
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                            76,
                                            0,
                                            0,
                                            0,
                                          ),
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),

                                    child: TextField(
                                      controller: usernameController,
                                      onChanged: (value) => validateFields(),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[a-zA-Z]'),
                                        ),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            189,
                                            189,
                                            189,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                            76,
                                            0,
                                            0,
                                            0,
                                          ),
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),

                                    child: TextField(
                                      controller: passwordController,
                                      onChanged: (value) => validateFields(),
                                      obscureText: !isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                        border: InputBorder.none,

                                        //  EYE ICON HERE
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isPasswordVisible =
                                                  !isPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          FadeAnimation(
                            1.5,
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot');
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: const Color.fromARGB(149, 2, 69, 156),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),

                          FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: ElevatedButton(
                                onPressed: isButtonEnabled
                                    ? () {
                                        setState(() {
                                          usernameError =
                                              usernameController.text.isEmpty
                                              ? "Required"
                                              : null;
                                          passwordError =
                                              passwordController.text.isEmpty
                                              ? "Required"
                                              : null;
                                        });

                                        if (usernameError == null &&
                                            passwordError == null) {
                                          vlibraryLoginMethod(
                                            usernameController.text,
                                            passwordController.text,
                                          );
                                        }
                                      }
                                    : null, //Login+API

                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 60),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    3,
                                    28,
                                    99,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          FadeAnimation(
                            1.7,
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      189,
                                      189,
                                      189,
                                    ),
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Create Account",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          149,
                                          2,
                                          69,
                                          156,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 200,
              child: Image.asset('images/reading.png', width: 300, height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
