import 'package:e_joint_mobile/components/buttons/buttons.dart';
import 'package:e_joint_mobile/components/forms/forms.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:flutter/material.dart';

class PinResetPage extends StatefulWidget {
  const PinResetPage({super.key});

  @override
  State<PinResetPage> createState() => _PinResetPageState();
}

class _PinResetPageState extends State<PinResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const BigPageHeader(
            bg_image: 'assets/images/signup/sign_up_image.png',
            desc_text: "Don't worry, let's help you \nreset it",
            title_text: 'Oooh, forgot\nyour PIN?'),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your number',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    Text(
                        'Enter the number you used and we will send you a code that will help you rest your pin')
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: const PinResetForm(),
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
    ));
  }
}
