import 'package:e_joint_mobile/compents/bottoms/bottoms.dart';
import 'package:e_joint_mobile/compents/forms/forms.dart';
import 'package:e_joint_mobile/compents/headers/header.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          BigPageHeader(
            bg_image: 'assets/images/signup/sign_up_image.png',
            desc_text: 'Create your account and \nenjoy the best of the cheifs',
            title_text: 'Best food in \nthe city',
          ),
          SizedBox(height: 50),
          //form
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: SignUpForm(),
                    ),
                    SizedBox(height: 20),
                    BottomStack(
                      image_url: 'assets/images/signup/bottom_image_clear.png',
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
