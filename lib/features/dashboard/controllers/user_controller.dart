import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/features/dashboard/services/user_service.dart';

final userControllerProvider =
    StateNotifierProvider.autoDispose<UserController, AsyncValue<String>>(
        (ref) {
  final userService = ref.watch(userServiceProvider);
  return UserController(userService);
});

class UserController extends StateNotifier<AsyncValue<String>> {
  final UserService userService;

  UserController(this.userService) : super(const AsyncValue.loading());

  Future<void> fetchUsername() async {
    try {
      final username = await userService.getUsername();
      state = AsyncValue.data(username);
    } catch (e, stackTrace) {
      state = AsyncValue.error('Failed to fetch username', stackTrace);
    }
  }
}
