import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SmallPageHeader(
                headerText: 'Make Your\nChoice',
                headerImagePath: 'assets/images/signup/header_image.png',
                headerSmallImagePath:
                    'assets/images/signup/header_small_image.png'),
            //Dishes
            Container(
              height: 550,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    //dish
                    return Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                          )
                        ],
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(right: 12),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/products/dishlist_image.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chicken stew',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi..',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '2500Rwf',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/signup/bottom_image_color.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(24),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryCard(
                                category_image_url:
                                    'assets/images/menu/startes.jpg',
                                category_name: 'Starters',
                              ),
                              CategoryCard(
                                  category_image_url:
                                      'assets/images/menu/main_courses.jpg',
                                  category_name: 'Main Courses'),
                              CategoryCard(
                                  category_image_url:
                                      'assets/images/menu/deserts.jpg',
                                  category_name: 'Sides'),
                              CategoryCard(
                                  category_image_url:
                                      'assets/images/products/chikcedstew.png',
                                  category_name: 'Desserts'),
                            ]),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryCard(
                                category_image_url:
                                    'assets/images/menu/beverages.jpg',
                                category_name: 'Beverages'),
                            CategoryCard(
                                category_image_url:
                                    'assets/images/menu/salads.jpg',
                                category_name: 'Salads'),
                            CategoryCard(
                                category_image_url:
                                    'assets/images/menu/spacials.jpg',
                                category_name: 'Specials'),
                            CategoryCard(
                                category_image_url:
                                    'assets/images/menu/kids_menu.jpg',
                                category_name: "Kid's Menu"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category_image_url,
    required this.category_name,
    super.key,
  });

  final String category_image_url;
  final String category_name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 17),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(category_image_url), fit: BoxFit.cover),
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          height: 60,
          width: 90,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3)),
          child: Center(
            child: Text(
              category_name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
