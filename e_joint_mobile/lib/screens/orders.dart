import 'package:e_joint_mobile/components/buttons/navigation.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/models/ap_messages.dart';
import 'package:e_joint_mobile/models/data.dart';
import 'package:e_joint_mobile/models/orders.dart';
import 'package:e_joint_mobile/screens/order_items.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SmallPageHeader(
              headerText: 'Your Orders',
              headerImagePath: 'assets/images/signup/header_image.png',
              headerSmallImagePath:
                  'assets/images/signup/header_small_image.png'),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 500,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder<Result>(
                    future: fetchOrders(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData &&
                          snapshot.data!.error != null) {
                        return errorWidget(
                            snapshot.data!.error!); // Using our errorWidget
                      } else if (!snapshot.hasData ||
                          (snapshot.data!.data?.isEmpty ?? true)) {
                        return Text("No menu items found");
                      } else {
                        List<Order> orders = snapshot.data!.data!;

                        return ListView.builder(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              DateTime dateTime =
                                  DateTime.parse(orders[index].created_at);
                              String date_time =
                                  DateFormat('EEE, MMMM d, y. h:mm')
                                      .format(dateTime);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OrderItemsScreen(
                                          order: orders[index])));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15)),
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order Id: #${orders[index].id.substring(0, min(12, orders[index].id.length))}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('Date: $date_time'),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '${orders[index].total_price}Rwf'),
                                          Row(
                                            children: [
                                              orders[index].status ==
                                                      'Delivered'
                                                  ? const Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      color: Colors.green,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.watch_later,
                                                      color: Colors.amber,
                                                      size: 18,
                                                    ),
                                              const SizedBox(width: 6),
                                              Text('${orders[index].status}'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
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
          ))
        ],
      ),
    );
  }
}
