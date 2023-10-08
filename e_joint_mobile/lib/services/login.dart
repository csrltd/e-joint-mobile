import 'dart:convert';
import 'package:e_joint_mobile/services/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void storeToken(String success) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'jwt_token', value: success);
}

class LoginService {
  Future<String?> login(String username, String password) async {
    final String loginUrl = 'http://127.0.0.1:8000/api/token/login/';

    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'username': username,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(response.body);
      final token = responseBody['access'];
      AuthService().login(token);
      return responseBody['access'];
    } else {
      print("login error ${response.body}");
      return null;
    }
  }
}
