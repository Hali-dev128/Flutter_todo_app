import 'package:flutter/material.dart';
import 'package:flutter_app/ForgotPasswordPage.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
      },
    );
  }

}