import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/core/network/auth_api.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final authApi = ref.watch(authApiProvider);
  return UserService(authApi);
});

class UserService {
  final AuthApi _authApi;

  UserService(this._authApi);

  Future<String> getUsername() async {
    final response = await _authApi.getUserInfo();
    if (response.statusCode == 200) {
      return response.data['username']; // Assuming JSON response
    } else {
      throw Exception('Failed to fetch username');
    }
  }
}



// class UserService {
//   Future<String> getUsername() async {
//     // Simulate fetching user data
//     await Future.delayed(const Duration(seconds: 1));
//     return 'John Doe'; // Dummy username
//   }
// }
