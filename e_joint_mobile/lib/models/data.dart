import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_joint_mobile/models/menu_items.dart';
import 'package:e_joint_mobile/models/orders.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:e_joint_mobile/constants/constants.dart';

class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});
}

final baseUrl = Constants().baseUrl;
//menuItems
Future<Result<List<MenuItem>>> fetchMenuItems() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/menuitems/'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return Result(
          data: jsonResponse.map((data) => MenuItem.fromJson(data)).toList());
    } else {
      return Result(
          error: 'Unexpected error occurred with code ${response.statusCode}');
    }
  } catch (error) {
    if (error is SocketException) {
      return Result(error: 'Network Error: ${error.message}');
    } else if (error is TimeoutException) {
      return Result(error: 'Connection timeout. Please try again.');
    } else {
      return Result(error: 'An unexpected error occurred: $error');
    }
  }
}

//userOrders
Future<Result<List<Order>>> fetchOrders() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final ordersUrl = '$baseUrl/orders/';
  final response = await http.get(
    Uri.parse(ordersUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  print('TOKEN IS$token');
  if (response.statusCode == 200) {
    List responseBody = jsonDecode(response.body);
    return Result(
        data: responseBody.map((data) => Order.fromJson(data)).toList());
  } else {
    return Result(
        error: 'Unexpected error occurred with code ${response.statusCode}');
  }
}
