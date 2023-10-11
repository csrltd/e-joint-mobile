import 'dart:convert';
import 'package:e_joint_mobile/models/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:e_joint_mobile/constants/constants.dart';

final FlutterSecureStorage storage = FlutterSecureStorage();

Future<Map<String, dynamic>> sendPaymentInfo(
    String phoneNumber, double amountToPay) async {
  try {
    final String token = await storage.read(key: 'access_token') ?? '';
    final paymentUrl = '$baseUrl/checkout/';

    final response = await http.post(
      Uri.parse(paymentUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          'phone_number': phoneNumber,
          'amount_to_pay': amountToPay,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final transaction_id = responseBody['transaction_id'] as String;

      // Call getReceipt with the transaction_id
      final receipt = await getReceipt(transaction_id);

      return {
        'transaction_id': transaction_id,
        'receipt': receipt,
      };
    } else {
      throw Exception("Error processing payment: ${response.body}");
    }
  } catch (e) {
    print("Error in sendPaymentInfo: $e");
    throw e;
  }
}

Future<Map<String, dynamic>> getReceipt(String transaction_id) async {
  try {
    final String token = await storage.read(key: 'access_token') ?? '';
    final receiptUrl =
        '$baseUrl/receipt/$transaction_id/'; // Modified the URL to include the transaction_id

    final response = await http.get(
      Uri.parse(receiptUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Error fetching receipt: ${response.body}");
    }
  } catch (e) {
    print("Error in getReceipt: $e");
    throw e;
  }
}
