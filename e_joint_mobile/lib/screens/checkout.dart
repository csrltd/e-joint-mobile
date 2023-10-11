import 'package:e_joint_mobile/components/brands/brands.dart';
import 'package:e_joint_mobile/components/buttons/buttons.dart';
import 'package:e_joint_mobile/components/forms/inputs.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/screens/confirm.dart';
import 'package:e_joint_mobile/services/payment.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final double cartTotal;
  const CheckoutPage(
      {super.key, required this.cartTotal, required String orderId});
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

Future<Map<String, dynamic>> processPaymentAndFetchReceipt(
    String phoneNumber, double amountToPay) async {
  final result = await sendPaymentInfo(phoneNumber, amountToPay);
  final transactionId = result['transaction_id'];
  final receipt = result['receipt'];
  return {'transactionId': transactionId, 'receipt': receipt};
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
    double vat = 18;
    double vatTax = widget.cartTotal * vat / 100;
    double grandTotal = widget.cartTotal + vatTax;

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
          const SizedBox(height: 20),
          Container(
            height: 480,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(bottom: 12, left: 24, right: 24),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: primaryColor.withOpacity(0.3),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Order Summary',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Your order total is: ${widget.cartTotal.toStringAsFixed(2)}Rw'),
                            SizedBox(height: 3),
                            Text('VAT Tax is: $vat%'),
                            SizedBox(height: 3),
                            Text('You are paying: ${grandTotal}Rwf')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24),
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
                                    brandImage:
                                        'assets/images/brands/us_dollar.jpeg',
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
              ],
            ),
          ),
          SizedBox(height: 20),
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
                      processPaymentAndFetchReceipt(
                          _phoneNumberController.text, widget.cartTotal);
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
