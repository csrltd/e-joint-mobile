import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  final String url = 'http://127.0.0.1:8000/api/sign-up/';

  Future<bool> signUp(String first_name, String last_name, String phone,
      String password, String email) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'password': password,
            'email': email,
            'first_name': first_name,
            'last_name': last_name,
            'phone': phone,
          },
        ),
      );
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (error) {
      print('Sing up error$error');
      return false;
    }
  }
}
