import 'package:flutter/material.dart';
import 'package:quantum/views/user_homepage.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';
import 'views/admin_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quantum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // home: UserHomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/adminhomepage': (context) => AdminHomepage(),
        '/userhomepage': (context) =>UserHomePage(),
      },
    );
  }
}
