import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/config/secure_storage.dart';
import 'package:sampleflutter/core/error_handling/error_handler.dart';
import 'package:sampleflutter/core/network/auth_api.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  final authApi = ref.watch(authApiProvider);
  return LoginService(authApi);
});

class LoginService {
  final AuthApi _authApi;
  final secureStorage = SecureStorage();

  LoginService(this._authApi);

  Future<bool> authenticate(String username, String password) async {
    try {
      final response = await _authApi.login(username, password);
      if (response.statusCode == 200) {
        await secureStorage.writeToken(response.data['token']);
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      ErrorHandler.logError(e, stackTrace);
      return false;
    }
  }
}
