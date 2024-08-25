import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/core/network/api_client.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final client = ref.watch(apiClientProvider);
  return AuthApi(client);
});

class AuthApi {
  // ignore: unused_field
  final ApiClient _client;

  AuthApi(this._client);

  Future<Response> login(String username, String password) async {
    // TODO: Replace this with actual API call once the backend is ready
    // Example: return _client.post('/auth/login', {'username': username, 'password': password});

    // Simulate a mock response
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'user' && password == 'password') {
      return Response(
        requestOptions: RequestOptions(path: '/auth/login'),
        statusCode: 200,
        data: {
          'success': true,
          'token': 'mocked_token_12345',
        },
      );
    } else {
      return Response(
        requestOptions: RequestOptions(path: '/auth/login'),
        statusCode: 401,
        data: {'success': false},
      );
    }
  }

  Future<Response> getUserInfo() async {
    // TODO: Replace this with actual API call once the backend is ready
    // Example: return _client.get('/auth/user');

    // Simulate a mock response
    await Future.delayed(const Duration(seconds: 1));
    return Response(
      requestOptions: RequestOptions(path: '/auth/user'),
      statusCode: 200,
      data: {'username': 'John Doe'},
    );
  }
}
