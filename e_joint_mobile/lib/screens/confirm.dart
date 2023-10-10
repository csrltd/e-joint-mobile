import 'package:e_joint_mobile/components/buttons/navigation.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SmallPageHeader(
              headerText: 'Thank you',
              headerImagePath: 'assets/images/signup/header_image.png',
              headerSmallImagePath:
                  'assets/images/signup/header_small_image.png'),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Your order has been receireceived and we are processing it. This may take 20-30 min',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Receipt',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 6),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1))),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 219, 219, 219),
                                    width: 1))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Chicken masala'), Text('25000Rwf')],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 6),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '35,000,00Rwf',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 6),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax 18%',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '5,320Rwf',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your paid',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '45,320.00Rwf',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/signup/bottom_image_color.png'),
                  fit: BoxFit.fill),
            ),
            child: const BottomNav(),
          )
        ],
      ),
    );
  }
}
