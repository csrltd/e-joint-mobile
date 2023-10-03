import 'package:e_joint_mobile/compents/buttons/navigation.dart';
import 'package:e_joint_mobile/compents/headers/header.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SmallPageHeader(
            headerImagePath: 'assets/images/signup/header_image.png',
            headerSmallImagePath: 'assets/images/signup/header_small_image.png',
            headerText: 'Manage you\nAccount',
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  //details card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(children: [
                      //cart title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          GestureDetector(
                            child: const Row(
                              children: [
                                Icon(Icons.edit_square, color: primaryColor),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // account details
                      const SizedBox(height: 32),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Text('Full name:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' SIBOMANA Alphonse',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //email address
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('Email Addess:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' salphonse@compstaffing.com',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //phone number
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('Phone number:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' +250 788 449 976',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //phisical address
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('Address:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' Kigali Rwanda | Kicukiro Gatenga',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  //end of details card
                  const SizedBox(height: 24),
                  //deliver card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(children: [
                      //cart title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Delivery Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          GestureDetector(
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit_square,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // account details
                      const SizedBox(height: 32),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Text('City |Town:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' Kigali',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //email address
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('District:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' Kicukiro',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //phone number
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('Sector:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' Gatenga',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          //phisical address
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('Cell:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 12),
                              Text(
                                ' Gakoki',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  //end of delivery card
                  const SizedBox(
                    height: 24,
                  )
                ]),
              ),
              //navigation bar
              Container(
                height: 180,
                padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/signup/bottom_image_color.png'),
                      fit: BoxFit.fill),
                ),
                child: const BottomNav(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
