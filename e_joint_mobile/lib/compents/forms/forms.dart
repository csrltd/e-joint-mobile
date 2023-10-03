import 'package:e_joint_mobile/compents/forms/inputs.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputField(
          labelText: 'Full name',
          passowrd_filed: false,
        ),
        SizedBox(height: 24),
        InputField(
          labelText: 'Email Address',
          passowrd_filed: false,
        ),
        SizedBox(height: 24),
        InputField(
          labelText: 'Phone Number',
          passowrd_filed: false,
        ),
        SizedBox(height: 24),
        InputField(
          labelText: 'Create Pin',
          passowrd_filed: true,
        ),
        SizedBox(height: 24),
        InputField(
          labelText: 'Confirm PIN',
          passowrd_filed: true,
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputField(
          labelText: 'Phone number',
          passowrd_filed: false,
        ),
        SizedBox(
          height: 24,
        ),
        InputField(
          labelText: 'Enter you PIN',
          passowrd_filed: true,
        )
      ],
    );
  }
}

class PinResetForm extends StatelessWidget {
  const PinResetForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputField(
          labelText: 'Enter you PIN',
          passowrd_filed: true,
        )
      ],
    );
  }
}
