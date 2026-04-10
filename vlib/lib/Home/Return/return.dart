import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Return()));

class Return extends StatefulWidget {
  const Return({super.key});

  @override
  State<Return> createState() => ReturnState();
}

class ReturnState extends State<Return> {
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
