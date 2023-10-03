import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.labelText,
    required this.passowrd_filed,
    super.key,
  });
  final String labelText;
  final bool passowrd_filed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      obscureText: passowrd_filed,
    );
  }
}
