import 'package:e_joint_mobile/compents/buttons/navigation.dart';
import 'package:e_joint_mobile/compents/headers/header.dart';
import 'package:e_joint_mobile/models/data.dart';
import 'package:e_joint_mobile/models/menu_items.dart';
import 'package:e_joint_mobile/screens/single_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SmallPageHeader(
            headerText: 'Dine | Lunch\nWith Us',
            headerImagePath: 'assets/images/signup/header_image.png',
            headerSmallImagePath: 'assets/images/signup/header_small_image.png',
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //content
                Container(
                  height: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FutureBuilder<List<MenuItem>>(
                    future: fetchMenuItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text("No menu items found");
                      } else {
                        List<MenuItem> menuItems = snapshot.data!;

                        return SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 16,
                            children: menuItems.map((menuItem) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SingleProductPage(
                                            menuItem: menuItem);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 32) /
                                          2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 12,
                                          spreadRadius: 1,
                                          color: Color.fromARGB(
                                              255, 225, 242, 250))
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 190,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'http://127.0.0.1:8000${menuItem.image}'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 24),
                                            Text(
                                              '${menuItem.name}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(height: 12),
                                            const Text(
                                              'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi..',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                //end of content
                //bottom nav
                Container(
                  height: 180,
                  padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/signup/bottom_image_color.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: const BottomNav(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
