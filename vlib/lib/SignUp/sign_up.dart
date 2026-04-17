import 'package:flutter/material.dart';
import 'package:vlib/Animation/fade_animation.dart';
import 'package:vlib/SignIn/sign_in.dart';
import 'package:vlib/SignUp/agreements.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SignUp()));

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, String> header = {'Content-Type': 'application/json'};

  Future<void> signUpMethod() async {
    try {
      Map data = {
        'username': usernameController.text,
        'studentId': studentIdController.text,
        'program': selectedProgram == "Others"
            ? programController.text
            : selectedProgram,
        'password': passwordController.text,
      };

      String body = json.encode(data);

      var url = Uri.parse("https://192.168.1.7:5000");

      var response = await http.post(
        Uri.parse("$url/api/RegisterUser"), // change if your API differs
        body: body,
        headers: header,
      );

      var result = json.decode(response.body);

      print(result); // DEBUG response

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      } else {
        Get.snackbar(
          "Error",
          result['message'] ?? "Registration failed",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Server error or no connection",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController programController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  String? selectedProgram;

  //not sure
  bool isFormValid() {
    return usernameController.text.isNotEmpty &&
        studentIdController.text.isNotEmpty &&
        (selectedProgram != null &&
            (selectedProgram != "Others" ||
                programController.text.isNotEmpty)) &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    FadeAnimation(
                      1.3,
                      Text(
                        "Welcome to VLibrary",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 211, 209, 209),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
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
                      SizedBox(height: 20),

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
                                      color: const Color.fromARGB(48, 0, 0, 0),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),

                                child: TextField(
                                  onChanged: (value) => setState(() {}),
                                  controller: usernameController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z ]'),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
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
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),

                                child: TextField(
                                  onChanged: (value) => setState(() {}),
                                  controller: studentIdController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Student ID",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
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
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),

                                //Program
                                child: Column(
                                  children: [
                                    DropdownButtonFormField<String>(
                                      initialValue: selectedProgram,
                                      hint: Text(
                                        "Select Program",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),

                                      items:
                                          [
                                            "Bachelor of Science in Information Technology",
                                            "Bachelor of Science in Computer Science",
                                            "Bachelor of Science in Business Administration",
                                            "Hospitality Management",
                                            "Others",
                                          ].map((program) {
                                            return DropdownMenuItem(
                                              value: program,
                                              child: Text(program),
                                            );
                                          }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedProgram = value;
                                        });
                                      },
                                    ),

                                    if (selectedProgram == "Others")
                                      TextField(
                                        onChanged: (value) => setState(() {}),
                                        controller: programController,
                                        decoration: InputDecoration(
                                          hintText: "Enter your program",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                  ],
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
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),

                                child: TextField(
                                  onChanged: (value) => setState(() {}),
                                  controller: passwordController,
                                  obscureText: !isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    border: InputBorder.none,
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
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),

                                child: TextField(
                                  onChanged: (value) => setState(() {}),
                                  controller: confirmPasswordController,
                                  obscureText: !isConfirmPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isConfirmPasswordVisible =
                                              !isConfirmPasswordVisible;
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(
                            onPressed: isFormValid()
                                ? () async {
                                    if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Passwords do not match",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    await signUpMethod();
                                  }
                                : null,

                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 60),
                              backgroundColor: const Color.fromARGB(
                                213,
                                7,
                                33,
                                104,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Next",
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
                        1.6,
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIn()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 189, 189, 189),
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: "Log In",
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
            ],
          ),
        ),
      ),
    );
  }
}
