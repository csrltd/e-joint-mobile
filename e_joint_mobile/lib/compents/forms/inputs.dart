import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.labelText,
    required this.passowrd_filed,
    required this.inputController,
    super.key,
  });
  final String labelText;
  final bool passowrd_filed;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      obscureText: passowrd_filed,
    );
  }
}
