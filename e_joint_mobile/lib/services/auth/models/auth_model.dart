import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  final storage = FlutterSecureStorage();

  Future<void> loginService() async {
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logoutService() async {
    await storage.delete(key: 'access_token');
    notifyListeners();
  }

  Future<void> checkAuthenticationStatusService() async {
    String? token = await storage.read(key: 'access_token');
    _isAuthenticated = token != null;
    print('Read token is$_isAuthenticated');
    notifyListeners();
  }
}
