import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/features/auth/services/login_service.dart';

class LoginController extends StateNotifier<AsyncValue<bool>> {
  final LoginService loginService;

  LoginController(this.loginService) : super(const AsyncValue.data(false));

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final success = await loginService.authenticate(username, password);
      if (success) {
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error('Login failed', StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error('An error occurred', stackTrace);
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<bool>>((ref) {
  final loginService = ref.watch(loginServiceProvider);
  return LoginController(loginService);
});
