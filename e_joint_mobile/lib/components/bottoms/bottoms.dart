import 'package:e_joint_mobile/components/buttons/buttons.dart';
import 'package:flutter/material.dart';

class BottomStack extends StatelessWidget {
  const BottomStack({
    required this.image_url,
    super.key,
  });
  final String image_url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 150,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image_url), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              onPressed: () {},
              labelText: 'Sign up',
            ),
          ),
        ),
      ],
    );
  }
}
