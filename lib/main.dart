import 'package:explore_and_go_application/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Explore & GO",
      home: SafeArea(child: WelcomeScreen()),
    );
  }
}
