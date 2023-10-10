import 'dart:convert';
import 'package:e_joint_mobile/models/logged_in_user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class LoginService {
  Future<String?> login(String username, String password) async {
    final String loginUrl = 'http://127.0.0.1:8000/api/token/login/';
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'username': username,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {
      //get the token
      try {
        final responseBody = jsonDecode(response.body);
        final accessToken = responseBody['access'];
        final refreshToken = responseBody['refresh'];

        try {
          await storage.write(key: 'access_token', value: accessToken);
          await storage.write(key: 'refresh_token', value: refreshToken);
          loggedInUser(accessToken, username);
          return responseBody['access'];
        } catch (error) {
          rethrow;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }
}
