import 'package:e_joint_mobile/components/forms/inputs.dart';
import 'package:e_joint_mobile/services/sign_up.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNmaeController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          inputController: _firstNameController,
          labelText: 'First name',
          passowrd_filed: false,
        ),
        const SizedBox(height: 24),
        InputField(
          inputController: _lastNmaeController,
          labelText: 'Last name',
          passowrd_filed: false,
        ),
        const SizedBox(height: 24),
        InputField(
          inputController: _emailAddressController,
          labelText: 'Email Address',
          passowrd_filed: false,
        ),
        const SizedBox(height: 24),
        InputField(
          inputController: _phoneNumberController,
          labelText: 'Phone Number',
          passowrd_filed: false,
        ),
        const SizedBox(height: 24),
        InputField(
          inputController: _passwordController,
          labelText: 'Create Pin',
          passowrd_filed: true,
        ),
        const SizedBox(height: 24),
        InputField(
          inputController: _passwordController,
          labelText: 'Confirm PIN',
          passowrd_filed: true,
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          child: const Text('Sign Up'),
          onPressed: _signUp,
        ),
      ],
    );
  }

  void _signUp() async {
    String password = _passwordController.text;
    String email = _emailAddressController.text;
    String first_name = _firstNameController.text;
    String last_name = _lastNmaeController.text;
    String phone = _phoneNumberController.text;

    SignUpService signUpService = SignUpService();
    bool success = await signUpService.signUp(
      first_name,
      last_name,
      phone,
      password,
      email,
    );
    if (success) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginForm();
      }));
    }
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNmaeController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          labelText: 'Phone number',
          passowrd_filed: false,
          inputController: _phoneNumberController,
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
    );
  }
}

class PinResetForm extends StatefulWidget {
  const PinResetForm({
    super.key,
  });

  @override
  State<PinResetForm> createState() => _PinResetFormState();
}

class _PinResetFormState extends State<PinResetForm> {
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          inputController: _passwordController,
          labelText: 'Enter you PIN',
          passowrd_filed: true,
        )
      ],
    );
  }
}
