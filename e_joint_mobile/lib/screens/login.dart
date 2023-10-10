import 'package:e_joint_mobile/components/buttons/buttons.dart';
import 'package:e_joint_mobile/components/forms/inputs.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/screens/home.dart';
import 'package:e_joint_mobile/screens/sign_up.dart';
import 'package:e_joint_mobile/services/login.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
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
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Wrap(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              text:
                                  "If you don't have an account with us, it's okay, "),
                          WidgetSpan(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                            },
                            child: const Text(
                              'Sign up here',
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color: primaryColor),
                            ),
                          ))
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      InputField(
                        labelText: 'Phone number',
                        passowrd_filed: false,
                        inputController: _usernameController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InputField(
                        labelText: 'Enter you PIN',
                        passowrd_filed: true,
                        inputController: _passwordController,
                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/signup/bottom_image_color.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: PrimaryButton(
                          onPressed: () {
                            _login();
                          },
                          labelText: 'Sign up',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _login() async {
    final String username = _usernameController.text;
    final password = _passwordController.text;

    LoginService loginService = LoginService();

    String? access = await loginService.login(
      username,
      password,
    );
    if (access != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    }
  }
}
