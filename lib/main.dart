import 'package:flutter/material.dart';

import 'Pages/Auth/login.dart';
import 'Pages/Auth/signup.dart';
import 'Pages/screens/home.dart';
import 'Pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => Login(),
        '/signup': (context) => const Signup(),
        '/home' : (context) => Home(),
      },
    );
  }
}
