import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.labelText,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 22),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(labelText),
        ),
      ),
    );
  }
}
