import 'package:e_joint_mobile/components/access_screens.dart';
import 'package:e_joint_mobile/components/buttons/navigation.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/screens/login.dart';
import 'package:e_joint_mobile/services/auth/models/auth_model.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void initState() {
    super.initState();
    Provider.of<AuthService>(context, listen: false)
        .checkAuthenticationStatusService();
  }

  Future<Map<String, String?>> fetchUserData() async {
    final storage = FlutterSecureStorage();
    Map<String, String?> userData = {
      'email': await storage.read(key: 'userEmail'),
      'first_name': await storage.read(key: 'userFirstName'),
      'last_name': await storage.read(key: 'userLastName'),
      // ... other fields
    };
    print('the data we have is $userData');
    return userData;
  }

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
                Consumer<AuthService>(builder: (context, authService, _) {
                  if (authService.isAuthenticated) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        //details card
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Column(
                            children: [
                              //cart title
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  GestureDetector(
                                    child: const Row(
                                      children: [
                                        Icon(Icons.edit_square,
                                            color: primaryColor),
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
                              FutureBuilder(
                                  future: fetchUserData(),
                                  builder: (context,
                                      AsyncSnapshot<Map<String, String?>>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Text('No user data found');
                                    } else {
                                      final data = snapshot.data!;
                                      print(data);
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('Full name:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(width: 12),
                                              Text(
                                                data['first_name']!,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Text(
                                                data['last_name']!,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          //email address
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Text('Email Addess:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(width: 12),
                                              Text(
                                                data['email']!,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          //phone number
                                          const SizedBox(height: 12),
                                          const Row(
                                            children: [
                                              Text('Phone number:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(width: 12),
                                              Text(
                                                ' +250 788 449 976',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          //physical address
                                          const SizedBox(height: 12),
                                          const Row(
                                            children: [
                                              Text('Address:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(width: 12),
                                              Text(
                                                ' Kigali Rwanda | Kicukiro Gatenga',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          //Logout
                                          const SizedBox(height: 24),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  authService.logoutService();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()));
                                                },
                                                child: const Row(
                                                  children: [
                                                    Icon(Icons.logout),
                                                    Text('Logout'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          ),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
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
                    );
                  }
                  return NotLogedInScreen(
                    accessTitle: 'Oops, you need to log in!!',
                    accessText:
                        'To view your account information, you need to login with username and password you used creating account',
                    buttonText: 'Click to log in',
                    icon: Icons.sentiment_neutral_rounded,
                    iconCOlor: Colors.yellow,
                  );
                }),

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
            ),
          ),
        ],
      ),
    );
  }
}
