import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> loggedInUser(
    String token, String username) async {
  const String userDataUrl = 'http://127.0.0.1:8000/api/accounts/user-data/';
  final response = await http.get(
    Uri.parse(userDataUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  final storage = FlutterSecureStorage();
  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    final userId = userData['id'].toString();
    final userEmail = userData['email'];
    final userUsername = userData['username'];
    final userFirstName = userData['first_name'];
    final userLastName = userData['last_name'];
    try {
      await storage.write(key: 'userId', value: userId);
      await storage.write(key: 'userEmail', value: userEmail);
      await storage.write(key: 'userUsername', value: userUsername);
      await storage.write(key: 'userFirstName', value: userFirstName);
      await storage.write(key: 'userLastName', value: userLastName);
    } catch (error) {
      rethrow;
    }
  } else {
    return null;
  }
  return null;
}
