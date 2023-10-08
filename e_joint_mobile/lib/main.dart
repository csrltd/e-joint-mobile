import 'package:e_joint_mobile/compents/forms/forms.dart';
import 'package:e_joint_mobile/screens/home.dart';
import 'package:e_joint_mobile/screens/login.dart';
import 'package:e_joint_mobile/screens/sign_up.dart';
import 'package:e_joint_mobile/services/auth/models/auth_model.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Sign Up',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}
