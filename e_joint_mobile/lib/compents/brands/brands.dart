import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.brandImage,
  });

  final String brandImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: primaryColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(6),
        image:
            DecorationImage(image: AssetImage(brandImage), fit: BoxFit.cover),
      ),
    );
  }
}
