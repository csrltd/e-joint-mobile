import 'package:flutter/material.dart';

class BigPageHeader extends StatelessWidget {
  const BigPageHeader({
    required this.bg_image,
    required this.desc_text,
    required this.title_text,
    super.key,
  });
  final String bg_image, title_text, desc_text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bg_image),
          fit: BoxFit.fill,
        ),
      ),
      // ignore: prefer_const_constructors
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title_text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 44),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                desc_text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SmallPageHeader extends StatelessWidget {
  const SmallPageHeader({
    required this.headerText,
    required this.headerImagePath,
    required this.headerSmallImagePath,
    super.key,
  });

  final String headerText;
  final String headerImagePath;
  final String headerSmallImagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(headerImagePath), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(headerSmallImagePath),
        ),
        Positioned(
          top: 50,
          left: 24,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 100, left: 100),
          child: Text(
            headerText,
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }
}
