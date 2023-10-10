import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String?> createOrder(
    int userId, int restaurantId, double cartTotal) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/orders/'),
    headers: {
      'Content-Type': 'application/Json',
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
  }
  return null;
}

//Add to cart function
Future<bool> addToCartItemOrder(
    String order_id, int menuItemId, int quantity) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/order-item/'),
    headers: {'Content-Type': 'application/json'},
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
