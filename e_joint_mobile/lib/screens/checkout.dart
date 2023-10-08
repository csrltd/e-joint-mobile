import 'package:e_joint_mobile/compents/brands/brands.dart';
import 'package:e_joint_mobile/compents/buttons/buttons.dart';
import 'package:e_joint_mobile/compents/forms/inputs.dart';
import 'package:e_joint_mobile/compents/headers/header.dart';
import 'package:e_joint_mobile/screens/confirm.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int? selectedValue;
  //mobile payment
  final _phoneNumberController = TextEditingController();
  final _codeController = TextEditingController();

  //card Paymment

  final _cardNumberController = TextEditingController();
  final _expiryDateNumberController = TextEditingController();
  final _csvNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SmallPageHeader(
              headerText: 'Checkout',
              headerImagePath: 'assets/images/signup/header_image.png',
              headerSmallImagePath:
                  'assets/images/signup/header_small_image.png'),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Payment Method',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Row(
                      children: [
                        Text('Mobile Money'),
                        SizedBox(width: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BrandCard(
                                brandImage:
                                    'assets/images/brands/mtn_logo.png'),
                            SizedBox(width: 12),
                            BrandCard(
                              brandImage:
                                  'assets/images/brands/airtel-logo.jpeg',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Row(
                      children: [
                        Text('Card Payment'),
                        SizedBox(width: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BrandCard(
                                brandImage:
                                    'assets/images/brands/visa_logo.jpeg'),
                            SizedBox(width: 12),
                            BrandCard(
                              brandImage:
                                  'assets/images/brands/mastercard_logo.jpeg',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Row(
                      children: [
                        Text('Cash on pick up'),
                        SizedBox(width: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BrandCard(
                                brandImage:
                                    'assets/images/brands/rwandan_francs.jpeg'),
                            SizedBox(width: 12),
                            BrandCard(
                              brandImage: 'assets/images/brands/us_dollar.jpeg',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                if (selectedValue == 1) ..._buildMobileMoneyForm(),
                if (selectedValue == 2) ..._buildCardPaymentForm(),
                if (selectedValue == 3) ..._buildCashPaymentCard(),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/signup/bottom_image_color.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ConfirmPage();
                      }));
                    },
                    labelText: 'Place order',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMobileMoneyForm() {
    return [
      Container(
        width: double.infinity,
        height: 250,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 245, 255),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              child: InputField(
                labelText: 'Code',
                passowrd_filed: false,
                inputController: _codeController,
              ),
            ),
            Container(
                width: 200,
                child: InputField(
                  labelText: 'Phone number',
                  passowrd_filed: false,
                  inputController: _phoneNumberController,
                )),
          ],
        ),
      )
    ];
  }

  List<Widget> _buildCardPaymentForm() {
    return [
      Container(
        width: double.infinity,
        height: 250,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 245, 255),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              labelText: 'Card Number',
              passowrd_filed: false,
              inputController: _cardNumberController,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  child: InputField(
                    labelText: 'Expiry Date',
                    passowrd_filed: false,
                    inputController: _expiryDateNumberController,
                  ),
                ),
                Container(
                    width: 200,
                    child: InputField(
                      labelText: 'CSV',
                      passowrd_filed: false,
                      inputController: _csvNumberController,
                    )),
              ],
            )
          ],
        ),
      )
    ];
  }

  List<Widget> _buildCashPaymentCard() {
    return [
      Container(
        width: double.infinity,
        height: 250,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 245, 255),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pay on pick up',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(height: 12),
            Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ],
        ),
      )
    ];
  }
}
