import 'package:e_joint_mobile/screens/home.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Sign Up',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
