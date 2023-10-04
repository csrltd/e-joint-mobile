import 'package:e_joint_mobile/compents/headers/header.dart';
import 'package:e_joint_mobile/models/cart.dart';
import 'package:e_joint_mobile/screens/checkout.dart';
import 'package:e_joint_mobile/screens/menu.dart';
import 'package:e_joint_mobile/services/cart.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DishListPage extends StatefulWidget {
  const DishListPage({super.key});

  @override
  State<DishListPage> createState() => _DishListPageState();
}

class _DishListPageState extends State<DishListPage> {
  late List<CartItem>? cartItems = [];
  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  _fetchCartItems() async {
    cartItems = await CartService().getCart();
    setState(() {});
  }

  Widget build(BuildContext context) {
    final bool cartIsEmpty = cartItems == null || cartItems!.isEmpty;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SmallPageHeader(
                headerText: 'Your Dish\nList',
                headerImagePath: 'assets/images/signup/header_image.png',
                headerSmallImagePath:
                    'assets/images/signup/header_small_image.png'),
            //Dishes
            Container(
              height: 550,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder(
                  future: CartService().getCart(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text(
                        'Your cart is empty.',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ));
                    } else {
                      List<CartItem> cartItems = snapshot.data!;
                      return ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            //dish
                            return Slidable(
                              key: const ValueKey(0),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await CartService()
                                          .removeFromCart(cartItems[index].id);
                                      _fetchCartItems();
                                    },
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
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItems[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        const Text(
                                          'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi..',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          cartItems[index].price.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
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
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 17),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: FutureBuilder<double>(
                              future: CartService().getCartTotal(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  double total = snapshot.data!;
                                  return Text('${total.toStringAsFixed(2)}Rwf');
                                }
                              },
                            ))),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return cartIsEmpty
                                    ? MenuPage()
                                    : CheckoutPage();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 17),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: cartIsEmpty
                                  ? Text("Browse menu")
                                  : Text("Add this to order"),
                            ))
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
