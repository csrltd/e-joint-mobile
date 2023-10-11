import 'dart:convert';

import 'package:e_joint_mobile/services/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<String?> createOrder(
    int userId, int restaurantId, double cartTotal) async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/orders/'),
    headers: {
      'Content-Type': 'application/Json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(
      {
        'user': userId,
        'restaurant': restaurantId,
        'total_price': cartTotal,
      },
    ),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data['order_id'];
  } else
    (error) {
      throw (error);
    };
  return null;
}

//Add to cart function
Future<bool> addToCartItemOrder(
    String order_id, int menuItemId, int quantity) async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/order-item/'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(
      {
        'order': order_id,
        'menu_item': menuItemId,
        'quantity': quantity,
      },
    ),
  );

  return response.statusCode == 201;
}
