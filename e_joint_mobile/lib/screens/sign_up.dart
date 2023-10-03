import 'package:energy_joint/compents/bottoms/bottoms.dart';
import 'package:energy_joint/compents/forms/forms.dart';
import 'package:energy_joint/compents/headers/header.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
