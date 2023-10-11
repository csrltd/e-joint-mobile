import 'package:e_joint_mobile/screens/login.dart';
import 'package:flutter/material.dart';

class NotLogedInScreen extends StatelessWidget {
  const NotLogedInScreen({
    super.key,
    required this.accessTitle,
    required this.accessText,
    required this.buttonText,
    required this.icon,
    required this.iconCOlor,
  });
  final String accessTitle;
  final String accessText;
  final String buttonText;
  final IconData icon;
  final Color iconCOlor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconCOlor,
            size: 42,
          ),
          Text(
            accessTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              accessText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Container(
                width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(buttonText),
                    const Icon(Icons.arrow_right_alt)
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
