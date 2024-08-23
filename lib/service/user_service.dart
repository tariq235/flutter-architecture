import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

class UserService {
  Future<String> getUsername() async {
    // Simulate fetching user data
    await Future.delayed(const Duration(seconds: 1));
    return 'John Doe'; // Dummy username
  }
}
