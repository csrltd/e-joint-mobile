import 'package:energy_joint/compents/buttons/buttons.dart';
import 'package:energy_joint/compents/forms/forms.dart';
import 'package:energy_joint/compents/headers/header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BigPageHeader(
              bg_image: 'assets/images/signup/sign_up_image.png',
              title_text: 'Ohh you feel \nHungry?',
              desc_text: 'We got you covered. Login to enter the food bank'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: LoginForm(),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/signup/bottom_image_clear.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: PrimaryButton(
                          onPressed: () {},
                          labelText: 'Login',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
