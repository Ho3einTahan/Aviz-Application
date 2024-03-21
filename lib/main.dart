import 'package:aviz_application/view/screen/login-screen.dart';
import 'package:aviz_application/view/screen/splash-screen.dart';
import 'package:aviz_application/view/screen/veryfication-code-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: VeryficationCodeScreen() ,
    );
  }
}