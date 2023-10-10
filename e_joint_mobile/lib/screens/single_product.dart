import 'package:e_joint_mobile/components/buttons/buttons.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/models/cart.dart';
import 'package:e_joint_mobile/models/menu_items.dart';
import 'package:e_joint_mobile/screens/dish_list.dart';
import 'package:e_joint_mobile/services/cart.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  SingleProductPage({super.key, required this.menuItem});
  final MenuItem menuItem;
  final cartService = CartService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallPageHeader(
              headerText: menuItem.name,
              headerImagePath: 'assets/images/signup/header_image.png',
              headerSmallImagePath:
                  'assets/images/signup/header_small_image.png'),
          //single product image
          Container(
            height: 550,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://127.0.0.1:8000${menuItem.image}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7)
                                ])),
                      ),
                      Positioned(
                        bottom: 32,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                menuItem.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                menuItem.price,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 210, 233, 251)),
                    child: ListView(
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 12),
                            Text(
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus..')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Preparation',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 12),
                            Text(
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus..')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 12),
                            Text(
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus..')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 100,
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
                    onPressed: () async {
                      bool success = await cartService.addToCart(CartItem(
                        id: menuItem.id.toString(),
                        name: menuItem.name,
                        price: double.parse(menuItem.price),
                        quantity: 1,
                      ));
                      if (success) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DishListPage();
                        }));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Failed to add item to cart. Please try again."),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    labelText: 'Add this to order',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
