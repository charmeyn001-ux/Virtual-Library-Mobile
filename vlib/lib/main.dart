import 'package:flutter/material.dart';
import 'package:vlib/Home/Borrow/borrow.dart';
import 'package:vlib/Home/Borrow/reserve.dart';
import 'package:vlib/Home/Inbox/inbox_page.dart';
import 'package:vlib/Home/Menu/Policies.dart';
import 'package:vlib/Home/MyBorrowedBooks/mybooks.dart';
import 'package:vlib/Home/Notification/notification_page.dart';
import 'package:vlib/Home/Profile/profile.dart';
import 'package:vlib/Home/Return/return.dart';
import 'package:vlib/Home/home_page.dart';
import 'package:vlib/SignIn/forget_password.dart';
import 'package:vlib/SignIn/sign_in.dart';
import 'package:vlib/SignUp/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LogIn(),
      routes: {
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
        '/notification': (context) => const NotificationPage(),
        '/inbox': (context) => const InboxPage(),
        '/policies': (context) => const Policies(),
        '/profile': (context) => const Profile(),
        '/borrowpage': (context) => const BorrowPage(),
        '/return': (context) => const Return(),
        '/mybooks': (context) => const MyBooks(),
        '/reserve': (context) => const Reserve(),
        '/forgot': (context) => const ForgotPassword(),
      },
    );
  }
}
