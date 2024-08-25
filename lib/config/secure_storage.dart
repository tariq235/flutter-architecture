import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sampleflutter/core/error_handling/error_handler.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    try {
      await _storage.write(key: 'authToken', value: token);
    } catch (e, stackTrace) {
      // Log the error using ErrorHandler
      ErrorHandler.logError(e, stackTrace);
    }
  }

  Future<String?> readToken() async {
    try {
      return await _storage.read(key: 'authToken');
    } catch (e, stackTrace) {
      // Log the error using ErrorHandler
      ErrorHandler.logError(e, stackTrace);
      return null;
    }
  }

  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: 'authToken');
    } catch (e, stackTrace) {
      // Log the error using ErrorHandler
      ErrorHandler.logError(e, stackTrace);
    }
  }
}
