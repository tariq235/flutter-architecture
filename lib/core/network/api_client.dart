import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/app/main.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final environment = ref.watch(environmentProvider);
  return ApiClient(baseUrl: environment.apiUrl);
});

class ApiClient {
  final Dio _dio;

  ApiClient({required String baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  // Add other HTTP methods as needed
}
