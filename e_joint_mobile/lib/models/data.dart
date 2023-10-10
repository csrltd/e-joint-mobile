import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_joint_mobile/models/menu_items.dart';
import 'package:e_joint_mobile/models/orders.dart';
import 'package:http/http.dart' as http;
import 'package:e_joint_mobile/constants/constants.dart';

final baseUrl = Constants().baseUrl;
//menuItems
Future<List<MenuItem>> fetchMenuItems() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/menuitems/'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => MenuItem.fromJson(data)).toList();
    } else {
      throw Exception(
          'Unexpected error occurred with code  ${response.statusCode}');
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception(
          'Connection error. Please check your internet connection.');
    } else if (error is TimeoutException) {
      throw Exception('Connection timeout. Please try again.');
    } else {
      throw Exception('An unexpected error occurred: $error');
    }
  }
}

//userOrders
Future<List<Order>> fetchOrders() async {
  final ordersUrl = '$baseUrl/orders/';
  final response = await http.get(Uri.parse(ordersUrl));

  if (response.statusCode == 200) {
    List responseBody = jsonDecode(response.body);
    return responseBody.map((data) => Order.fromJson(data)).toList();
  } else {
    throw Exception();
  }
}
