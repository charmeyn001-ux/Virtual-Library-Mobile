import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyBooks()));

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
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
