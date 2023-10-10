import 'package:e_joint_mobile/models/order_items.dart';

class Order {
  final String id;
  final String status;
  final String total_price;
  final String created_at;
  final List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.status,
    required this.total_price,
    required this.created_at,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        status: json['status'],
        total_price: json['total_price'],
        created_at: json['created_at'],
        orderItems: (json['ordered_items'] as List)
            .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
            .toList());
  }
}
