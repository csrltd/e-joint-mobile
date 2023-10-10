import 'package:flutter/material.dart';

Widget errorWidget(String errorMessage) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: Colors.red, size: 50),
        SizedBox(height: 20),
        Text('Oops! Something went wrong.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(errorMessage, textAlign: TextAlign.center),
      ],
    ),
  );
}
