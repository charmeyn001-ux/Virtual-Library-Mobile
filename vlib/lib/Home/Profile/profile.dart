import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Profile()));

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
