import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/api/auth_service.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  final authService = ref.watch(authServiceProvider);
  return LoginService(authService);
});

class LoginService {
  final AuthService authService;

  LoginService(this.authService);

  Future<bool> authenticate(String username, String password) {
    return authService.login(username, password);
  }
}
