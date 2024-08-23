import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  Future<bool> login(String username, String password) async {
    // Simulate an API call for authentication
    await Future.delayed(const Duration(seconds: 2));
    return username == 'user' &&
        password == 'password'; // Dummy authentication logic
  }
}
