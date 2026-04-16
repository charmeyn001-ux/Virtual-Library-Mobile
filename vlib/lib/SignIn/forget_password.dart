import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 34, 88),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
