import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  final storage = FlutterSecureStorage();

  Future<void> login(String token) async {
    await storage.write(key: 'jwt_token', value: token);
    print('Saved the token');
    print(token);
    _isAuthenticated = true;
    print(_isAuthenticated);
    notifyListeners();
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
    notifyListeners();
  }

  Future<void> checkAuthenticationStatus() async {
    String? token = await storage.read(key: 'jwt_token');
    _isAuthenticated = token != null;
    print('Read token is$_isAuthenticated');
    notifyListeners();
  }
}
