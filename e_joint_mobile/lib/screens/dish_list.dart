import 'package:e_joint_mobile/components/access_screens.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/models/ap_messages.dart';
import 'package:e_joint_mobile/models/cart.dart';
import 'package:e_joint_mobile/screens/checkout.dart';
import 'package:e_joint_mobile/screens/menu.dart';
import 'package:e_joint_mobile/services/auth/models/auth_model.dart';
import 'package:e_joint_mobile/services/cart.dart';
import 'package:e_joint_mobile/services/orders.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class DishListPage extends StatefulWidget {
  const DishListPage({super.key});

  @override
  State<DishListPage> createState() => _DishListPageState();
}

class _DishListPageState extends State<DishListPage> {
  late List<CartItem>? cartItems = [];
  double? cartTotal;
  List? ItemsInCart;
  @override
  void initState() {
    super.initState();
    Provider.of<AuthService>(context, listen: false)
        .checkAuthenticationStatusService();
    _fetchCartItems();
  }

  Future<int?> _fetchLogenInUser() async {
    final storage = FlutterSecureStorage();
    final userId = await storage.read(key: 'userId');
    if (userId != null && userId.isNotEmpty) {
      return int.parse(userId);
    }
    return null;
  }

  _fetchCartItems() async {
    cartItems = await CartService().getCart();
    cartTotal = await CartService().getCartTotal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool cartIsEmpty = cartItems == null || cartItems!.isEmpty;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<AuthService>(
            builder: (context, authService, _) {
              print('Is user authenticates ${authService.isAuthenticated}');
              if (!authService.isAuthenticated) {
                return NotLogedInScreen(
                  accessTitle: 'Oops, login please',
                  accessText: 'To what you have in cart, you need to login',
                  buttonText: 'Login',
                );
                // WidgetsBinding.instance.addPostFrameCallback(
                //   (_) {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => LoginPage(),
                //       ),
                //     );
                //   },
                // );
              }
              // return Text('Here');
              return Column(
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
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
                                            await CartService().removeFromCart(
                                                cartItems[index].id);
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                                cartItems[index]
                                                    .price
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                        double cartTotal = snapshot.data!;
                                        return Text(
                                            '${cartTotal.toStringAsFixed(2)}Rwf');
                                      }
                                    },
                                  ))),
                              ElevatedButton(
                                  onPressed: () async {
                                    final userId = await _fetchLogenInUser();
                                    if (userId != null) {
                                      String? orderId = await createOrder(
                                          userId, 1, cartTotal!);
                                      if (orderId != null) {
                                        bool allItemsAdded = false;
                                        for (var item in cartItems!) {
                                          bool success =
                                              await addToCartItemOrder(
                                                  orderId,
                                                  int.parse(item.id),
                                                  (item.quantity).toInt());

                                          if (!success) {
                                            allItemsAdded = false;
                                            break;
                                          }
                                        }
                                        if (allItemsAdded) {
                                          if (cartItems != null) {
                                            for (var item in cartItems!) {
                                              CartService()
                                                  .removeFromCart(item.id);
                                              // _fetchCartItems();
                                            }
                                          }

                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return CheckoutPage();
                                              },
                                            ),
                                          );
                                        }
                                      } else {
                                        Container(
                                          child: errorWidget('errorMessage'),
                                        );
                                      }
                                    }
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: cartIsEmpty
                                        ? Text("Browse menu")
                                        : Text("Add this to order"),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
