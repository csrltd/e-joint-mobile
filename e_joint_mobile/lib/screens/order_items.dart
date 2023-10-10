import 'package:e_joint_mobile/components/buttons/navigation.dart';
import 'package:e_joint_mobile/components/headers/header.dart';
import 'package:e_joint_mobile/models/orders.dart';
import 'package:e_joint_mobile/styling/colors.dart';
import 'package:flutter/material.dart';

class OrderItemsScreen extends StatefulWidget {
  final Order order;

  OrderItemsScreen({required this.order});

  @override
  State<OrderItemsScreen> createState() => _OrderItemsScreenState();
}

class _OrderItemsScreenState extends State<OrderItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallPageHeader(
            headerText: 'Order Details ',
            headerImagePath: 'assets/images/signup/header_image.png',
            headerSmallImagePath: 'assets/images/signup/header_small_image.png',
          ),
          Container(
            height: 500,
            padding: EdgeInsets.all(24),
            child: ListView.builder(
              itemCount: widget.order.orderItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor.withOpacity(0.1)),
                  child: Row(
                    children: [
                      Container(
                        height: 72,
                        width: 92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://127.0.0.1:8000${widget.order.orderItems[index].image}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.order.orderItems[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.order.orderItems[index].price +
                                        "Rwf",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(widget.order.orderItems[index].description
                                  .substring(0, 60))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 180,
            padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/signup/bottom_image_color.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: const BottomNav(),
          )
        ],
      ),
    );
  }
}
