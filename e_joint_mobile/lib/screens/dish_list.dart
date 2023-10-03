import 'package:energy_joint/compents/headers/header.dart';
import 'package:energy_joint/screens/checkout.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:energy_joint/styling/colors.dart';
import 'package:flutter/material.dart';

class DishListPage extends StatefulWidget {
  const DishListPage({super.key});

  @override
  State<DishListPage> createState() => _DishListPageState();
}

class _DishListPageState extends State<DishListPage> {
  @override
  Widget build(BuildContext context) {
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
                                horizontal: 35, vertical: 17),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(child: Text('25750Rwf'))),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return CheckoutPage();
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
                              child: const Text("Add this to order"),
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
